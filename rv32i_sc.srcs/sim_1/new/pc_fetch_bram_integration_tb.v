`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ISAE
// Engineer: Szymon Bogus
// 
// Create Date: 06/05/2025 10:27:05 PM
// Design Name: 
// Module Name: pc_fetch_bram_integration_tb
// Project Name: rv32i_sc
// Target Devices: Zybo Z7-20
// Tool Versions: 
// Description: testbench validating correct cooperation between PC and instruction
//              memory (BRAM) inside cpu module
// 
// Dependencies: cpu.v
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`include "rv32i_params.vh"


module pc_fetch_bram_integration_tb(

    );
    
    reg clk; // General clock shared by both ports of instruction memory
    reg rst;
    
    // Write port A (used to write instruction into BRAM)
    reg [3:0]  wrt_inst;    
    reg [31:0] inst_wrt_addr;  
    reg [31:0] inst_wrt_dat;   
    
    // Read port B (fetching instruction)
    reg         rd_inst;      
    wire [31:0] curr_instr; // Current instruction as indicated by PC
    wire [31:0] pc_curr;    // Current instruction address
    
    // Pipeline controll
    reg fetch_stall;
    reg fetch_flush;
    
    reg         pc_select; // jump 
    
    // Memory array to hold .hex file contents
    reg [31:0] init_mem [0:1023]; // Assume 1024 depth
    integer i;
    
    cpu uut(
        .clk(clk),
        .rst(rst),
        .fetch_stall(fetch_stall),
        .fetch_flush(fetch_flush),
        .pc_select(pc_select),
        .wrt_inst(wrt_inst),
        .inst_wrt_addr(inst_wrt_addr),
        .inst_wrt_dat(inst_wrt_dat),
        .rd_inst(rd_inst),
        .pc_curr(pc_curr),
        .curr_instr(curr_instr)
    );
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end
    
    reg [31:0] instr_expt;
    task display_results;
        begin
            $display("Time=%0t | read=%b | instruction=%h | inst_addr=%h | inst_expct=%h | jump_addr=%b",
                     $time,
                     rd_inst,
                     curr_instr,
                     pc_curr,
                     instr_expt,
                     pc_select);
        end
    endtask
    
    
    integer inst_num; // total number of instructions
    integer inst_cnt; // instructions counter
    initial begin
        inst_num = 4;
        
        rst = 1'b1; // Active-high reset
        pc_select = 1'b0;
        rd_inst = 1'b0;
        wrt_inst = 4'b0000;
        inst_wrt_addr = 32'h0;
        inst_wrt_dat = 32'h0;
        fetch_stall = 1'b1;
        fetch_flush = 1'b0;
        
        // Load .hex file into init_mem
        $readmemh("add_registers.new.hex", init_mem);
        
        // Test 1: Reset behavior
        #10;
        display_results();
        if (rst == 1'b1)
            $display("Test 1: PASS- Reset active");
        else
            $display("Test 1: FAIL- Reset not-active");
            
        // Initialize instruction memory with a program
        rst = 1'b0;
        #10;
        for (i = 0; i < inst_num; i = i + 1) begin 
            inst_wrt_addr = i * 4; // 4-byte aligned addresses (0x0, 0x4, 0x8, 0xC)
            inst_wrt_dat = init_mem[i];
            wrt_inst = 4'b1111; 
            #10;           
            wrt_inst = 4'b0000; 
            $display("Initialized address %h with instruction %h", inst_wrt_addr, inst_wrt_dat);
        end
        
        rd_inst = 1'b1;    
        fetch_stall = 1'b0; // allow PC to incerement
        #10;
        
        // Test 2: Read instructions according to progressing PC
        for (inst_cnt = 0; inst_cnt < inst_num; inst_cnt = inst_cnt + 1) begin
            instr_expt <= init_mem[inst_cnt];
            #10;
            display_results();
            if (pc_curr == `BOOT_ADDR + `PC_STEP*inst_cnt) begin
                $display("Test 2.1: PASS- correct PC");
            end else begin
                $display("Test 2.1: FAIL - Incorrect PC: expected %h, got %h", 
                    `BOOT_ADDR + `PC_STEP * inst_cnt, pc_curr);
            end
            // #10;
            if (curr_instr == init_mem[inst_cnt]) begin
                $display("Test 2.2: PASS- correct instruction");
            end else begin
                $display("Test 2.2: FAIL - Incorrect instruction: expected %h, got %h",
                         init_mem[inst_cnt], curr_instr);
            end
            // #10;
            
        end
        
        // Test 3: Disable read mid-operation
        rd_inst = 1'b0;
        #20;
        display_results();
        $display("Test 3: Read disabled");
    
        #50;
        $display("All tests completed");
        $finish;
    
    end
    
endmodule