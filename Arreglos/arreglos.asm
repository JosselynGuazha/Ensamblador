section .data
    msj db "Ingrese 6 número ",10
    len equ $ - msj
    msj1 db 10,"Número Mayor es: ",10
    len1 equ $ - msj1

    msj2 db 10,"Número Menor es: ",10
    len2 equ $ - msj2

    ;Definir el arreglo
    arreglo db 0,0,0,0,0,0
    len_arreglo equ $ - arreglo

section .bss
    numero resb 2

section .text
    global _start

_start:

    mov eax,4
    mov ebx,1
    mov ecx,msj
    mov edx,len
    int 80h
    
    ;asignacion del arreglo en las posiciones efectivas
    mov esi,arreglo ;indice fuente
    mov edi,0 ;indice destino-posicion

leer:
    mov eax,3
    mov ebx,0
    mov ecx,numero
    mov edx,2
    int 80h

    ;asignacion de un numeri en el arreglo
    mov al,[numero]
    sub al,'0'
    mov [esi],al

    ;incrementar una posicion en el arreglo DI
    add esi,1
    add edi,1

    ;comparar ṕara el salto
    cmp edi,len_arreglo
    jb leer

    ;reiniciar el arreglo
    mov esi,arreglo
    mov edi,0

imprimir:
    mov al,[esi]
    add al,'0'
    mov [numero],al

    mov eax,4
    mov ebx,1
    mov ecx,numero
    mov edx,1
    int 80h


    ;incrementar una posicion en el arreglo DI
    add esi,1
    add edi,1

    ;comparar ṕara el salto
    cmp edi,len_arreglo
    jb imprimir


    mov esi,arreglo
    mov edi,0

    mov bl,0

mayor:
    mov al,[arreglo+edi]
  
    cmp al,bl 
    jb incrementar
    mov bl,al
    

incrementar:
    ;incrementar una posicion en el arreglo DI

    add edi,1

    ;comparar ṕara el salto
    cmp edi,len_arreglo
    jb mayor
    jmp presentar

presentar:

    add bl, '0'
	mov [numero], bl

    mov eax,4
    mov ebx,1
    mov ecx,msj1
    mov edx,len1
    int 80h

    mov eax,4
    mov ebx,1
    mov ecx,numero
    mov edx,1
    int 80h
    
salir:
    mov eax,1
    int 80h
