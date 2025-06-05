`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ISAE
// Engineer: Szymon Bogus
// 
// Create Date: 05/27/2025 05:13:17 PM
// Design Name: 
// Module Name: pc
// Project Name: rv32i_sc
// Target Devices: Zybo Z7-20
// Tool Versions: 
// Description: 32-bit program counter for RV32I
// 
// Dependencies: rv32i_params.vh
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`include "rv32i_params.vh"


module pc( 
    input clk,
    input rst,
    input  wire                   stall,
    input  wire                   pc_select, // 1-> PC=PC+4 | 0-> PC=pc_in (accepting new target)
    input  wire [`DATA_WIDTH-1:0] pc_in,     // branch/jummp target
    output wire [`DATA_WIDTH-1:0] pc_out,
    output wire [`DATA_WIDTH-1:0] pc_next
    );
    
    reg [`DATA_WIDTH-1:0] pc_internal; // current internal value of PC
    
    parameter BOOT_ADDR = `BOOT_ADDR;
    always @(posedge clk or posedge rst) begin
        if (rst == 1'b1) begin
            pc_internal <= BOOT_ADDR;
        end
        
        else if (!stall) begin
            pc_internal <= pc_select ? pc_in : pc_internal + `PC_STEP;
        end
        // in case of stall=1, pc retains the last value
        
    end

    assign pc_out  = pc_internal;
    assign pc_next = pc_out + `PC_STEP;
    
endmodule
