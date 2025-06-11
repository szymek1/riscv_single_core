`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ISAE
// Engineer: Szymon Bogus
// 
// Create Date: 06/09/2025 12:25:05 PM
// Design Name: 
// Module Name: if_stage_tb
// Project Name: rv32i_sc
// Target Devices: Zybo Z7-20
// Tool Versions: 
// Description: Testbench for instruction fetch module
// 
// Dependencies: rv32i_params.vh
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`include "rv32i_params.vh"


module if_stage_tb(

    );
    
    reg clk;
    reg rst;
    
    // if_stage testbench inputs
    wire                   bram_busy_w; // supplied by BRAM
    wire                   bram_busy_r; // supplied by BRAM
    wire [`DATA_WIDTH-1:0] pc_curr;     // supplied by pc
    wire [`DATA_WIDTH-1:0] instr_curr;  // supplied by BRAM
    
    // if_stage testbench outputs
    wire [`DATA_WIDTH-1:0] if_pc;       // input to BRAM
    wire [`DATA_WIDTH-1:0] if_instr;    // fetched instruction
    wire                   pc_stall;    // input to pc
    wire                   bram_r_enb;  // input to BRAM
    
    // BRAM inputs
    // Write port
    reg  [3:0]             w_sel;
    reg                    w_enb;
    reg  [9:0]             w_add;
    reg  [`DATA_WIDTH-1:0] w_dat;
    // Read port
    // enb  - supplied by if_stage (bram_r_enb)
    // addrb- supplied by if_stage (if_pc)
    
    // BRAM outputs
    // bram_busy_w- already provided to if_stage
    // bram_busy_r- already provided to if_stage
    // doutb      - already provided to if_stage (instr_curr)
    
    pc PC(
        .clk(clk),
        .rst(rst),
        .stall(pc_stall),
        .pc_in(1'b0),     // no jump test for now
        .pc_out(pc_curr),
        .pc_next()        // unwired, might be removed later on
    );
    
    bram32 INSTR_MEM (
        .clk(clk),
        .rst(rst),
        // Write port inputs
        .ws(w_sel),
        .we(w_enb),
        .addra(w_add),
        .dina(w_dat),
        // Read port inputs
        .enb(bram_r_enb),
        .addrb(if_pc),
        // Outputs
        .bram_busy_r(bram_busy_r),
        .bram_busy_w(bram_busy_w),
        .doutb(instr_curr)
    );
    
    if_stage IF_STAGE (
        .clk(clk),
        .rst(rst),
        // Inputs
        .bram_busy_w(bram_busy_w), // BRAM provided inputs
        .bram_busy_r(bram_busy_r), // BRAM provided inputs
        .pc_curr(pc_curr),         // PC provided inputs
        .instr_curr(instr_curr),  // BRAM provided inputs
        // Outputs
        .if_pc(if_pc),            // Input to BRAM
        .if_instr(if_instr),      // Fetched instruction
        .pc_stall(pc_stall),      // Input to pc
        .bram_r_enb(bram_r_enb)   // Input to BRAM
    );
    
    // Memory array to hold .hex file contents
    reg [`DATA_WIDTH-1:0] init_mem [0:`I_BRAM_DEPTH-1]; // Assume 1024 depth
    integer i;
    
    task display_results;
        begin
            $display("Time=%0t | writing=%b | reading=%b \n| is_read=%b | is_pc_stall=%b \n| if_pc=%h | if_instr=%h",
            $time,
            bram_busy_w,
            bram_busy_r,
            bram_r_enb,
            pc_stall,
            if_pc,
            if_instr);
        end
    endtask
    
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // toggle clk every 5 time units
    end
    
    integer inst_num;
    integer ints_cnt;
    initial begin
        inst_num = 4;
        
        // Initialize signals
        rst     = 1'b1;
        w_sel   = 4'b0000; 
        w_enb   = 1'b0;
        w_add   = 10'b0;
        w_dat   = 32'h0;
        
        // Load .hex file into init_mem
        $readmemh("add_registers.new.hex", init_mem);
        
        // Test 1: Reset behavior
        $display("Test 1: Checking reset behavior");
        #10; // Wait 1 cycle
        display_results();
        if (pc_stall == 1'b1 && bram_r_enb == 1'b0 && if_pc == 0 && if_instr == 0) begin
            $display("Test 1: PASS - All signals reset correctly");
        end else begin
            $display("Test 1: FAIL - Expected pc_stall=1, bram_r_enb=0, if_pc=0, if_instr=0, got: pc_stall=%b, bram_r_enb=%b, if_pc=%h, if_instr=%h",
                     pc_stall, bram_r_enb, if_pc, if_instr);
        end
        
        // Test 2: Loading program to BRAM
        rst = 1'b0;
        w_enb   = 1'b1;
        #10; // Ensure reset is deasserted
        $display("Test 2: Loading %0d instructions from .hex file", inst_num);
        for (i = 0; i < inst_num; i = i + 1) begin
            // w_enb   = 1'b1;
            w_sel   = 4'b1111;
            w_add   = i; // Write to address i
            w_dat   = init_mem[i]; // Data from .hex file
            #10; // Wait 1 cycle for write
            w_sel   = 4'b0000;
            display_results();
            if (bram_busy_w == 1'b1 && bram_r_enb == 1'b0 && pc_stall == 1'b1) begin
                $display("Test 2: Write to address %h successful", w_add);
            end else begin
                $display("Test 2: Write to address %h failed, busy_w=%b, bram_r_enb=%b, pc_stall=%b",
                         w_add, bram_busy_w, bram_r_enb, pc_stall);
            end
        end
        w_enb = 1'b0; // Disable writes after loop
        #10;
        
        // Test 3: Verify fetched instructions
        $display("Test 3: Verifying fetched instructions");
        #10; // Wait 1 cycle for first fetch to register address
        for (i = 0; i < inst_num; i = i + 1) begin
            #10; // Wait 1 cycle for instruction to appear
            display_results();
            if (if_pc == i * 4 && if_instr == init_mem[i] && bram_r_enb == 1'b1 && pc_stall == 1'b0) begin
                $display("Test 3: Fetch from address %h successful, got if_pc=%h, if_instr=%h",
                         i * 4, if_pc, if_instr);
            end else begin
                $display("Test 3: Fetch from address %h failed, expected if_pc=%h, if_instr=%h, got if_pc=%h, if_instr=%h, bram_r_enb=%b, pc_stall=%b",
                         i * 4, i * 4, init_mem[i], if_pc, if_instr, bram_r_enb, pc_stall);
            end
        end
        
        #10;
        $display("All tests completed");
        $finish;
    end
    
endmodule
