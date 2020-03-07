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
    msj1 db "Ingrese el primer numero:",10
	len1 equ $ - msj1

	msj2 db "Ingrese el segundo numero:",10
	len2 equ $ - msj2

    msj_negativo db 'Es negativo',10
    len_negativo equ $ -msj_negativo

    msj_positivo db 'Es positivo',10
    len_positivo equ $ -msj_positivo

section .bss
	n1 resb 2
	n2 resb 2

section .text
    global _start:
_start:

;*******ingrese primer numero**********
	escribir msj1, len1 
	lectura n1, 2
;*******ingrese segundo numero**********
	escribir msj2, len2 
	lectura n2, 2

;operacion
    mov ax,[n1]    
    mov bx,[n2]
    sub ax,'0'
	sub bx,'0' 
    sub ax,bx
    js negativo
    jmp positivo

positivo:
    escribir msj_positivo,len_positivo
    jmp salir

negativo:
    escribir msj_negativo,len_negativo
    jmp salir

salir:
    mov eax,1
    int 80h
