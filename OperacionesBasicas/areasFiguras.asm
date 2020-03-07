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
	
	Ingrese_opcion db "Ingrese Figura a Calcular el Area ",10,"1. Cuadrado",10,"2. Circulo",10,"3. Rectangulo",10
	lenOpcion equ $ - Ingrese_opcion

    msj1 db "Ingrese lado del cuadrado: ",10
	len1 equ $ - msj1
    msjCuadrado db "El area del cuadrado es: ",10
	lenCuadrado equ $ - msjCuadrado

	msj2 db "Ingrese el radio del Circulo: ",10
	len2 equ $ - msj2
    msjCirculo db "El area del cuadrado es: ",10
	lenCirculo equ $ - msjCirculo

    msj3 db "Ingrese la Base del Rectangulo: ",10
	len3 equ $ - msj3

	msj4 db "Ingrese Altura del Rectangulo: ",10
	len4 equ $ - msj4

    msjRectangulo db "El area del cuadrado es: ",10
	lenRectangulo equ $ - msjRectangulo


	new_line db 10,""


section .bss
	opcion resb 1
	n1 resb 1
	n2 resb 1
    n3 resb 1
	n4 resb 1
    cuadrado resb 1
    circulo resb 1
    rectangulo resb 1

section .text
	global _start
;etiqueta del inicio del seg. de Co.
_start:
;*******Menu*******

    escribir Ingrese_opcion, lenOpcion

    lectura opcion,2
	mov bl,[opcion]
	sub bl,'0'

	cmp bl,1
	je AreaCuadrado

	cmp bl,2
	je AreaCirculo

	cmp bl,3
	je AreaRectangulo

    jmp salir


AreaCuadrado:
;********Area de Cuadrado******
    escribir msj1, len1 
	lectura n1, 2
    ;********Operacion*****
    mov al,[n1]
	mov bl,[n1]
	sub al,'0'
	sub bl,'0'
	mul bl
	add al,'0'	
	mov [cuadrado], al
	add al,'0'
;*******imprimir Cuadrado**********
	escribir msjCuadrado, lenCuadrado	
	escribir cuadrado, 1 
    jmp salir


AreaCirculo:
;********Area de circulo******
    escribir msj2, len2 
	lectura n2, 2
    ;********Operacion*****
    mov al,[n2]
	mov bl,[n2]
	sub al,'0'
	sub bl,'0'
	mul bl
    mov bl,3
    mul bl
	add al,'0'	
	mov [circulo], al
    add ah,'0'
;*******imprimir Circulo**********
	escribir msjCirculo, lenCirculo	
	escribir circulo, 1 
    jmp salir


AreaRectangulo:
;********Area de Rectangulo******
    escribir msj3, len3 
	lectura n3, 2
    escribir msj4, len4 
	lectura n4, 2
    ;********Operacion*****
    mov al,[n3]
	mov bl, [n4]
	sub al,'0'
	sub bl,'0'
	mul bl
	add al,'0'	
	mov [rectangulo], al
	add ah,'0'
;*******imprimir Rectangulo**********
	escribir msjRectangulo, lenRectangulo	
	escribir rectangulo, 1
    jmp salir 


salir:
;********final**********
	escribir new_line, 1


	mov eax,1
	int 80h
