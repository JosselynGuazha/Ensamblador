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
    msj db "Ingrese un numero: "
    len equ $-msj
    msj_enter db 10,""
section .bss
    numero resb 2
section .text
    global _start:
_start:

    ;imprimir mensaje
    escribir msj,len
    ;leer numero
    lectura numero,1
    jmp imprimir

    ;proceso
imprimir:
    mov eax,[numero]
    push eax

    escribir numero, 1
    escribir msj_enter,1
 
    pop eax
    sub eax,'0' ;numero
    dec eax
    mov ecx,eax
    add eax,'0' ;
    mov [numero],eax

    cmp ecx,0
    jz salir
    jmp imprimir

salir:
    mov eax,1
    int 80H