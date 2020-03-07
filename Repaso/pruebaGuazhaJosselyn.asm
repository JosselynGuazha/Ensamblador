
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

	msj2 db "El numero es Primo",10
	len2 equ $ - msj2

    msj3 db 10,"El numero NO es Primo "
	len3 equ $ -msj3


section .bss
	n1 resb 1
	n2 resb 1
	cociente resb 1
	residuo resb 1
	

section .text
    global _start
_start:

	escribir msj1,len1
    lectura n1,3

	
	mov cx,1

division:
	mov [n2],cx
	mov al,[n1]
	mov bl,[n2]
	sub al,'0'
	sub bl,'0'
	div bl
	cmp ah,0
	jz ciclo
	jmp comparar

ciclo:
    inc cx
	jmp final


comparar:
	inc cx
	cmp al,bl
	jg division
	je final
	
	
final:
	cmp bl,2
	jg nprimo
	je primo


primo:
	escribir msj2,len2
	jmp salir

nprimo:
	escribir msj3,len3
	jmp salir

salir:
    mov eax,1
	int 80h