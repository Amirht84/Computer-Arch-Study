```md
## Description

This program implements **Bubble Sort (Descending Order)**.

The implementation process was:

1. Writing the algorithm in **C**.
2. Converting it into a **pseudo assembly** for easier translation.
3. Converting the pseudo assembly into **RISC-V assembly**, where labels are replaced by instruction offsets and `j` is translated to `jal zero, offset`.

> **Note:** Only the final RISC-V assembly is syntactically valid. The pseudo assembly is only used to illustrate the program logic.

### Register Usage

| Register | Purpose                            |
| -------- | ---------------------------------- |
| `s1`     | Base address of array `A` (0)      |
| `s2`     | `i` (outer loop offset)            |
| `s3`     | `j` (inner loop offset)            |
| `s4`     | `A[j]`                             |
| `s5`     | `A[j+1]`                           |
| `t0`     | Temporary register for comparisons |

### Program Flow

- Initialize `i = 0`.
- Execute the outer loop while `i < 40` (`10 × 4` bytes).
- Initialize `j = 0` for each iteration.
- Execute the inner loop while `j < 36` (`9 × 4` bytes).
- Load `A[j]` and `A[j+1]`.
- If `A[j] < A[j+1]`, swap them.
- Increase `j` by 4 bytes.
- Repeat until the array is sorted in **descending order**.
- The program ends with an infinite loop (`jal zero, 0`).
```
