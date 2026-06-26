# Program Description

This program demonstrates basic arithmetic operations using the `addi` and `add` instructions.

The registers are updated as follows:

| Instruction      |            Result |
| ---------------- | ----------------: |
| `addi x1, x0, 0` |          `x1 = 0` |
| `addi x2, x1, 1` |          `x2 = 1` |
| `addi x3, x2, 1` |          `x3 = 2` |
| `addi x4, x3, 1` |          `x4 = 3` |
| `add x4, x4, x3` |  `x4 = 3 + 2 = 5` |
| `add x5, x4, x4` | `x5 = 5 + 5 = 10` |

## Expected Result

The final register values are:

| Register | Value |
| -------- | ----: |
| `x1`     |     0 |
| `x2`     |     1 |
| `x3`     |     2 |
| `x4`     |     5 |
| `x5`     |    10 |

This example demonstrates register initialization, data dependency between instructions, and arithmetic operations performed entirely on register values.
