`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ISAE
// Engineer: Szymon Bogus
// 
// Create Date: 06/14/2025 09:12:30 PM
// Design Name: 
// Module Name: load_word_tb
// Project Name: rv32i_sc
// Target Devices: Zybo Z7-20
// Tool Versions: 
// Description: Testbench for the load word (lw) instruction. It implements cpu module.
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


module load_word_tb(

    );
    
    reg clk;
    reg rst;
    
    // PC inputs
    reg pc_stall;
    
    // Instruction BRAM inputs
    // Write port inputs
    reg  [9:0]             i_w_addr;
    reg  [`DATA_WIDTH-1:0] i_w_dat;
    reg                    i_w_enb;
    // Read port inputs
    reg                    i_r_enb;
    // Data BRAM inputs
    // Write port inputs
    reg  [9:0]             d_w_addr;
    reg  [`DATA_WIDTH-1:0] d_w_dat;
    reg                    d_w_enb;
    
    // =====   Fetch stage   =====
    wire [`DATA_WIDTH-1:0] pc_out;
    pc PC_uut(
        .clk(clk),
        .rst(rst),
        .stall(pc_stall),
        .pc_select(1'b0),
        .pc_in(`BOOT_ADDR),
        .pc_out(pc_out),
        .pc_next()
    );
    
    wire [`DATA_WIDTH-1:0] instruction;
    bram32 I_MEM_uut( // Instruction BRAM
        .clk(clk),
        .rst(rst),
        // Write ports inputs
        .w_addr(i_w_addr),
        .w_dat(i_w_dat),
        .w_enb(i_w_enb),
        // Read ports inputs
        .r_addr(pc_out),
        .r_enb(i_r_enb),
        // Outputs
        .r_dat(instruction)
    );
    
    // =====   Fetch stage   =====
    // =====   Decode stage   =====
    wire [`OPCODE_WIDTH-1:0]  opcode;
    assign opcode =           instruction[6:0];
    
    wire [`FUNC3_WIDTH-1:0]   func3;
    assign func3 =            instruction[14:12];
    
    // wire [`FUNC7_WIDTH-1:0]   func7;
    // assign func7 = instruction[x:x];
    
    // Control module outputs
    wire                      branch;
    wire                      mem_read;
    wire                      mem_2_reg;
    wire [3:0]                alu_ctrl;
    wire                      mem_write;
    wire                      alu_src;
    wire                      reg_write;
    
    control CONTROL_uut(
        .rst(rst),
        .opcode(opcode),
        .func3(func3),
        .func7(),
        .branch(branch),
        .mem_read(mem_read),
        .mem_2_reg(mem_2_reg),
        .alu_ctrl(alu_ctrl),
        .mem_write(mem_write),
        .alu_src(alu_src),
        .reg_write(reg_write)
    );
    
    // Register file
    wire [`REG_ADDR_WIDTH-1:0] rs1_addr;
    assign rs1_addr =          instruction[19:15];
    
    wire [`REG_ADDR_WIDTH-1:0] rs2_addr;
    assign rs2_addr =          instruction[24:20];
    
    reg                        rd_enbl;
    
    wire [`DATA_WIDTH-1:0]     rs1;
    wire [`DATA_WIDTH-1:0]     rs2;
    
    wire [`REG_ADDR_WIDTH-1:0] wrt_addr;
    assign wrt_addr =          instruction[11:7];
    reg [`DATA_WIDTH-1:0]      wrt_dat; // connect with data memory module
    // reg                        wrt_enbl; // Replaced in the cpu by reg_wire from control module
    wire [`DATA_WIDTH-1:0]     data_bram_output;
   
    register_file REGFILE_uut(
        .clk(clk),
        .rst(rst),
        .read_enable(rd_enbl),
        .rs1_addr(rs1_addr),
        .rs2_addr(rs2_addr),
        .rs1(rs1),
        .rs2(rs2),
        .write_enable(reg_write),
        .write_addr(wrt_addr),
        .write_data(data_bram_output) // writing to a given register with data from data BRAM
    );
    // =====   Decode stage   =====
    // =====   Execute stage   =====
    // Sign extension
    wire [11:0]                instr_imm;
    assign instr_imm =         instruction[`INSTR_WIDTH-1:20];
    
    wire [`INSTR_WIDTH-1:0]    immediate;
    
    sign_extend SIGN_EXTENSION(
        .src(instr_imm),
        .imm_signed(immediate)
    );
    
    wire [`INSTR_WIDTH-1:0]    alu_results;
    alu ALU_uut(
        .alu_ctrl(alu_ctrl),  // provided by control module
        .alu_src(alu_src),    // provided by control module
        .src1(rs1),           // provided by regfile
        .src2(rs2),           // provided by regfile
        .sign_ext(immediate), // provided by sign_extend
        .results(alu_results),
        .zero()               // not yet implemented
    );
    // =====   Execute stage   =====
    // =====   Memory stage   =====
    reg mem_read_tb; // value needed to allow data to be writen initially, and then the controll can
                     // be passed just to control module  
    bram32 D_MEM_uut( // Data BRAM
        .clk(clk),
        .rst(rst),
        // Write ports inputs
        .w_addr(d_w_addr),
        .w_dat(d_w_dat),
        .w_enb(d_w_enb),
        // Read ports inputs
        .r_addr(alu_results),
        .r_enb(mem_read), // mem_read- control should be only by control module (mem_read_tb || !rst) ? 1'b0 : mem_read
        // Outputs
        .r_dat(data_bram_output)
    );
    // =====   Memory stage   =====
    // =================================
    // =====   Testbench related   =====
    
    task display_results;
        begin
            $display("Time=%0t | pc=%h |\n instr=%h | op=%b | r_reg=%b |\n rs1_addr=%h | rs2_addr=%h |\n rs1=%h | rs2=%h |\n d_bram_out=%h",
                     $time,
                     pc_out,
                     instruction,
                     opcode,
                     rd_enbl,
                     rs1_addr,
                     rs2_addr,
                     rs1,
                     rs2,
                     data_bram_output);
        end
    endtask
    
    // Program will be stored here before loading to the instruction BRAM
    reg [`DATA_WIDTH-1:0] init_mem_instr [0:`I_BRAM_DEPTH-1];
    
    // Data will be stored here before loading to the data BRAM
    reg [`DATA_WIDTH-1:0] init_mem_data [0:`I_BRAM_DEPTH-1];
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end
    
    integer inst_numb;
    integer data_numb;
    integer i_inst;
    integer i_data;
    initial begin
        inst_numb = 5;
        data_numb = 4;
        
        // Reset
        rst              = 1'b1;
        pc_stall         = 1'b1;
        i_w_addr         = 10'b0;
        i_w_dat          = 32'h0;
        i_w_enb          = 1'b0;
        i_r_enb          = 1'b0;
        d_w_addr         = 10'h0;
        d_w_dat          = 32'h0;
        d_w_enb          = 1'b0;
        rd_enbl          = 1'b0; // regfile 
        wrt_dat          = 32'h0;
        // mem_read_tb      = 1'b0;
        #10;
        
        // Loading data into data BRAM
        $readmemh("load_registers_test_data.hex", init_mem_data);
        // Loading program into instruction BRAM
        $readmemh("load_registers.new.hex", init_mem_instr);
        
        // Deassert reset and initialize data BRAM
        rst = 1'b0; 
        #10; 
        
        // Write .hex contents to data BRAM via Port A
        $display("Loading data BRAM...");
        for (i_data = 0; i_data < data_numb; i_data = i_data + 1) begin 
            d_w_addr = i_data * 4;
            // d_w_addr = i_data;
            d_w_dat = init_mem_data[i_data];
            d_w_enb = 1'b1; 
            #10;           
            d_w_enb = 1'b0; 
            $display("Initialized address %h with instruction %h", d_w_addr, d_w_dat);
        end
        
        // Verify data BRAM (something is wrong with the checking logic when it comes to indexing)
        $display("Verifying data BRAM...");
        for (i_data = 0; i_data < data_numb; i_data = i_data + 1) begin
            if (D_MEM_uut.mem[i_data] == init_mem_data[i_data]) begin
                $display("Data BRAM[0x%h] = %h, matches expected", i_data * 4, D_MEM_uut.mem[i_data]);
            end else begin
                $display("Data BRAM[0x%h] = %h, expected %h", i_data * 4, D_MEM_uut.mem[i_data], init_mem_data[i_data]);
            end
        end
        
        // Write .hex contents to data BRAM via Port A
        #10;
        $display("Loading instruction BRAM...");
        for (i_inst = 0; i_inst < inst_numb; i_inst = i_inst + 1) begin 
            i_w_addr = i_inst * 4; // 4-byte aligned addresses (0x0, 0x4, 0x8, 0xC)
            i_w_dat = init_mem_instr[i_inst];
            i_w_enb = 1'b1; 
            #10;           
            i_w_enb = 1'b0; 
            $display("Initialized address %h with instruction %h", i_w_addr, i_w_dat);
        end
        
        // Verify instruction BRAM
        $display("Verifying instruction BRAM...");
        for (i_inst = 0; i_inst < inst_numb; i_inst = i_inst + 1) begin
            if (I_MEM_uut.mem[i_inst] == init_mem_instr[i_inst]) begin
                $display("Instruction BRAM[0x%h] = %h, matches expected", i_inst * 4, I_MEM_uut.mem[i_inst]);
            end else begin
                $display("Instruction BRAM[0x%h] = %h, expected %h", i_inst * 4, I_MEM_uut.mem[i_inst], init_mem_instr[i_inst]);
            end
        end
        
        // Test 1: Execute program and verify register file
        $display("Executing program...");
        rd_enbl     = 1'b1;
        i_r_enb     = 1'b1;
        pc_stall    = 1'b0;
        // mem_read_tb = 1'b1; // Let CONTROL_uut drive mem_read
        #5; 
        for (i_inst = 0; i_inst < inst_numb + 4; i_inst = i_inst + 1) begin 
            display_results();
            #10;
        end
        
        // Verify register file contents
        $display("Verifying register file...");
        if (REGFILE_uut.registers[5] == 32'h00000001) begin
            $display("x5 (registers[5]) = %h, matches expected", REGFILE_uut.registers[5]);
        end else begin
            $display("x5 (registers[5]) = %h, expected 00000001", REGFILE_uut.registers[5]);
        end
        if (REGFILE_uut.registers[6] == 32'h00000002) begin
            $display("x6 (registers[6]) = %h, matches expected", REGFILE_uut.registers[6]);
        end else begin
            $display("x6 (registers[6]) = %h, expected 00000002", REGFILE_uut.registers[6]);
        end
        if (REGFILE_uut.registers[7] == 32'h00000003) begin
            $display("x7 (registers[7]) = %h, matches expected", REGFILE_uut.registers[7]);
        end else begin
            $display("x7 (registers[7]) = %h, expected 00000003", REGFILE_uut.registers[7]);
        end
        if (REGFILE_uut.registers[8] == 32'h00000004) begin
            $display("x8 (registers[8]) = %h, matches expected", REGFILE_uut.registers[8]);
        end else begin
            $display("x8 (registers[8]) = %h, expected 00000004", REGFILE_uut.registers[8]);
        end
        
    
        $display("All tests completed");
        $finish;
    end
    
endmodule
