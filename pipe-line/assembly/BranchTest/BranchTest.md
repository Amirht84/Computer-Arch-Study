# Program Description

This program demonstrates the behavior of the `beq` and `jal` instructions in RISC-V, including conditional branching, forward and backward jumps, and the use of the link register.

Initially, both `x1` and `x2` are loaded from the same memory address (`0`), so they contain the same value. As a result, the `beq` instruction is taken, skipping the next two instructions and jumping directly to the code that initializes `x1` and `x2`.

The registers are then updated so that `x1 = 0` and `x2 = 1`. A backward jump (`jal zero, -24`) returns execution to the `beq` instruction. This time the branch condition is false, allowing execution to continue sequentially.

The program computes `x3 = x2 + x2`, then executes a forward jump using `jal x4, 24`. This instruction stores the return address in `x4` before jumping to another location. The destination contains `jal zero, 0`, which creates an infinite loop and terminates further program execution.

## Expected Behavior

The execution flow is:

1. Load the same memory value into `x1` and `x2`.
2. The first `beq` is **taken**.
3. Initialize `x1 = 0` and `x2 = 1`.
4. Jump back to the `beq` instruction.
5. The second `beq` is **not taken**.
6. Compute `x3 = x2 + x2 = 2`.
7. Execute `jal x4, 24`, storing the return address in `x4`.
8. Enter an infinite loop with `jal zero, 0`.

## Expected Final Register Values

| Register |                             Value |
| -------- | --------------------------------: |
| `x1`     |                                 0 |
| `x2`     |                                 1 |
| `x3`     |                                 2 |
| `x4`     | 20 _(return address after `jal`)_ |
| `x5`     | Unchanged _(instruction skipped)_ |
| `x6`     | Unchanged _(instruction skipped)_ |
| `x7`     | Unchanged _(instruction skipped)_ |

This program serves as a simple test for conditional branches, forward and backward jumps, and the link functionality of the `jal` instruction.
