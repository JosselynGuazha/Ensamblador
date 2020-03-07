section .data
   
	as db  "*"
	msj_enter db 10,""

section .bss
	contador_bx resb 1
    contador_cx resb 1

section .text 
    global _start:
_start:

	mov ecx, 9
	;mov ebx, 9

    
l1:
    push ecx
    ;mov ebx,ecx
    push ecx
    call imprimir_linea
    pop ecx
    ;mov ecx,ebx
    ;push ebx

l2:
    push ecx
    ;imprimir asterisco
    call imprimir_asterisco
    pop ecx
    loop l2

    pop ecx
    ;pop ebx
    ;mov ecx,ebx

    loop l1
    jmp salir


    

imprimir_linea:
    mov eax, 4
    mov ebx, 1
    mov ecx, msj_enter
    mov edx,1
    int 80H

    ret

imprimir_asterisco:
    mov eax, 4
    mov ebx, 1
    mov ecx, as
    mov edx,1
    int 80H
    
    ret   


salir:
    mov eax,1
    int 80H
