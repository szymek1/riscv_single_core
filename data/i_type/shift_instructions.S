# Simple RV32I program using I-type instructions
# Executes sll, sri, slli, srli and sra, srai instructions.

.text
.global _start
_start:
    # Load words from memory into registers x5, x6
    lw x5, 0(x10)           # x5 = mem[0x0000] = 0x0000002A
    lw x6, 4(x10)           # x6 = mem[0x0004] = 0x00000002
    lw x7, 8(x10)           # x7 = mem[0x0008] = 0xFFFFFFD6

    sll x8, x5, x6          # x8 = 0x000000A8
    slli x9, x5, 2          # x9 = 0x000000A8

    srl x10, x5, x6         # x10 = 0x0000000A
    srli x11, x5, 2         # x11 = 0x0000000A
    
    sra x12, x9, x6         # x12 = 0xFFFFFFF5
    srai x13, x9, 2         # x13 = 0xFFFFFFF5

    j loop

loop:
    j loop              # Jump to loop (keeps processor running)