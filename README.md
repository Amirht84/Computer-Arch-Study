# Computer Architecture Study `In Progress`

## Purpose

We are going to implement [Single-cycle](#single-cycle-micro-arch), [Multi-cycle](#multi-cycle), and [Pipeline](#pipeline) micro-architecture of [RISC-V](https://riscv.org).

## Contributors

It is designed by [Amir](https://github.com/Amirht84) and [Anita]() as a school project in University of Tehran.

## Project Structure

### branches

- [**main:**](https://github.com/Amirht84/Computer-Arch-Study)
  contains the final work
- [**test:**](https://github.com/Amirht84/Computer-Arch-Study/tree/test)
  used for testing new features before merging to main
- [**paper-design:**](https://github.com/Amirht84/Computer-Arch-Study/tree/paper-design)
  schematic designs of the hardware in .jpg files
- [**elements:**](https://github.com/Amirht84/Computer-Arch-Study/tree/elements)
  verilog codes of the most low level modules of this project like ALU, Regfile, etc.
- [**controller:**](https://github.com/Amirht84/Computer-Arch-Study/tree/controller)
  contains verilog codes of controller
- [**data-path:**](https://github.com/Amirht84/Computer-Arch-Study/tree/data-path)
  contains verilog codes of data path
- [**assembly:**](https://github.com/Amirht84/Computer-Arch-Study/tree/assembly)
  contains assembly codes for testing hardware functionality

## Single-Cycle Micro-Arch

### Implemented Instructions:

- **R-Type:**
  `add`, `sub`, `and`, `or`, `slt`
- **I-Type:**
  `lw`, `addi`, `xori`, `ori`, `slti`, `jalr`
- **S-Type:**
  `sw`
- **J-Type:**
  `jal`
- **B-Type:**
  `beq`, `bne`, `blt`, `bge`

---
