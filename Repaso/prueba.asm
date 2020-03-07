
%macro escribir 2
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro
%macro lectura 2
	mov eax,3
	mov ebx,2
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

section .data
    msj1 db "Ingrese un numere entre 1-9",10
	len1 equ $ - msj1

	;msj2 db "El numero es Primo",10
	;len2 equ $ - msj2

    ;msj3 db 10,"El numero NO es Primo "
	;len3 equ $ -msj3


section .bss
	n1 resb 1
	

section .text
    global _start
_start:


inicio:
    escribir msj1,len1
    lectura n1,2
    mov eax,[n1]
    sub eax,'0'
    cmp eax,9
	jg inicio
	jmp salir

division:
salir:
    mov eax,1
	int 80h