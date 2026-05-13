lw s0, 0(zero)
lw s1, 4(zero)
add s2, s0, s1
addi t0, zero, 10
blt c, t0, 0xC
addi s1, zero, 1000
jal zero, 0x8
addi s1, zero, 0
sw s1, 8(zero)
