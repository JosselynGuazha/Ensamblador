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
	msj db "Ingrese un número:"
	len equ $ - msj
    as db  "*"
	new_line db '',10

section .bss
	n1 resb 2
	
section .text
	global _start

_start :
    escribir msj,len
    lectura n1,1

    jmp imprimir


imprimir:

    mov eax,[n1]

    push eax
    escribir as,1
    pop eax

    sub eax,'0'
    dec eax
    mov ecx,eax
    add eax,'0'
    mov [n1],eax



    cmp ecx,0
    jz salir
    jmp imprimir



salir:
    mov eax,1
    int 80h
