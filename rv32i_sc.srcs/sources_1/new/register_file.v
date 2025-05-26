`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ISAE
// Engineer: Szymon Bogus
// 
// Create Date: 05/26/2025 11:21:05 PM
// Design Name: 
// Module Name: register_file
// Project Name: rv32i_sc
// Target Devices: Zybo Z7-20
// Tool Versions: 
// Description: Register file holding 32 general use registers.
//              RISC-V is byte-addressed: in order to store 32x32-bit registers we need an array, each byte is addressed.
//              Next register begins +4 bytes w.r.t the previous one.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module register_file(
    input clk,
    input rst,

    // READ
    input read_enable,
    input  wire  [4:0]  rs1_addr,
    input  wire  [4:0]  rs2_addr,
    output wire  [31:0] rs1,
    output wire  [31:0] rs2,
    
    // WRITE
    input  wire        write_enable,
    input  wire [4:0]  write_addr,
    output wire [31:0] write_data
    
    );
    
    reg [31:0] registers [31:1]; // skipping x0, which is hard-wired to 32'b0
    
    assign rs1 = registers[rs1_addr];
    assign rs2 = registers[rs2_addr];
    
endmodule
