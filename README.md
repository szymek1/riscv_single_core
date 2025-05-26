# riscv_single_core
## Overview
FPGA (Verilog based) implementation of a single core, unpipelined, 32-bit RISC-V processor, according to RV32I.
Key features:
- 40 instructions
- ```ecall/ebreak``` with a single ```SYSTEM``` hardware instrction, that always traps
- ```fence``` implemented as ```nop```
- machine mode only

### Registers:
Registers mapping (by default)
|          |               function              |
|:--------:|:-----------------------------------:|
| ```x1``` | ```ra```: return address for a call |
| ```x2``` |       ```sp```: stack pointer       |
| ```x5``` |       alternate link register       |

Each register is 32-bit.
