%macro escribir 2
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

section .data
    archivo1 db "/home/josselyn/Documentos/ensamblador/Archivos/arreglo1.txt",0
    archivo2 db "/home/josselyn/Documentos/ensamblador/Archivos/arreglo2.txt",0
    mensaje_error db "error en el archivo",10
    len_error equ $ -mensaje_error

    linea db " ",10
    len_linea equ $ -linea

    resultado db "     "
    len  equ $- resultado


section .bss
    texto1 resb 5
    texto2 resb 5
    idarchivo1 resb 1
    idarchivo2 resb 1

section .text
    global _start
_start:

;***************Primer Archivo**************

;*******abrir el archivo********
    mov eax,5  ;se convoca una rubrutina de lectura al SO
    mov ebx,archivo1
    mov ecx,0
                ; modos de acceso
                ; R-only = 0
                ; W-only = 1
                ; RDWR = 2
    mov edx,0
    int 80H

;*******Test del archivo********
    test eax,eax
    jz error

;*******asignar id al archivo  ********
    mov dword [idarchivo1],eax

    mov eax,3
    mov ebx,[idarchivo1]
    mov ecx, texto1
    mov edx,5
    int 80h

    escribir texto1,5


    escribir linea,len_linea

;***************Segundo Archivo**************

;*******abrir el archivo********
    mov eax,5  ;se convoca una rubrutina de lectura al SO
    mov ebx,archivo2
    mov ecx,0
                ; modos de acceso
                ; R-only = 0
                ; W-only = 1
                ; RDWR = 2
    mov edx,0
    int 80H

;*******Test del archivo********
    test eax,eax
    jz error
;*******asignar id al archivo  archivo********
    mov dword [idarchivo2],eax

    mov eax,3
    mov ebx,[idarchivo2]
    mov ecx, texto2
    mov edx,5
    int 80h

    escribir texto2,5



    escribir linea,len_linea
    

;****************Proceso de Suma*************
    mov esi,4
    mov ecx,5
    clc           ;desactivar el bit(estado) de la bandera carry

procesoSuma:
    mov al,[texto1+esi]

    adc al,[texto2+esi]
    aaa             ;esta instruccion s|olo trabaja con al
    pushf       ;manda a pila todos los estados de bandera
    or al,30h   ;aas
    popf
    
    mov [resultado+esi],al
    dec esi 
    loop procesoSuma
    

    escribir resultado,5

    jmp salir



error:
    escribir mensaje_error,len_error

salir:

    mov eax,1
    int 80h