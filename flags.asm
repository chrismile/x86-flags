; Copyright (c) 2017, Christoph Neuhauser
; BSD 3-Clause License (for more details see LICENSE file)

; Assembler program for testing the behavior of x86 flags

; To compile this program, you need to install the following packages on 64-bit x86 Ubuntu
;	sudo apt-get install gcc-multilib nasm
; Then launch "make" in the directory of the project.


segment .data
	FormattedFlagString: db `Flags:\tC Z S O\n\t%d %d %d %d\n`, 0

segment .text
	extern printf
	global main

main:
	call clear_flags
	
	; PUT CODE TO TEST HERE
	mov eax,0
	add eax,-1
	; END OF CODE

	call save_registers
	
	; Call printf to print the flags to the console
	push edx
	push ecx
	push ebx
	push eax
	push dword FormattedFlagString
	call printf
	add esp, 20 ; Remove arguments from stack 
	
	; Exit with code 0
	mov ebx,0
	mov eax,1
	int 0x80

clear_flags:
	MOV EAX, 0
	ADD EAX,1
	RET

save_registers:
	; Save CARRY-flag
	mov eax,0
	jnc .not_carry
	mov eax,1
	.not_carry:
	
	; Save ZERO-flag
	mov ebx,0
	jnz .not_zero
	mov ebx,1
	.not_zero:
	
	; Save SIGN-flag
	mov ecx,0
	jns .not_sign
	mov ecx,1
	.not_sign:
	
	; Save OVERFLOW-flag
	mov edx,0
	jno .not_ovr
	mov edx,1
	.not_ovr:
	
	ret