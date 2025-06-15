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
    input                            rst,
    input  wire [`OPCODE_WIDTH-1:0]  opcode,
    input  wire [`FUNC3_WIDTH-1:0]   func3,
    input  wire [`FUNC7_WIDTH-1:0]   func7,
    output reg                       branch, // if high then branch/jump
    output reg                       mem_read,
    output reg                       mem_2_reg,
    output reg  [3:0]                alu_ctrl,
    output reg                       mem_write,
    output reg                       alu_src,
    output reg                       reg_write
    );
    
    always @(posedge rst) begin
        if (rst) begin
            mem_read <= 1'b0;
        end
    end
    
    reg [1:0] alu_op;
    always @(*) begin
        case (opcode) 
            /*
            `R_TYPE_OP: begin
            end
            */
            
            `LD_TYPE_OP: begin
                branch    = 1'b0;
                mem_read  = 1'b1;
                mem_2_reg = 1'b1;
                mem_write = 1'b0;
                alu_src   = 1'b1;
                reg_write = 1'b1; 
                alu_op    = `LD_SW_TYPE_ALU_OP;  
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
                branch    = 1'b0;
                mem_read  = 1'b0;
                mem_2_reg = 1'b0;
                mem_write = 1'b0;
                alu_src   = 1'b0;
                reg_write = 1'b0;
            end
        endcase
    end
    
    always @(*) begin
        case(alu_op)
            /*
            `R_TYPE_ALU_OP: begin
            end
            */
            
            `LD_SW_TYPE_ALU_OP: alu_ctrl = `ADD;
            
            /*
            `BEQ_TYPE_ALU_OP: begin
            end
            */
            default           : alu_ctrl = `NOP;
        endcase
    end
    
endmodule
