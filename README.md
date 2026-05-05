# Computer Architecture Study `In Progress`

## Purpose

We are going to implement [Single-cycle](#single-cycle-micro-arch), [Multi-cycle](#multi-cycle), and [Pipeline](#pipeline) micro-architecture of [RISC-V](https://riscv.org).

## Contributors

It is designed by [Amir](https://github.com/Amirht84) and [Anita]() as a school project in University of Tehran.

## Project Structure

### branches

- [**main:**](https://github.com/Amirht84/Computer-Arch-Study)
  contains the final work
- **test:**
  used for testing new features before merging to main
- **paper-design:**
  schematic designs of the hardware in .jpg files
- **elements:**
  verilog codes of the most low level modules of this project like ALU, Regfile, etc.
- **controller:**
  contains verilog codes of controller
- **data-path:**
  contains verilog codes of data path

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
