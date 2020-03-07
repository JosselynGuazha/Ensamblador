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
    mensaje db "El resultado es: ",10
	len equ $ - mensaje

	msj1 db "Ingrese el primer numero: ",10
	len1 equ $ - msj1

	msj2 db "Ingrese el segundo numero: ",10
	len2 equ $ - msj2

	msj3 db "Resultado es: ",10
	len3 equ $ - msj3

section .bss
    n1 resb 1
	n2 resb 1
	multiplicacion resb 1

section .text
    global _start
_start:

;*******ingrese primer numero**********
	escribir msj1, len1 
	lectura n1, 2

;*******ingrese segundo numero**********
	escribir msj2, len2 
	lectura n2, 2

;*******proceso**********
	mov al,[n1]
	mov bl,[n2]
	sub al,'0'
	sub bl,'0'
	mul bl
	add al,'0'	
	mov [multiplicacion], al
	add ah,'0'
	
;*******imprimir Suma**********
	escribir mensaje, len 	
	escribir multiplicacion, 1 

	mov eax,1
	int 80h