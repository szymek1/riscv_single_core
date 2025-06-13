`ifndef RV32I_CONTROL_V
`define RV32I_CONTROL_V

// RV32I Processor Control Module Opcodes
// Main Control
// TODO

// ALUop
`define R_TYPE_ALU_OP      2'b10         // R Type instruction  
`define LD_SW_TYPE_ALU_OP  2'b00         // I and S Type instruction
`define BEQ_TYPE_ALU_OP    2'b01         // B Type instruction

`endif