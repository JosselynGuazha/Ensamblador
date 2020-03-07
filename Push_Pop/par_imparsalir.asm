section .data
    ;pedir un numero, comparar si es para pedir otro numero, si es impar salir del programa
    msj_a: db 10, 'El numero es par', 10
    ln_a equ $ - msj_a

		msj_i: db 10, 'El numero es impar', 10
	  len_i: equ $-msj_i

    b db 10, "ingrese otro numero", 10
    len_b equ $ - b

    nlinea db 10, 10, 0
    lnlinea equ $ - nlinea

section .bss
    num resb 1

section .text
    global _start

_start:
		mov eax, 4
		mov ebx, 1
		mov ecx, b
		mov edx, len_b
		int 80H

		mov eax,03
		mov ebx,02
		mov ecx,num
		mov edx,2
		int 80H

		mov ebx,[num]
		sub ebx,'0'
		and ebx,1
		jz par
		jmp impar

par:
		mov eax, 4
		mov ebx, 1
		mov ecx, msj_a
		mov edx, ln_a
		int 80H

		loop _start

impar:
    mov eax,04
    mov ebx,01
    mov ecx,msj_i
    mov edx,len_i
    int 80H

    jmp salir

salir:
    mov eax, 4
    mov ebx, 1
    mov ecx, nlinea
    mov edx, lnlinea
    int 80h

    mov eax, 1
    mov ebx, 0
    int 80h
