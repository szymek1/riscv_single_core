`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ISAE
// Engineer: Szymon Bogus
// 
// Create Date: 06/07/2025 10:12:11 PM
// Design Name: 
// Module Name: bram32
// Project Name: rv32i_sc
// Target Devices: Zybo Z7-20
// Tool Versions: 
// Description: Custom 32-bit BRAM: currently under the assumption that it returns
//              within one clock cycle, which is unrealistic.
// 
// Dependencies: rv32i_params.vh
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`include "rv32i_params.vh"


module bram32 (
    input                         clk,
    input                         rst,
    // Write port inputs
    input  wire [9:0]             w_addr,
    input  wire [`DATA_WIDTH-1:0] w_dat,
    input  wire                   w_enb,
    // Read port inputs
    input  wire [9:0]             r_addr,
    // Outputs
    output reg  [`DATA_WIDTH-1:0] r_dat,
);

    reg [`DATA_WIDTH-1:0] mem [0:`I_BRAM_DEPTH-1];
    
    integer i;
    always @(posedge clk) begin
        if (rst) begin
            for (i = 0; i < `I_BRAM_DEPTH; i = i + 1) begin
                mem[i] <= 32'h0;
            end
        end
        if (!rst && w_enb) begin
            mem[w_addr] <= w_dat;
        end
    end
    
    always @(r_addr) begin
        if (r_enb && !w_enb && !rst) begin
            r_dat <= mem[r_addr];
        end
    end

endmodule