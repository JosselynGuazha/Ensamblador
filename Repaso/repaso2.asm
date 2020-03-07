;Realizado por Josselyn Guazha

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

    msjCociente db 10,"El cociente es: "
	lenCociente equ $ -msjCociente

	msjResiduo db 10,"El residuo es : "
	lenResiduo equ $ -msjResiduo

section .bss
	n1 resb 1
	n2 resb 1
	cociente resb 1
    residuo resb 1

section .text
    global _start
_start:
    escribir msj1,len1
    lectura n1,2
    escribir msj2,len2
    lectura n2,2

    mov al,[n1]
	mov bl,[n2]
	sub al,'0'
	sub bl,'0'
    mov cx, 0

resta:
    sub al,bl
    inc cx
    jmp comparar

comparar:
    cmp al,bl
    jg resta
    je resta
mensaje:
    add al,'0'
    add cx,'0'
    mov [cociente],cx
    mov [residuo],al
    escribir msjCociente,lenCociente
    escribir cociente,1
    escribir msjResiduo,lenResiduo
    escribir residuo,1
salir:
    mov eax,1
    int 80h

