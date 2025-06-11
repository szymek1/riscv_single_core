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
    
    reg clk;
    reg rst;
    
    // Write ports inputs
    reg  [9:0]             w_addr;
    reg  [`DATA_WIDTH-1:0] w_dat;
    reg                    w_enb;
    
    // Read port inputs
    reg  [9:0]             r_addr;
    
    // Outputs
    wire [`DATA_WIDTH-1:0] instruction;
    
    task display_results;
        begin
            $display("Time=%0t | w_enb=%b | r_enb=%b | w_addr=%h | r_addr=%h | instr=%b=h",
                     $time,
                     w_enb,
                     r_enb,
                     w_addr,
                     r_addr,
                     instruction);
        end
    endtask
    
    bram32 uut(
        .clk(clk),
        .rst(rst),
        // Write ports inputs
        .w_addr(w_addr),
        .w_dat(w_dat),
        .w_enb(w_enb),
        // Read ports inputs
        .r_addr(r_addr),
        // Outputs
        .r_dat(instruction)
    );
    
    // Program will be stored here before loading to the BRAM
    reg [`DATA_WIDTH-1:0] init_mem [0:`I_BRAM_DEPTH-1];
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end
    
    initial begin
        // Reset
        rst <= 1'b1;
        w_addr <= 10'h0;
        w_dat <= 32'h0;
        w_enb <= 1'b0;
        r_enb <= 1'b0;
        r_addr <= 32'h0;
    
        $display("All tests finished");
        $finish;
    end
    
endmodule
