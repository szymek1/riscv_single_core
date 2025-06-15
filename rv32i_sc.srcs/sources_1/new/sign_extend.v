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
    input  wire [24:0]            src, // span [24:0] for covering with the same hardware: I-Type, S-Type and U-Type instructions with immediate fields
                                       // occupying different parts of an instruction
    input  wire [1:0]             imm_src,
    output wire [`DATA_WIDTH-1:0] imm_signed
    );
    
    reg imm_to_return[11:0];
    always @(*) begin
        case (imm_src) 
            2'b00  : imm_to_return = src[24:13];             // I-Type
            2'b01  : imm_to_return = {src[24:18], src[4:0]}; // S-Type
            default: imm_to_return = 12'b0;
        endcase
    end
    assign imm_signed = {{20{imm_to_return[11]}}, imm_to_return};
    
endmodule
