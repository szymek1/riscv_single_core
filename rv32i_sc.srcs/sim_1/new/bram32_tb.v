`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ISAE
// Engineer: Szymon Bogus
// 
// Create Date: 06/08/2025 08:25:11 PM
// Design Name: 
// Module Name: bram32_tb
// Project Name: rv32i_sc
// Target Devices: Zybo Z7-20
// Tool Versions: 
// Description: Testbench for instruction BRAM
// 
// Dependencies: rv32i_params.vh
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`include "rv32i_params.vh"


module bram32_tb(

    );
    
    // Memory array to hold .hex file contents
    reg [`DATA_WIDTH-1:0] init_mem [0:`I_BRAM_DEPTH-1]; // Assume 1024 depth
    integer i;
    
    reg clk;
    reg rst;
    
    // Write port
    reg [3:0]             w_sel; // Write select
    reg                   w_enb; // Write enable
    reg [9:0]             w_add; // Write address
    reg [`DATA_WIDTH-1:0] data_in;
    
    // Read port
    reg                   r_enb; // Read enable
    reg [9:0]             r_add; // Read address
    
    // Outputs
    wire                   busy_reading;
    wire                   busy_writing;
    wire [`DATA_WIDTH-1:0] instruction;
    
    task display_results;
        begin
            $display("Time=%0t | write=%b | read=%b \n| w_add=%h | r_add=%h \n | busy_w=%b | busy_r=%b | instr=%h",
            $time,
            w_enb,
            r_enb,
            w_add,
            r_add,
            busy_writing,
            busy_reading,
            instruction);
        end
    endtask
    
    bram32 uut(
        .clk(clk),
        .rst(rst),
        // Write
        .ws(w_sel),
        .we(w_enb),
        .addra(w_add),
        .dina(data_in),
        // Read
        .enb(r_enb),
        .addrb(r_add),
        //Output
        .bram_busy_r(busy_reading),
        .bram_busy_w(busy_writing),
        .doutb(instruction)
    );
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // toggle clk every 5 time units
    end
    
    integer inst_num;
    integer ints_cnt;
    initial begin
        inst_num = 4;
        
        // Reset
        rst     = 1'b1;
        w_sel   = 4'b0;
        w_enb   = 1'b0;
        w_add   = 10'b0;
        data_in = 32'h0;
        r_enb   = 1'b0;
        r_add   = 10'b0;
        
        // Load .hex file into init_mem
        $readmemh("add_registers.new.hex", init_mem);
        
        // Test 1: Reset behavior
        #10; // 1 cycle
        display_results();
        if (busy_reading == 1'b0 && busy_writing == 1'b0 && instruction == 0) begin
            $display("Test 1: PASS- all values reset")
        end else begin
            $display("Test 1: FAIl- expected values reset, got: busy_r=%b, busy_w=%b, instruction=%h", busy_reading, busy_writing, instruction);
        end
    
        $display("All tests completed");
        $finish;
    end
    
endmodule
