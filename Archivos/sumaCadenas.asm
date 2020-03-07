section .data
    numero1 db "3277"
    numero2 db "2566"
    resultado db "    "
    len  equ $- resultado

section .text
    global _start
_start:
    mov esi,3
    mov ecx,4
    clc           ;desactivar el bit(estado) de la bandera carry

procesoSuma:
    mov al,[numero1+esi]
    ;mov ah,[numero2+esi]
    ;adc al,ah

;debe ejercutarse 4 veces


    adc al,[numero2+esi]
    aaa             ;esta instruccion s|olo trabaja con al
    pushf       ;manda a pila todos los estados de bandera
    or al,30h   ;aas
    popf
    
    mov [resultado+esi],al
    dec esi 
    loop procesoSuma

    mov eax, 4
    mov ebx,1
    mov ecx,resultado
    mov edx,len
    int 80h




    mov eax,1
    int 80h


