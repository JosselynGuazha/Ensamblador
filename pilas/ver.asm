section .data
    msj1 db "*"
    len_msj1 equ $ - msj1

    msj2 db " "
    len_msj2 equ $ - msj2

    msj3 db "",10
    len_msj3 equ $ - msj3

section .bss
    num resb 2

section .text
    global _start
_start:
    ;Definir 
    mov ecx,9
    mov eax,1
    mov ebx,ecx
   
    


ciclo:
    mov ecx,ebx
    push ebx
    push eax
    push ecx
    push eax
    
    pop ecx



ciclo2:

    push ecx		
	call imprimir_espacio
	pop ecx
    loop ciclo2

    

    pop ecx
    push ecx
    

ciclo3:
    push ecx		
	call imprimir_as
	pop ecx
    loop ciclo3

    call imprimir_enter

    pop ecx
    pop eax
    pop ebx

    sub ebx,2
    inc eax
    
    
    loop ciclo
    jmp salir


imprimir_as:
    mov eax, 4
    mov ebx, 1
    mov ecx, msj1
    mov edx,len_msj1
    int 80H
    ret

imprimir_espacio:
    mov eax, 4
    mov ebx, 1
    mov ecx, msj2
    mov edx,len_msj2
    int 80H
    ret


imprimir_enter:
    mov eax, 4
    mov ebx, 1
    mov ecx, msj3
    mov edx,len_msj3
    int 80H
    ret




salir:
    mov eax,1
    int 80h