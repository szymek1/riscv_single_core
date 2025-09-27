`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ISAE
// Engineer: Szymon Bogus
// 
// Create Date: 06/07/2025 10:12:11 PM
// Design Name: 
// Module Name: bram32
// Project Name: rv32i_sc
// Target Devices: Zybo Z7-20
// Tool Versions: 
// Description: Custom 32-bit BRAM: currently under the assumption that it returns
//              within one clock cycle, which is unrealistic.
// 
// Dependencies: rv32i_params.vh
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`include "../include/rv32i_params.vh"


module bram32 (
    input                                                                clk,
    input                                                                rst,
    // Write port inputs
    input  wire [$clog2(`I_BRAM_DEPTH) + $clog2(`BYTES_PER_WORD) - 1 :0] w_addr, // bytes alignment
    input  wire [`DATA_WIDTH-1:0]                                        w_dat,
    input  wire [3:0]                                                    w_enb, // mask indicating which byte from the word to edit:
                                                                                // Example:
                                                                                // to write the least significant byte of a word at address 0x1000
                                                                                // set write_enb = 0b0001
                                                                                // for 0x1001, write_mask = 0b0010, etc...
    // Read port inputs
    input  wire [$clog2(`I_BRAM_DEPTH) + $clog2(`BYTES_PER_WORD) - 1 :0] r_addr,
    input  wire [3:0]                                                    r_enb,
    // Outputs
    output reg  [`DATA_WIDTH-1:0]                                        r_dat,
    // Debug read port
    input  wire [9:0]                                                    debug_addr,
    output wire [31:0]                                                   debug_data
);

    reg [`DATA_WIDTH-1:0] mem [0:`I_BRAM_DEPTH-1];
    
    integer i;
    always @(posedge clk) begin
        if (rst) begin
            for (i = 0; i < `I_BRAM_DEPTH; i = i + 1) begin
                mem[i] <= 32'h0;
            end
        end
        if (!rst && !r_enb) begin
            if (w_enb == 4'b1111) begin
                // full word write
                mem[w_addr[11:2]] <= w_dat; 
            end else 
                // specific byte
                if (w_enb[0] == 1'b1) mem[w_addr[11:2]][7:0]   <= w_dat[7:0];
                if (w_enb[1] == 1'b1) mem[w_addr[11:2]][15:8]  <= w_dat[15:8];
                if (w_enb[2] == 1'b1) mem[w_addr[11:2]][23:16] <= w_dat[23:16];
                if (w_enb[3] == 1'b1) mem[w_addr[11:2]][31:24] <= w_dat[31:24];
            begin
        end
    end
    
    always @(*) begin
        if (!w_enb && !rst && r_enb) begin
            r_dat = mem[r_addr];
        end
    end
    
    assign debug_data = mem[debug_addr]; // used only for debugging, like accessing data after store for a validation
    
endmodule