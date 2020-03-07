%macro imprimir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

%macro leer 2
    mov eax, 3
    mov ebx, 2
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

section .data
    msj db "Ingrese 6 numeros",10
    len equ $-msj

    msj1 db "El numero mayor es: ",10
    len1 equ $-msj1


    num_mayor db 10,"Numero Mayor: "
    len_mayor equ $-num_mayor

    num_menor db 10,"Numero Menor: "
    len_menor equ $-num_menor

    arreglo db 0,0,0,0,0,0
    len_arreglo equ $-arreglo

section .bss
    numero resb 2
    mayor resb 2
    menor resb 2

section .text
    global _start

_start:
    imprimir msj, len

    ; asignacion del arreglo en las posiciones efectivas
    mov esi, arreglo
    mov edi, 0

lectura:
    leer numero, 2

    ; asignacion de un numero al arreglo
    mov al, [numero]
    sub al, '0'
    mov [esi], al

    add esi, 1
    add edi, 1

    ; comparar 
    cmp edi, len_arreglo
    jb lectura

    sub esi, len_arreglo
    mov edi, 0

    mov al, 0
    mov [mayor], al

    mov al, [esi]
    mov [menor], al


escribir:
    mov al, [esi]

    mov bl, [mayor]
    mov cl, [menor]

    cmp al, bl 
    jg mayorN

    cmp cl, al
    jg menorN
    
    add al, '0'
    mov [numero], al
    imprimir numero, 1 

    add esi, 1
    add edi, 1

    cmp edi, len_arreglo
    jb escribir

    mov al, [mayor]
    add al, '0'

    mov [mayor], al

    mov al, [menor]
    add al, '0'

    mov [menor], al    

    imprimir num_mayor, len_mayor
    imprimir mayor,2


    imprimir num_menor, len_menor
    imprimir menor,2



    jmp salir

mayorN:
    mov [mayor], al
    jmp escribir

menorN:
    mov [menor], al
    jmp escribir

salir:
    mov eax, 1
    int 80h