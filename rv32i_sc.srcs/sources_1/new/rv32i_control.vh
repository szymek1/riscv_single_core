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
`define J_TYPE_OP          7'b1101111

// ALUop
`define R_TYPE_ALU_OP      2'b10 // R Type instruction  
`define LD_SW_TYPE_ALU_OP  2'b00 // I and S Type instruction
`define J_TYPE_ALU_OP      2'b00 // J Type instruction
`define BEQ_TYPE_ALU_OP    2'b01 // B Type instruction

// ALU Control
`define ADD                4'b0010
`define SUBTRACT           4'b0110
`define ALU_AND            4'b0000
`define ALU_OR             4'b0001
`define NOP                4'b1111

// Func3 field
`define F3_ADD_SUB         3'b000
`define F3_ALU_AND         3'b111
`define F3_ALU_OR          3'b110
// Func3 field- branch decoder
`define F3_BEQ             3'b000
`define F3_BNE             3'b001

// Func7 field
`define F7_ADD_AND_OR      7'b0000000
`define F7_SUB             7'b0100000

`endif