`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ISAE
// Engineer: Szymon Bogus
// 
// Create Date: 06/14/2025 07:39:41 PM
// Design Name: 
// Module Name: riscv_cpu
// Project Name: rv32i_sc
// Target Devices: Zybo Z7-20
// Tool Versions: 
// Description: Main module assembling entire core
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


module riscv_cpu(
    input clk,
    input rst
    );
    
    // =====   Fetch stage   =====
    wire [`DATA_WIDTH-1:0]  pc_out;
    wire                    branch;    // provided by control module- branch decoder
    wire [`INSTR_WIDTH-1:0] immediate; // provided by sign_extend module
    pc PC(
        .clk(clk),
        .rst(rst),
        .stall(pc_stall),
        .pc_select(branch),
        .pc_in(immediate),
        .pc_out(pc_out),
        .pc_next()
    );
    
    wire [`DATA_WIDTH-1:0] instruction;
    bram32 I_MEM( // Instruction BRAM
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
    wire                      alu_zero;
    wire [`OPCODE_WIDTH-1:0]  opcode;
    assign opcode =           instruction[6:0];
    
    wire [`FUNC3_WIDTH-1:0]   func3;
    assign func3 =            instruction[14:12];
    
    wire [`FUNC7_WIDTH-1:0]   func7;
    assign func7 = instruction[`DATA_WIDTH-1:25];
    
    // Control module outputs
    wire [2:0]                imm_src;
    wire                      mem_read;
    wire                      mem_2_reg;
    wire [3:0]                alu_ctrl;
    wire                      mem_write;
    wire                      alu_src;
    wire                      reg_write;
    wire [1:0]                wrt_back_src;
    
    control CONTROL(
        // .clk(clk),
        .rst(rst),
        .opcode(opcode),
        .func3(func3),
        .func7(func7),
        .alu_zero(alu_zero),
        .branch(branch),
        .imm_src(imm_src),
        .mem_read(mem_read),
        .mem_2_reg(mem_2_reg),
        .alu_ctrl(alu_ctrl),
        .mem_write(mem_write),
        .alu_src(alu_src),
        .reg_write(reg_write),
        .wrt_back_src(wrt_back_src)
    );
    
    // Register file
    wire [`REG_ADDR_WIDTH-1:0] rs1_addr;
    assign rs1_addr =          instruction[19:15];
    
    wire [`REG_ADDR_WIDTH-1:0] rs2_addr;
    assign rs2_addr =          instruction[24:20];
    
    wire                       rd_enbl;
    
    wire [`DATA_WIDTH-1:0]     rs1;
    wire [`DATA_WIDTH-1:0]     rs2;
    
    wire [`REG_ADDR_WIDTH-1:0] wrt_addr;
    assign wrt_addr =          instruction[11:7];
    reg [`DATA_WIDTH-1:0]      wrt_dat; // connect with data memory module
    wire [`DATA_WIDTH-1:0]     data_bram_output;
    
    register_file REGFILE(
        .clk(clk),
        .rst(rst),
        .read_enable(rd_enbl),
        .rs1_addr(rs1_addr),
        .rs2_addr(rs2_addr),
        .rs1(rs1),
        .rs2(rs2),
        .write_enable(reg_write),
        .write_addr(wrt_addr),
        .write_data(!mem_2_reg ? alu_results: data_bram_output) // Write data source is decided based on
                                                                // mem_2_reg flag which specifies whether the instruction is
                                                                // operates on registers only or utilizes data BRAM
    );
    // =====   Decode stage   =====
    // =====   Execute stage   =====
    // Sign extension
    wire [24:0]                instr_imm;
    assign instr_imm =         instruction[`INSTR_WIDTH-1:7];
    
    sign_extend SIGN_EXTENSION(
        .src(instr_imm),
        .imm_src(imm_src),
        .imm_signed(immediate)
    );
    
    wire [`INSTR_WIDTH-1:0]    alu_results;
    alu ALU(
        .alu_ctrl(alu_ctrl),  // provided by control module
        .alu_src(alu_src),    // provided by control module
        .src1(rs1),           // provided by regfile
        .src2(rs2),           // provided by regfile
        .sign_ext(immediate), // provided by sign_extend
        .results(alu_results),
        .zero(alu_zero)               
    );
    // =====   Execute stage   =====
    // =====   Memory stage   =====
    bram32 D_MEM( // Data BRAM
        .clk(clk),
        .rst(rst),
        // Write ports inputs
        .w_addr(alu_results),
        .w_dat(rs2),
        .w_enb(mem_write),
        // Read ports inputs
        .r_addr(alu_results),
        .r_enb(mem_read),
        // Outputs
        .r_dat(data_bram_output)
    );
    // =====   Memory stage   =====
    
endmodule
