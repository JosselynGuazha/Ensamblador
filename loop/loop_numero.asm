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
    mensaje db 10,"Hola "
    len equ $- mensaje
section .bss
    n1 resb 1
section .text
    global _start:
_start:
    
    mov ecx,9 ;siempre numerico
    
ciclo:
    
    push ecx
    
    add ecx,'0'
    mov [n1],ecx
    
    escribir mensaje,len
    escribir n1,1

    pop ecx

    loop ciclo
    jmp salir

salir:
    mov eax,1
    int 80h