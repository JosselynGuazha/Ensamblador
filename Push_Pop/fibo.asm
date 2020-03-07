%macro escribir 2
    mov eax, 4
    mov ebx, 2
    mov ecx, %1
    mov edx, %2
    int 80H
%endmacro
section .data
    msj_a: db 10, 'inicio del ciclo', 10
	ln_a equ $ - msj_a
    msj_b: db 10, 'realizado por: ', 10
	ln_b equ $ - msj_b
    msj_c: db 10, 'Jhon', 10
	ln_c equ $ - msj_c
    msj_d: db 10, 'Fin del ciclo', 10
	ln_d equ $ - msj_d

  nlinea db 10, 10, 0
	lnlinea equ $ - nlinea

section .text
	global _start

_start:
    escribir msj_a, ln_a
    escribir msj_b, ln_b
    mov ecx, 5
    
l1:
	push ecx
	
    escribir msj_c, ln_c
    
	pop ecx
	loop l1

	jmp salir

salir:
    escribir msj_d, ln_d
	escribir nlinea, lnlinea
    
	mov eax, 1
	mov ebx, 0
	int 80h
