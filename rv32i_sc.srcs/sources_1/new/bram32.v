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
    input                         clk,
    input                         rst,
    // Write port
    input  wire [3:0]             ws,          // Write select(4 bits for byte-wise write)
    input  wire                   we,          // Write enable
    input  wire [9:0]             addra,       // Write address (10 bits for 1024 words)
    input  wire [`DATA_WIDTH-1:0] dina,        // Write data (32 bits)
    // Read port
    input  wire                   enb,         // Read enable
    input  wire [9:0]             addrb,       // Read address (10 bits for 1024 words)
    output wire                   bram_busy_r, // Set when memory is busy reading data
    output wire                   bram_busy_w, // Set when memory is busy writing
    output reg  [`DATA_WIDTH-1:0] doutb        // Read data (32 bits)
);

    // Memory array: 1024 x 32-bit words
    reg [`DATA_WIDTH-1:0] mem [0:`I_BRAM_DEPTH-1];

    // Write operation (combinational for simplicity, synchronous in real designs)
    parameter WRT_BYTE0 = 4'b0001;
    parameter WRT_BYTE1 = 4'b0010;
    parameter WRT_BYTE2 = 4'b0100;
    parameter WRT_BYTE3 = 4'b1000;
    
    assign bram_busy_w = we;
    always @(posedge clk) begin
        if (!rst && !bram_busy_r && we) begin
            if (ws == WRT_BYTE0) mem[addra][7:0]   <= dina[7:0];   
            if (ws == WRT_BYTE1) mem[addra][15:8]  <= dina[15:8];  
            if (ws == WRT_BYTE2) mem[addra][23:16] <= dina[23:16]; 
            if (ws == WRT_BYTE3) mem[addra][31:24] <= dina[31:24]; 
        end
    end

    // Read operation with 1-cycle latency
    reg [9:0] read_addr_reg;
    reg       is_reading;
    always @(posedge clk) begin
        if (rst) begin
            doutb <= 0;
            is_reading <= 1'b0;
        end else if (enb) begin
            read_addr_reg <= addrb; // Register the address
            is_reading    <= 1'b1;
        end else if (!rst && !bram_busy_w && enb) begin
            doutb      <= mem[read_addr_reg]; // Output data after 1 cycle
            is_reading <= 1'b0;               // Done reading
        end else begin
            doutb <= 0;
            is_reading <= 1'b0;
        end
    end
    
    assign bram_busy_r = is_reading;

endmodule
