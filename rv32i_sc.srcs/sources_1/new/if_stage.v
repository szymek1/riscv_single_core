`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ISAE
// Engineer: Szymon Bogus
// 
// Create Date: 06/09/2025 11:20:39 AM
// Design Name: 
// Module Name: if_stage
// Project Name: rv32i_sc
// Target Devices: Zybo Z7-20
// Tool Versions: 
// Description: Instruction fetch controll module. This module is responsible for controlling
//              which pc and instruction are moved to if/id register. Moreover, it decides when 
//              pc stall and instruction BRAM can be read depending on the write status of BRAM.
//              Finally, this module decides which pc address is used to read the correct instruction
//              from BRAM.
// 
// Dependencies: rv32i_params.vh
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`include "rv32i_params.vh"


module if_stage(
    input rst,
    input bram_busy_w,
    input bram_busy_r,
    input pc_curr,
    input instr_curr,
    output if_pc,
    output if_instr,
    output pc_stall,
    output bram_r_enb
    );
    
    
    
endmodule
