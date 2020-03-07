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
    msj01 db "Ingrese el primer numero:",10
	len01 equ $ - msj01

	msj02 db "Ingrese el segundo numero:",10
	len02 equ $ - msj02

    msj1 db "Número Mayor"
    len1 equ $ - msj1
    msj2 db "Número Menor"
    len2 equ $ - msj2
    msj3 db "Número igual"
    len3 equ $ - msj3

section .bss
	n1 resb 1
	n2 resb 1

section .text
    global _start
_start:
    escribir msj01,len01
    lectura n1,2
    escribir msj02,len02
    lectura n2,2
;*********proceso**********
    mov al,[n1]
    mov bl,[n2]
    cmp al,bl
    jg mayor
    jmp menor
    je igual

mayor:
    escribir msj1,len1
    jmp salir

menor:
    escribir msj2,len2
    int 80h
    jmp salir
igual:
    escribir msj3,len3
    int 80h

salir:
    mov eax,1
	int 80h


    mayor:
    escribir msj1,len1
    lectura n1,3
    mov al,[n1]
    mov bl, 9
	sub al,'0'
    cmp al,bl
    jg inicio
    jmp salir
    je inicio




division:
;*********proceso**********
	inc cl
	mov al,[n1]
	mov bl,cl
	sub al,'0'
	div cl
	add al,'0'
	mov [cociente],al
	add ah,'0'
	mov [residuo],ah

comparar:
	sub residuo,'0'
    cmp residuo,0
    jg division
    je division 

    	