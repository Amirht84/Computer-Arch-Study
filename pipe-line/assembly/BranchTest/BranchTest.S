lw x1, 0(zero)
lw x2, 0(zero)
beq x1, x2, 16
add x3, x2, x2
jal x4, 24
addi x5, zero, 1000
addi x1, zero, 0
addi x2, zero, 1
jal zero, -24
addi x6, zero, 1000
jal, zero, 0
addi x7, zero, 1000