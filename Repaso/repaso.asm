%macro presentar 2
    mov eax,4
    mov ebx,1
    mov ecx,%1
    mov edx,%2
    int 80h
%endmacro
%macro leer 2
    mov eax,3
    mov ebx,2
    mov ecx,%1
    mov edx,%2
    int 80h
%endmacro

section .data
    msj1 db 10,"Ingrese Numero 1: "
    len1 equ $ -msj1
    msj2 db 10,"Ingrese Numero 2: "
    len2 equ $ -msj2

    ingreseOpcion db 10,"Ingrese Opcion ",10,"1. Suma",10,"2. Resta",10,"3. Multiplicacion",10,"4. Division",10
    lenOpcion equ $ -ingreseOpcion

    msj3 db 10,"La suma es: "
    len3 equ $ -msj3

    msj4 db 10,"La Resta es: "
    len4 equ $ -msj4

    msj5 db 10,"La Multiplicacion es: "
    len5 equ $ -msj5

    cociente db 10,"Cociente es: "
    lenC equ $ -cociente
    residuo db 10,"Residuo es: "
    lenR equ $ -residuo

    
section .bss
    n1 resb 1
    n2 resb 1
    opcion resb 1
    suma resb 1
    resta resb 1
    multi resb 1
    co resb 1
    re resb 1
section .text
    global _start:
_start:

;ingresar y leer numeros
    presentar msj1,len1
    leer n1,2
    presentar msj2,len2
    leer n2,2

    presentar ingreseOpcion,lenOpcion
    leer opcion,2

;opcion 
    mov bl,[opcion]
    sub bl,'0'

    cmp bl,1
    je sumar

    cmp bl,2
    je restar

    cmp bl,3
    je multiplicacion

    cmp bl,4
    je dividir

    jmp salir

sumar:
;operacion
    mov eax,[n1]
    mov ebx,[n2]
    sub eax,'0'
    sub ebx,'0'
    add eax,ebx
    add eax,'0'
    mov [suma],eax 
    int 80h

    presentar msj3,len3
    presentar suma,1

    jmp salir

restar:
;proceso
    mov eax,[n1]
    mov ebx,[n2]
    sub eax,'0'
    sub ebx,'0'
    sub eax,ebx
    add eax,'0'
    mov [resta],eax
    int 80h

    presentar msj4,len4
    presentar resta,1

    jmp salir

multiplicacion:
;proceso
    mov al,[n1]
    mov bl,[n2]
    sub al,'0'
    sub bl,'0'
    mul bl  
    add al,'0'
    mov [multi],al

    presentar msj5,len5
    presentar multi,1

    jmp salir

dividir:
;proces0
    mov al,[n1]
    mov bl,[n2]
    sub al,'0'
    sub bl,'0'
    div bl
    add al,'0'
    mov [cociente],al
    add ah,'0'
    mov [residuo],ah

    presentar co,1
    presentar cociente,lenC
    presentar re,1
    presentar residuo,lenR
    

salir:
    mov eax,1
    int 80h




