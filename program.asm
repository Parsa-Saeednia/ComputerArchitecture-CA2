add s0, zero, zero
add s1, zero, zero
addi s2, zero, 80
LOOP:
beq s1, s2, END_LOOP
lw t0, 0(s1)
slt t1, s0, t0
beq t1, zero, END_IF
add s0, zero, t0
END_IF:
addi s1, s1, 4
jal zero, LOOP
END_LOOP: