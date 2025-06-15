`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ISAE
// Engineer: Szymon Bogus
// 
// Create Date: 06/13/2025 06:19:41 PM
// Design Name: 
// Module Name: alu_sign_extend_tb
// Project Name: rv32i_sc
// Target Devices: Zybo Z7-20
// Tool Versions: 
// Description: Testbench integrating alu module with sign extension module.
//              This testbench currently assumes that only load/store operations are
//              supported.
// 
// Dependencies: rv32i_params.vh, rv32i_control.vh
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`include "rv32i_params.vh"
`include "rv32i_control.vh"


module alu_sign_extend_tb(

    );
    
    // ALU inputs
    reg  [3:0]              alu_ctrl;
    reg                     alu_src;
    reg  [`INSTR_WIDTH-1:0] src1;
    reg  [`INSTR_WIDTH-1:0] src2;
    wire [`INSTR_WIDTH-1:0] src_sign_ext; // Provided by sign_extend
    
    // ALU outputs
    wire [`INSTR_WIDTH-1:0] alu_results;
    
    // Sign extension inputs
    reg [11:0] imm_src;
    
    // Sign extension outputs
    // already included int ALU inputs
    
    sign_extend SIGN_EXTENSION_uut(
        .src(imm_src),
        .imm_signed(src_sign_ext)
    );
    
    alu ALU_uut(
        .alu_ctrl(alu_ctrl),
        .alu_src(alu_src),
        .src1(src1),
        .src2(src2),
        .sign_ext(src_sign_ext),
        .results(alu_results),
        .zero()
    );
    
    task display_results;
        begin
            $display("Time=%0t | ctrl=%b | src=%b | src1=%h | src2=%h \n| sign_ext=%b \n| results=%h",
                     $time,
                     alu_ctrl,
                     alu_src,
                     src1,
                     src2,
                     src_sign_ext,
                     alu_results);
        end
    endtask
    
    initial begin
        // Initialize signals
        alu_ctrl = `NOP;
        alu_src = 1'b0;
        src1 = 32'h0;
        src2 = 32'h0;
        imm_src = 12'h0;

        // Test 1: Reset state
        #10;
        display_results();
        if (alu_results == 32'h0) begin
            $display("Test 1 PASSED");
        end else begin
            $display("Test 1 FAILED: expected %h, got %h", 32'h0, alu_results);
        end

        // Test 2: Sign extension with positive immediate
        #10;
        imm_src  = 12'h07ff;            // +2047
        alu_ctrl = `ADD;
        alu_src  = 1'b1;               // Use sign_ext
        src1     = 32'h1000;           // Base address
        #10;
        display_results();
        if (alu_results == (32'h1000 + {{20{imm_src[11]}}, imm_src})) begin
            $display("Test 2 PASSED");
        end else begin
            $display("Test 2 FAILED: expected %h, got %h", (32'h1000 + {{20{imm_src[11]}}, imm_src}), alu_results);
        end

        // Test 3: Sign extension with negative immediate
        #10;
        imm_src = 12'hf800;     // -2048
        src1    = 32'h2000;    // Base address
        #10;
        display_results();
        if (alu_results == (32'h2000 + {{20{imm_src[11]}}, imm_src})) begin
            $display("Test 3 PASSED");
        end else begin
            $display("Test 3 FAILED: expected %h, got %h", (32'h2000 + {{20{imm_src[11]}}, imm_src}), alu_results);
        end

        // Test 4: Use regfile source (alu_src = 0)
        #10;
        alu_src = 1'b0;         // Use src2
        src2    = 32'h0fff;    // Offset from regfile
        src1    = 32'h3000;    // Base address
        #10;
        display_results();
        if (alu_results == src1 + src2) begin
            $display("Test 4 PASSED");
        end else begin
            $display("Test 4 FAILED: expected %h, got %h", src1 + src2, alu_results);
        end

        // Test 5: Invalid control (default case)
        #10;
        alu_ctrl = `NOP;
        #10;
        display_results();
        if (alu_results == 32'h0) begin
            $display("Test 5 PASSED");
        end else begin
            $display("Test 5 FAILED: expected %h, got %h", 32'h0, alu_results);
        end

        #10;
        $display("All tests completed");
        $finish;
    
        $finish;
        $display("All tests completed");
    end
    
endmodule
