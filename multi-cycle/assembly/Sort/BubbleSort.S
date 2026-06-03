addi    s1, zero, 0x14
add     s2, s1, zero
slti	t0, s2, 40
beq     t0, zero, 52
add     s3, s1, zero
slti	t0, s3, 36
beq     t0, zero, 32
lw      s4, 0(s3)
lw      s5, 4(s3)
bge     s4, s5, 12
sw      s4, 4(s3)
sw      s5, 0(s3)
addi	s3, s3, 4
jal     zero, -32
addi	s2, s2, 4
jal     zero, -52
jal     zero, 0