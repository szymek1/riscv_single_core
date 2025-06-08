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
// Description: Custom 32-bit BRAM
// 
// Dependencies: rv32i_params.vh
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`include "rv32i_params.vh"


module bram32 (
    input wire clk,
    // Write port
    input wire [3:0] wea,        // Write enable (4 bits for byte-wise write)
    input wire [9:0] addra,      // Write address (10 bits for 1024 words)
    input wire [`DATA_WIDTH-1:0] dina,      // Write data (32 bits)
    // Read port
    input wire enb,              // Read enable
    input wire [9:0] addrb,      // Read address (10 bits for 1024 words)
    output reg [`DATA_WIDTH-1:0] doutb      // Read data (32 bits)
);

    // Memory array: 1024 x 32-bit words
    reg [`DATA_WIDTH-1:0] mem [0:1023];

    // Write operation (combinational for simplicity, synchronous in real designs)
    integer i;
    always @(posedge clk) begin
        if (wea[0]) mem[addra][7:0]   <= dina[7:0];   // Byte 0
        if (wea[1]) mem[addra][15:8]  <= dina[15:8];  // Byte 1
        if (wea[2]) mem[addra][23:16] <= dina[23:16]; // Byte 2
        if (wea[3]) mem[addra][31:24] <= dina[31:24]; // Byte 3
    end

    // Read operation with 1-cycle latency
    reg [9:0] read_addr_reg;
    always @(posedge clk) begin
        if (enb) begin
            read_addr_reg <= addrb; // Register the address
        end
        doutb <= mem[read_addr_reg]; // Output data after 1 cycle
    end

endmodule
