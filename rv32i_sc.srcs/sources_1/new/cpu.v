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

    wire [`DATA_WIDTH-1:0] pc_nxt;  // next PC
    
    wire [`DATA_WIDTH-1:0] instr_fetch;   // <- NEW: output of BRAM
    reg  [`DATA_WIDTH-1:0] instr_latched; // <- IF/ID register
    wire [`DATA_WIDTH-1:0] pc_latched;

    // Instruction fetch stage
    pc PC(
        .clk(clk),
        .rst(rst),
        .stall(fetch_stall),
        .pc_select(pc_select),
        .pc_in(32'h0), // Ground pc_in when not jumping
        .pc_out(pc_curr),
        .pc_next(pc_nxt)
    );
    
    pc_latch IF_ID_PC_REG(
        .clk(clk),
        .pc_rlt(pc_curr),
        .pc_lt(pc_latched)
    );

    wire                   rsta_busy;
    wire                   rstb_busy;
    wire [`DATA_WIDTH-1:0] inst_rd_addr;

    wire fetch_ready = ~rstb_busy & ~rsta_busy;
    // assign inst_rd_addr = pc_latched;

    /*
    instruction_fetch_bram INSTR_MEM (
        .clka(clk),
        .wea(wrt_inst),
        .addra(inst_wrt_addr),
        .dina(inst_wrt_dat),
        .clkb(clk),
        .rstb(rst),
        .enb(rd_inst & fetch_ready),
        .addrb(inst_rd_addr),
        .doutb(instr_fetch),
        .rsta_busy(rsta_busy),
        .rstb_busy(rstb_busy)
    );
    */
    assign inst_rd_addr = pc_latched[9:0];
    bram32 INSTR_MEM (
        .clk(clk),
        .wea(wrt_inst),         // Write enable
        .addra(inst_wrt_addr),  // Write address
        .dina(inst_wrt_dat),    // Write data
        .enb(rd_inst),          // Read enable (simplified, no fetch_ready for now)
        .addrb(inst_rd_addr),   // Read address
        .doutb(instr_fetch)     // Read data
    );
    // assign curr_inst = instr_fetch;

    // IF/ID register
    /*
    reg [`DATA_WIDTH-1:0] pc_latched;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            pc_latched    <= `BOOT_ADDR;
            instr_latched <= 32'h0;
        end else if (!fetch_stall) begin
            pc_latched    <= pc_nxt;     // Latch the next PC value
            instr_latched <= instr_fetch; // Latch the current instruction
        end
    end

    assign pc_curr    = pc_latched;
    assign curr_instr = instr_latched;
    */
    reg first_cycle;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            instr_latched <= 32'h0;
            first_cycle <= 1'b1;
        end else if (!fetch_stall) begin
            if (first_cycle) begin
                instr_latched <= instr_fetch; // Capture first instruction
                first_cycle <= 0;
            end else begin
                instr_latched <= instr_fetch; // Normal latching
            end
        end
    end

    // assign pc_curr    = pc_latched;
    assign curr_instr = instr_latched;
    
    
endmodule
