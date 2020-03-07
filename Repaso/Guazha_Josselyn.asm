

section .data 

	mensaje db "El resultado es: ",10
	len equ $ - mensaje

	msj1 db "Ingrese el primer numero: ",10
	len1 equ $ - msj1

	msj3 db "Resultado es: ",10
	len3 equ $ - msj3


section .bss

	n1 resb 1
	n2 resb 1
	division resb 1
	residuo resb 1


section .text
	global _start
_start:

;*******ingrese primer numero**********

	
	mov eax,4
	mov ebx,1
	mov ecx,msj1
	mov edx,len1
	int 80h

	mov eax,3
	mov ebx,2
	mov ecx,n1
	mov edx,2
	int 80h



;*******proceso**********

    mov al,[n1]
	mov bl,2
	sub al,'0'
	div bl
	add al,'0'
	mov [division], al
	add ah,'0'
	mov [residuo], ah


    mov eax,4
	mov ebx,1
	mov ecx,residuo
	mov edx,1
	int 80h
    

    mov al,[division]
	mov bl,2
	sub al,'0'
	div bl
	add al,'0'
	mov [division], al
	add ah,'0'
	mov [residuo], ah


    mov eax,4
	mov ebx,1
	mov ecx,residuo
	mov edx,1
	int 80h

    mov al,[division]
	mov bl,2
	sub al,'0'
	div bl
	add al,'0'
	mov [division], al
	add ah,'0'
	mov [residuo], ah


    mov eax,4
	mov ebx,1
	mov ecx,residuo
	mov edx,1
	int 80h

    mov al,[division]
	mov bl,2
	sub al,'0'
	div bl
	add al,'0'
	mov [division], al
	add ah,'0'
	mov [residuo], ah


    mov eax,4
	mov ebx,1
	mov ecx,residuo
	mov edx,1
	int 80h



salir:  
    
    mov eax,1
	int 80h

    
	