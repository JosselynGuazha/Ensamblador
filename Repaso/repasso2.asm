
section .data 

	msj1 db "Ingrese la base ",10
	len1 equ $ - msj1

    msj2 db "Ingrese el exponente ",10
	len2 equ $ - msj2

	msj3 db "Resultado es: ",10
	len3 equ $ - msj3


section .bss

	n1 resb 1
	n2 resb 2



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
	mov ebx,1
	mov ecx,n1
	mov edx,2
	int 80h

;*******ingrese segundo numero**********

	mov eax,4
	mov ebx,1
	mov ecx,msj2
	mov edx,len2
	int 80h

	mov eax,3
	mov ebx,2
	mov ecx,n2
	mov edx,1   
	int 80h

    
    mov ecx,[n2]
    sub ecx,'0'
    sub ecx,1

    mov al,[n1]
	sub al,'0'
    mov bl,al

    



;*******proceso**********
ciclo:  
	
	mul bl
    loop ciclo


salir:  
    
    add al,'0'	
	mov [n1], al

    mov eax,4
	mov ebx,1
	mov ecx,n1
	mov edx,1
	int 80h



	mov eax,1
	int 80h
