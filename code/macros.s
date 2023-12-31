.macro SaveRegisters()
    # Salva todos os registradores salvos na pilha
    # ra
    # s0, ..., s11
    # fs0, ..., fs11
    addi sp, sp, -28
    sw ra, 0(sp)
    sw s0, 4(sp)
    sw s1, 8(sp)
    sw s2, 12(sp)
    sw s3, 16(sp)
    sw s4, 20(sp)
    sw s5, 24(sp)
    #sw s6, 28(sp)
    #sw s7, 32(sp)
    #sw s8, 36(sp)
    #sw s9, 40(sp)
    #sw s10, 44(sp)
    #sw s11, 48(sp)
.end_macro


.macro LoadRegisters()
    # Recupera todos os registradores salvos da pilha
    # ra
    # s0, ..., s11
    # fs0, ..., fs11
    lw ra, 0(sp)
    lw s0, 4(sp)
    lw s1, 8(sp)
    lw s2, 12(sp)
    lw s3, 16(sp)
    lw s4, 20(sp)
    lw s5, 24(sp)
    #lw s6, 28(sp)
    #lw s7, 32(sp)
    #lw s8, 36(sp)
    #lw s9, 40(sp)
    #lw s10, 44(sp)
    #lw s11, 48(sp)
    addi sp, sp, 28
.end_macro

.macro DebugInt(%reg)

.data
	QUEBRA: .string  "\n"
.text

	li a7, 1
	mv a0, %reg
	ecall
	
	li a7, 4
	la a0, QUEBRA
	ecall
	
.end_macro

.macro DebugString(%msg)

.data
	QUEBRA: .string  "\n"
	MSG: 	.string %msg
.text
	li a7, 4
	la a0, MSG
	ecall
	la a0, QUEBRA
	ecall
.end_macro

.macro DebugInt(%msg, %reg)
.data
	MSG: 	.string %msg
	SEP:	.string	 ": "
	QUEBRA: .string  "\n"
.text

	li a7, 4
	la a0, MSG
	ecall
	
	li a7, 4
	la a0, SEP
	ecall
	
	li a7, 1
	mv a0, %reg
	ecall
	
	li a7, 4
	la a0, QUEBRA
	ecall
	
.end_macro
