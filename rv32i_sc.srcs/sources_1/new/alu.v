`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ISAE
// Engineer: Szymon Bogus
// 
// Create Date: 06/13/2025 05:19:21 PM
// Design Name: 
// Module Name: alu
// Project Name: rv32i_sc
// Target Devices: Zybo Z7-20
// Tool Versions: 
// Description: ALU
// 
// Dependencies: rv32i_params.vh
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`include "rv32i_params.vh"


module alu(
    input  wire [1:0]              alu_ctrl, // 2-bit long alu opcode provided by the main control module
    input  wire                    alu_src, //  1-bit indicating if the second source comes from the regfile or sign_extend module
    input  wire [`INSTR_WIDTH-1:0] src1,    //  1st source
    input  wire [`INSTR_WIDTH-1:0] src2,    //  2nd source
    output reg  [`INSTR_WIDTH-1:0] results,
    output reg                     zero     //  Comparison results (for branch evaluation)
    );
    
    always @(*) begin
         case (alu_ctrl)
            
         endcase
    end
    
endmodule
