section .data
	mensaje db "Ingrese su nombre",0xa
	tamano equ $-mensaje
	mensaje2 db "El nombre es ",0xa
    tamano2 equ $-mensaje2
section .bss
	nombre resb 5
	tamanoNombre equ $-nombre
section .text
	global _start
_start:

	mov eax,4
    mov ebx,1
    mov ecx,mensaje
    mov edx,tamano
    int 80H

	mov eax,3
	mov ebx,2
	mov ecx,nombre
	mov edx,4
	int 80H

	mov eax,4
    mov ebx,1
    mov ecx,mensaje2
    mov edx,tamano2
    int 80H
	
	mov eax,4
	mov ebx,1
	mov ecx,nombre
	mov edx,4
	int 80H

	mov eax,1
	mov ebx,0
	int 80H
