`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ISAE
// Engineer: Szymon Bogus
// 
// Create Date: 06/08/2025 11:12:18 AM
// Design Name: 
// Module Name: pc_latch
// Project Name: rv32i_sc
// Target Devices: Zybo Z7-20
// Tool Versions: 
// Description: Component of if/id register
// 
// Dependencies: rv32i_params.vh
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`include "rv32i_params.vh"


module pc_latch(
    input clk,
    input wire  [`DATA_WIDTH-1:0] pc_rlt,
    output wire [`DATA_WIDTH-1:0] pc_lt
    );
    
    reg [`DATA_WIDTH-1:0] pc_latched;
    always @(posedge clk) begin
        pc_latched <= pc_rlt;
    end
    
    assign pc_lt = pc_latched;
endmodule
