`ifndef RV32I_CONTROL_V
`define RV32I_CONTROL_V

// RV32I Processor Control Module Opcodes
// Main Control
`define OPCODE_WIDTH       7     // 7 bits of an instruction dedicated to an opcode
`define FUNC3_WIDTH        3
`define FUNC7_WIDTH        7

// Opcodes
`define R_TYPE_OP          7'b0110011
`define LD_TYPE_OP         7'b0000011
`define SD_TYPE_OP         7'b0100011
`define BEQ_TYPE_OP        7'b1100011

// ALUop
`define R_TYPE_ALU_OP      2'b10 // R Type instruction  
`define LD_SW_TYPE_ALU_OP  2'b00 // I and S Type instruction
`define BEQ_TYPE_ALU_OP    2'b01 // B Type instruction

`endif