section .data
    numero1 db "518"
    numero2 db "197"
    resultado db "   "
    len  equ $- resultado

section .text
    global _start
_start:
    mov esi,3
    mov ecx,4
    clc           ;desactivar el bit(estado) de la bandera carry

procesoResta:
    mov al,[numero1+esi]
   

    ;debe ejercutarse 4 veces


    sbb al,[numero2+esi]
    aas             ;esta instruccion s|olo trabaja con al ajuste
    pushf       ;manda a pila todos los estados de bandera
    or al,30h   ;aas
    popf
    
    mov [resultado+esi],al
    dec esi 
    loop procesoResta

    mov eax, 4
    mov ebx,1
    mov ecx,resultado
    mov edx,len
    int 80h


    mov eax,1
    int 80h
