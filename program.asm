add s0, Zero, Zero
add s1, Zero, Zero
addi s2, Zero, 80
LOOP:
beq s1, s2, END_LOOP
lw t0, 0(s1)
slt t1, s0, t0
beq t1, Zero, END_IF
add s0, Zero, t0
END_IF:
addi s1, s1, 4
jal Zero, LOOP
END_LOOP:
