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
    input                         clk,
    input                         rst,
    input  wire                   bram_busy_w,
    input  wire                   bram_busy_r,
    input  wire [`DATA_WIDTH-1:0] pc_curr,
    input  wire [`DATA_WIDTH-1:0] instr_curr,
    // Output: fetched pc and instruction for BRAM and ID stage
    output reg [`DATA_WIDTH-1:0] if_pc,
    output reg [`DATA_WIDTH-1:0] if_instr,
    // Output: controll signal for pc module
    output reg                   pc_stall,
    // Output: read controll signal for BRAM
    output reg                   bram_r_enb
    );
    
    reg [`DATA_WIDTH-1:0] fetch_pc;
    localparam IDLE  = 2'b00,  // Waiting for BRAM to be ready
               FETCH = 2'b01,  // Initiated fetch, waiting for instruction
               VALID = 2'b10,  // Valid instruction received
               WRITE = 2'b11;
    reg [1:0] state, next_state;
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state      <= IDLE;
            fetch_pc   <= `BOOT_ADDR;
            if_pc      <= 0;
            if_instr   <= 0;
            pc_stall   <= 1'b1;
            bram_r_enb <= 1'b0;
        end else begin
            state <= next_state;
            if (!pc_stall) begin
                fetch_pc <= pc_curr; // Latch PC for next fetch | PC doesn't move forward correctly
            end
            // Update IF/ID outputs
            if (state == VALID) begin
                if_pc    <= fetch_pc;   // PC of the fetched instruction
                if_instr <= instr_curr; // Instruction from BRAM
            end else begin
                if_pc <= if_pc; // Hold previous value
                if_instr <= 0;  // NOP during stall or invalid fetch
            end
        end
    end
    
    always @(*) begin
        next_state = state;
        pc_stall   = 1'b0;
        bram_r_enb = 1'b0;
        
        case (state)
            IDLE: begin
                if (rst || bram_busy_w) begin
                    pc_stall   = 1'b1; // Stall during reset or BRAM write
                    next_state = IDLE;
                end else begin
                    if (bram_busy_w) begin
                        bram_r_enb = 1'b0; // Write will begin
                        next_state = WRITE;
                    if (!bram_busy_w && !bram_busy_r) begin
                        next_state = IDLE;
                    end
                    end else if (bram_busy_r && !bram_busy_w) begin
                        bram_r_enb = 1'b1; // Start fetch
                        next_state = FETCH;
                    end
                end
            end
            WRITE: begin
                // BRAM is writing
                pc_stall   = 1'b1;
                bram_r_enb = 1'b0;
                next_state = IDLE;
            end
            FETCH: begin
                if (rst || bram_busy_w) begin
                    pc_stall   = 1'b1;
                    next_state = IDLE;     
                end else begin
                    bram_r_enb = 1'b1; // Continue reading
                    if (bram_busy_r) begin
                        next_state = VALID; // Instruction will be valid next cycle
                    end
                end
            end
            VALID: begin
                if (rst || bram_busy_w) begin
                    pc_stall   = 1'b1;
                    next_state = IDLE;
                end else begin
                    bram_r_enb = 1'b1; 
                    next_state = VALID; 
                end
            end
            default: begin
                next_state = IDLE;
                pc_stall = 1'b1;
            end
        endcase
    end
    
endmodule
