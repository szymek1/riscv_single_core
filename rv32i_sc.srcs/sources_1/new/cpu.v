`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ISAE
// Engineer: Szymon Bogus
// 
// Create Date: 06/05/2025 09:40:10 PM
// Design Name: 
// Module Name: cpu
// Project Name: rv32i_sc
// Target Devices: Zybo Z7-20
// Tool Versions: 
// Description: 32-bit, in-order, integer only, RISC-V with 5 stgae pipeline
// 
// Dependencies: rv32i_params.vh
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`include "rv32i_params.vh"


module cpu(
    input      clk,
    input      rst,

    // Pipeline control signals
    input wire fetch_stall,  // Stall Fetch stage
    input wire fetch_flush,  // Flush Fetch stage (for future use)

    // Currently for testbenching
    // PC input
    input  wire                   pc_select,
    // Instruction BRAM, write port input
    input  wire                   w_enb,
    input  wire [3:0]             w_sel,
    input  wire [`DATA_WIDTH-1:0] w_add,
    input  wire [`DATA_WIDTH-1:0] w_dat,
    // Instruction BRAM, read port input
    input  wire                   r_enb,
    // Outputs
    output wire [`DATA_WIDTH-1:0] pc_curr,
    output wire [`DATA_WIDTH-1:0] curr_instr
    );

    // PC -> IF stage
    wire [`DATA_WIDTH-1:0] pc_c;
    
    // IF stage -> IF/ID reg
    wire [`DATA_WIDTH-1:0] if_pc;
    wire [`DATA_WIDTH-1:0] if_stage;
    
    // IF/ID reg -> ID stage
    wire [`DATA_WIDTH-1:0] id_pc;
    wire [`DATA_WIDTH-1:0] id_stage;
    
    
    // Instruction fetch stage
    wire [`DATA_WIDTH-1:0] pc_nxt;  // next PC
    pc PC(
        .clk(clk),
        .rst(rst),
        .stall(fetch_stall),
        .pc_select(pc_select),
        .pc_in(32'h0), // Ground pc_in when not jumping
        .pc_out(pc_c),
        .pc_next(pc_nxt)
    );
    
    
    
    
endmodule
