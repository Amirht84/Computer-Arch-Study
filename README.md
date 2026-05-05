# Elements

In this branch the most low level modules are implemented

## These modules are:

### PC

A Register that contains Programm Counter, it helps programm sequencing.

### INS_MEM

A Memory for Instructions, it is a part of RAM; It acts combinational.

### DATA_MEM

A Memory for Data, it is a part of RAM; It acts combinational when 'we' is 0 else sequential.

### REG_FILE

It contains the 32 registers of RISC-V32.

### ALU

Arithmatic Logic Unit of then hardware; Has 5 functions as the table below:
| Func | Operation |
|--------|-----|
| `000` | `A + B` |
| `001` | `A - B` |
| `010` | `A & B` |
| `011` | `A \| B` |
| `101` | `A < B` |
