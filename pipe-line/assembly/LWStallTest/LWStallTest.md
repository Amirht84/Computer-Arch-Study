# Program Description

This program demonstrates **pointer chasing** using the `lw` instruction.

The memory is initialized as follows:

| Address | Value |
| ------: | ----: |
|       0 |     4 |
|       4 |     8 |
|       8 |    12 |
|      12 |    16 |

The register `x1` is initialized to `0`, the address of the first memory word. Each `lw` instruction loads the value stored at the current address into `x1`. Since every loaded value is itself the address of the next element, execution follows the chain:

```text
0 → 4 → 8 → 12 → 16
```

## Expected Result

The value of `x1` after each instruction is:

| Instruction |  x1 |
| ----------- | --: |
| `addi`      |   0 |
| 1st `lw`    |   4 |
| 2nd `lw`    |   8 |
| 3rd `lw`    |  12 |
| 4th `lw`    |  16 |

This example demonstrates indirect memory access (pointer chasing), where each loaded value is treated as the address of the next memory location.
