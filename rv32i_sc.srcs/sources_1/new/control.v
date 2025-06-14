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
    input  wire [`FUNC3_WIDTH-1:0]   func3,
    input  wire [`FUNC7_WIDTH-1:0]   func7,
    output reg                       branch, // if high then branch/jump
    output reg                       mem_read,
    output reg                       mem_2_reg,
    output reg  [1:0]                alu_op,
    output reg                       mem_write,
    output reg                       alu_src,
    output reg                       reg_write
    );
    
    always @(*) begin
        case (opcode) 
            /*
            `R_TYPE_OP: begin
            end
            */
            
            `LD_TYPE_OP: begin
                
            end
            
            /*
            `SD_TYPE_OP: begin
            end
            */
            
            /*
            `BEQ_TYPE_OP: begin
            end
            */
            default: begin
            end
        endcase
    end
    
endmodule
