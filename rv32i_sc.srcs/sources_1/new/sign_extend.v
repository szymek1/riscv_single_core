`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ISAE
// Engineer: Szymon Bogus
// 
// Create Date: 06/13/2025 06:15:19 PM
// Design Name: 
// Module Name: sign_extend
// Project Name: rv32i_sc
// Target Devices: Zybo Z7-20
// Tool Versions: 
// Description: Sign extension module. Take 12-bit long bits stream and use its
//              MSB to decide which sign occupies higher bits of 32-bit output.
// 
// Dependencies: rv32i_params.vh
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`include "rv32i_params.vh"


module sign_extend(
    input  wire [11:0]            src,
    output wire [`DATA_WIDTH-1:0] imm_signed
    );
    
    assign imm_signed = {{20{src[11]}}, src};
    
endmodule
