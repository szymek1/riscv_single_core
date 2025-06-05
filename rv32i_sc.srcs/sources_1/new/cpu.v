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
    input  wire                   pc_select,
    input  wire [3:0]             wrt_inst,
    input  wire [`DATA_WIDTH-1:0] inst_wrt_addr,
    input  wire [`DATA_WIDTH-1:0] inst_wrt_dat,
    input  wire                   rd_inst,
    output wire [`DATA_WIDTH-1:0] pc_curr,
    output wire [`DATA_WIDTH-1:0] curr_instr
    );
    
    wire [`DATA_WIDTH-1:0] pc_nxt;  // next PC
    
    // Instruction fetch stage
    pc PC(
        .clk(clk),
        .rst(rst),
        .stall(fetch_stall),
        .pc_select(pc_select),
        .pc_in(pc_curr),
        .pc_out(pc_curr),
        .pc_next(pc_nxt) 
    );
    
    wire                   rsta_busy;
    wire                   rstb_busy;
    wire [`DATA_WIDTH-1:0] inst_rd_addr;
    
    wire fetch_ready = ~rstb_busy & ~rsta_busy;
    assign inst_rd_addr = pc_curr;
    
    instruction_fetch_bram INSTR_MEM (
        .clka(clk),
        .wea(wrt_inst),
        .addra(inst_wrt_addr),
        .dina(inst_wrt_dat),
        .clkb(clk),
        .rstb(rst),
        .enb(rd_inst & fetch_ready),
        .addrb(inst_rd_addr),
        .doutb(curr_instr),
        .rsta_busy(rsta_busy),
        .rstb_busy(rstb_busy)
    );
    
endmodule
