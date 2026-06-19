# Computer Architecture Study `In Progress`

## Purpose

We are going to implement Single-cycle, Multi-cycle, and Pipeline micro-architecture of [RISC-V](https://riscv.org).

## Contributors

It is designed by [Amir](https://github.com/Amirht84) and [Anita](https://github.com/AnitaEngUT) as a school project in [University of Tehran](https://ut.ac.ir/en).

## Project Structure

> #### Simulation Engine
>
> In this project, _ModelSim - Intel FPGA Starter Edition_ is used to compile and simulate Verilog codes.

### Directories

- [**ISA:**](https://github.com/Amirht84/Computer-Arch-Study/tree/main/ISA)
  Information used from RISC-V ISA in the designed is documented here.
- [**single-cycle:**](https://github.com/Amirht84/Computer-Arch-Study/tree/main/single-cycle)
  Single-Cycle Micro-Arch is places here, contains Verilog HDL codes, designs, etc.
- #### Sub Directories:
  Also each Micro Architecture directory (i.g. [single-cycle](https://github.com/Amirht84/Computer-Arch-Study/tree/main/single-cycle)) has some sub-directories which is same in all three Micro Architectures:
  - **design:** Contains designs on paper or table, the first step of implementation.
  - **code:** Contains Verilog HDL codes; Sub directories are also explained down here.
  - **code/data-path:** Data Path and its' sub modules are described here.
  - **code/controller:** Controller Unit and its' sub modules are described here.
  - **code/mem:** Memory elements are described here, they are implemented abstractive.
  - **code/elements:** RTL Elements are described here, wchich is used by Data Path, and Controlle; They are implemented abstractive.
  - **code/top:** Top Modules such as CPU, MEM, and TOP(combination of CPU, and MEM) is described here.
  - **code/test:** Test Benches are described here.
  - **assembly:** Contains assembly programs to test hardware.
  - **report:** A fully explained work log of the design, implement, and test process.
    > #### **RV-Encoder**
    >
    > An encoder is implemented to convert assembly codes into machine code which is available in [RV-Encoder](https://github.com/Amirht84/RV-Encoder.git) repository.

### branches

- [**main:**](https://github.com/Amirht84/Computer-Arch-Study.git)
  contains the final work
- [**single-cycle:**](https://github.com/Amirht84/Computer-Arch-Study/tree/single-cycle.git)
  Single-Cycly Mircro-Arch is implemented in this branch
- [**multi-cycle:**](https://github.com/Amirht84/Computer-Arch-Study/tree/multi-cycle.git)

## Implemented Instructions:

These instructions are implemented in the design

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
