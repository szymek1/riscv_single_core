`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ISAE
// Engineer: Szymon Bogus
// 
// Create Date: 06/05/2025 10:12:54 AM
// Design Name: 
// Module Name: instruction_fetch_bram_tb
// Project Name: rv32i_sc
// Target Devices: Zybo Z7-20
// Tool Versions: 
// Description: testbench for BRAM (no PC for now)
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module instruction_fetch_bram_tb;

    reg clk; // General clock shared by both A and B
    
    // Write port A
    wire       clka;   // Clock for port A
    reg [3:0]  wea;    // Write enable
    reg [31:0] addra;  // Write address
    reg [31:0] dina;   // Input data to write
    
    // Read port B
    wire        clkb;      // Clock for port B
    reg         rstb;      // Reset for port B (active high)
    reg         enb;       // Read enable
    reg  [31:0] addrb;     // Read address
    wire [31:0] doutb;     // Output data to read
    wire        rsta_busy;
    wire        rstb_busy;
    
    assign clka = clk;
    assign clkb = clk;
    
    // Memory array to hold .hex file contents
    reg [31:0] init_mem [0:1023]; // Assume 1024 depth
    integer i;
    
    // VHDL entity
    instruction_fetch_bram uut (
        .clka(clka),
        .wea(wea),
        .addra(addra),
        .dina(dina),
        .clkb(clkb),
        .rstb(rstb),
        .enb(enb),
        .addrb(addrb),
        .doutb(doutb),
        .rsta_busy(rsta_busy),
        .rstb_busy(rstb_busy)
    );
    
    // Common clock for both ports
    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end
    
    task display_results;
        begin
            $display("Time=%0t | rstb=%b | rstb_busy=%b | enb=%b | addrb=%h | doutb=%h | wea=%b | addra=%h | dina=%h | rsta_busy=%b",
                     $time, rstb, rstb_busy, enb, addrb, doutb, wea, addra, dina, rsta_busy);
        end
    endtask

    initial begin
    
        rstb = 1'b1; // Active-high reset
        enb = 1'b0;
        wea = 4'b0000;
        addra = 32'h0;
        dina = 32'h0;
        addrb = 32'h0;
        
        // Load .hex file into init_mem
        $readmemh("add_registers.hex", init_mem);

        // Test 1: Reset behavior
        #10; 
        display_results();
        if (rstb_busy == 1'b1)
            $display("Test 1: PASS - Reset active (rstb=1), rstb_busy high");
        else
            $display("Test 1: FAIL - Reset active (rstb=1), rstb_busy low");
            
        // Test 2: Deassert reset and initialize BRAM
        rstb = 1'b0; // Deassert reset
        #10; 
        
        // Write .hex contents to BRAM via Port A
        for (i = 0; i < 4; i = i + 1) begin 
            addra = i * 4; // 4-byte aligned addresses (0x0, 0x4, 0x8, 0xC)
            dina = init_mem[i];
            wea = 4'b1111; 
            #10;           
            wea = 4'b0000; 
            $display("Initialized address %h with instruction %h", addra, dina);
        end

        // Enable reads
        enb = 1'b1;
        #10; // Wait one cycle to ensure enb is stable

        // Test 3: Read pre-loaded instruction at 0x0
        addrb = 32'h0; // Set read address
        #20; // BRAM takes addrb on the raising edge and then outputs data clock cycle later
        #5;
        display_results();
        if (doutb == 32'h00500093)
            $display("Test 3: PASS - Read correct instruction at 0x0 (addi x1, x0, 5)");
        else
            $display("Test 3: FAIL - Incorrect instruction at 0x0, expected 00500093, got %h", doutb);

        // Test 4: Read next instruction at 0x4
        addrb = 32'h4; 
        #20; 
        #5;
        display_results();
        if (doutb == 32'h00600113)
            $display("Test 4: PASS - Read correct instruction at 0x4 (addi x2, x0, 6)");
        else
            $display("Test 4: FAIL - Incorrect instruction at 0x4, expected 00600113, got %h", doutb);

        // Test 5: Read next instruction at 0x8
        addrb = 32'h8; 
        #20; 
        #5;
        display_results();
        if (doutb == 32'h002081b3)
            $display("Test 5: PASS - Read correct instruction at 0x8 (add x3, x1, x2)");
        else
            $display("Test 5: FAIL - Incorrect instruction at 0x8, expected 002081b3, got %h", doutb);

        // Test 6: Read next instruction at 0xC
        addrb = 32'hC; 
        #20; 
        #5;
        display_results();
        if (doutb == 32'h0000006f)
            $display("Test 6: PASS - Read correct instruction at 0xC (j loop)");
        else
            $display("Test 6: FAIL - Incorrect instruction at 0xC, expected 0000006f, got %h", doutb);

        // Test 7: Write new data to an address
        wea = 4'b1111;       // Write all 4 bytes
        addra = 32'h10;      // Write to address 0x10
        dina = 32'hDEADBEEF; // Test data
        #10;                 // Wait one cycle for write
        wea = 4'b0000;       // Disable write
        display_results();
        $display("Test 7: Wrote DEADBEEF to address 0x10");

        // Test 8: Read back written data
        addrb = 32'h10; 
        #20; 
        #5;
        display_results();
        if (doutb == 32'hDEADBEEF)
            $display("Test 8: PASS - Read correct data at 0x10 (DEADBEEF)");
        else
            $display("Test 8: FAIL - Incorrect data at 0x10, expected DEADBEEF, got %h", doutb);

        // Test 9: Disable read
        enb = 1'b0;
        #10; 
        display_results();
        $display("Test 9: Read disabled");

        // End simulation
        #50;
        $display("All tests completed");
        $finish;
    end
    
    always @(posedge clk) begin
        $display("Debug: Time=%0t | addrb=%h | doutb=%h", $time, addrb, doutb);
    end
endmodule
