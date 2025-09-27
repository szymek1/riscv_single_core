`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ISAE
// Engineer: Szymon Bogus
// 
// Create Date: 09/27/2025
// Design Name: 
// Module Name: load_store_decoder
// Project Name: rv32i_sc
// Target Devices: Zybo Z7-20
// Tool Versions: 
// Description: Module decoding what type of w_enb flag bram module should get.
//              It also processes data to send to the memory 
// 
// Dependencies: rv32i_params.vh, rv32i_control.vh
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`include "../include/rv32i_params.vh"
`include "../include/rv32i_control.vh"


module load_store_decoder (
    input  wire [`DATA_WIDTH-1:0]  alu_result_addr,
    input  wire [`FUNC3_WIDTH-1:0] func3,
    input  wire [`DATA_WIDTH-1:0]  reg_read,
    output wire [3:0]              byte_enb,
    output wire [`DATA_WIDTH-1:0]  data

);

    assign byte_enb = 4'b1111;

endmodule