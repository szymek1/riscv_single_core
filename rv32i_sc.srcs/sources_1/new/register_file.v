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
    output wire  [31:0] rs1, // carries value that has been read with rs1_addr
    output wire  [31:0] rs2, // carries value that has been read with rs1_addr
    
    // WRITE
    input  wire        write_enable,
    input  wire [4:0]  write_addr, // specifies which register to write to
    output wire [31:0] write_data  // value to wrtie
    
    );
    
    reg [31:0] registers [31:1]; // skipping x0, which is hard-wired to 32'b0
    
    // READ: no further controll is needed here
    assign rs1 = (rs1_addr != 32'b0) ? registers[rs1_addr]: 32'b0;
    assign rs2 = (rs2_addr != 32'b0) ? registers[rs2_addr]: 32'b0;
    
    // WRITE: clk and rst are the control signals
    integer reg_id;
    always @(posedge clk or posedge rst) begin
    
        // Reset on rst set
        if (rst == 1'b0) begin
            for (reg_id = 0 ; reg_id < 32; reg_id = reg_id + 1) begin
            registers[reg_id] <= 32'b0;
            end
        end
        
        else if (write_enable == 1'b1 && write_addr != 32'b0) begin
            registers[write_addr] <= write_data;
        end
        
    end
    
endmodule
