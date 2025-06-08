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
// Description: testbench for program counter
// 
// Dependencies: rv32i_params.vh
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`include "rv32i_params.vh"


module pc_tb(

    );
    
    reg clk;
    reg rst;
    
    reg                    pc_select;
    reg                    pc_stall;
    reg  [`DATA_WIDTH-1:0] pc_in;
    wire [`DATA_WIDTH-1:0] pc_out;
    wire [`DATA_WIDTH-1:0] pc_next;
  
    task display_results;
        begin
            $display("Time=%0t | select=%b | pc_in=%h | pc_out=%h | pc_next=%h | stall=%b",
                     $time,
                     pc_select,
                     pc_in,
                     pc_out,
                     pc_next,
                     pc_stall);
        end
    endtask
    
    pc uut(
        .clk(clk),
        .rst(rst),
        .stall(pc_stall),
        .pc_select(pc_select),
        .pc_in(pc_in),
        .pc_out(pc_out),
        .pc_next(pc_next)
    );
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // toggle clk every 5 time units
    end
    
    parameter BOOT_ADDR = `BOOT_ADDR;
    parameter PC_STEP   = `PC_STEP;
    
    integer cnt;
    initial begin
        // Initialize signals
        rst       = 1'b1;
        pc_select = 1'b0;
        pc_in     = 32'h0;
        pc_stall  = 1'b1;

        // Test 1: Reset behavior
        #15 rst = 1'b0; pc_stall = 1'b0; // Deassert reset
        // #5;
        display_results();
        if (pc_out !== BOOT_ADDR) begin
            $display("Test 1 FAILED: PC not reset to 0");
        end else begin
            $display("Test 1 PASSED: PC reset correctly");
        end

        // Test 2: Sequential PC increment (PC + 4)
        #10; // Wait one cycle
        display_results();
        if (pc_out !== BOOT_ADDR + PC_STEP) begin
            $display("Test 2 FAILED: PC not incremented to 4");
        end else begin
            $display("Test 2 PASSED: PC incremented correctly");
        end

        // Test 3: Branch/jump to new address
        #10;
        pc_select = 1'b1;
        pc_in = 32'h1000; // Jump to 0x1000
        #10;
        pc_select = 1'b0; // Resume sequential fetch
        display_results();
        if (pc_out !== 32'h1000) begin
            $display("Test 3 FAILED: PC not updated to 0x1000");
        end else begin
            $display("Test 3 PASSED: PC jumped correctly");
        end

        // Test 4: Sequential fetch after jump
        #10;
        display_results();
        if (pc_out !== 32'h1004) begin
            $display("Test 4 FAILED: PC not incremented after jump");
        end else begin
            $display("Test 4 PASSED: PC incremented correctly");
        end

        // Test 5: Multiple sequential increments
        #20; // Two more cycles
        display_results();
        if (pc_out !== 32'h100C) begin // 0x1004 + 4 + 4 = 0x100C
            $display("Test 5 FAILED: Multiple increments incorrect");
        end else begin
            $display("Test 5 PASSED: Multiple increments correct");
        end

        #10;
        $display("All tests completed");
        $finish;
    end
    
    
endmodule
