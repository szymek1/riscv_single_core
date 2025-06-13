`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ISAE
// Engineer: Szymon Bogus
// 
// Create Date: 06/13/2025 07:44:19 PM
// Design Name: 
// Module Name: control
// Project Name: rv32i_sc
// Target Devices: Zybo Z7-20
// Tool Versions: 
// Description: Control module
// 
// Dependencies: rv32i_params.vh, rv32i_control.vh
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`include "rv32i_params.vh"
`include "rv32i_control.vh"


module control(
    input  wire [`OPCODE_WIDTH-1:0]  opcode,
    output wire                      branch, // if high then branch/jump
    output wire                      mem_read,
    output wire                      mem_2_reg,
    output wire [1:0]                alu_op,
    output wire                      mem_write,
    output wire                      alu_src,
    output wire                      reg_write
    );
endmodule
