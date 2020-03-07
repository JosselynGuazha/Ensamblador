
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
	
	msj1 db "Ingrese el primer numero:",10
	len1 equ $ - msj1

	msj2 db "Ingrese el segundo numero:",10
	len2 equ $ - msj2

	Ingrese_opcion db "Ingrese la Opcion: ",10,"1. Suma",10,"2. Resta",10,"3. Multiplicacion",10,"4. Division",10
	lenOpcion equ $ - Ingrese_opcion

    mensajeSuma db 10,"El resultado de la Suma es: ",10
	lenSuma equ $ - mensajeSuma

    mensajeResta db 10,"El resultado de la Resta es: ",10
	lenResta equ $ - mensajeResta

    mensajeMul db 10,"El resultado de la Multiplicacion es: ",10
	lenMul equ $ - mensajeMul


    msjCociente db 10,"El cociente es: "
	lenCociente equ $ -msjCociente
	msjResiduo db 10,"El residuo es : "
	lenResiduo equ $ -msjResiduo

	new_line db 10,""


section .bss
	
	n1 resb 1
	n2 resb 1
	opcion resb 2
	suma resb 1
    resta resb 1
    multiplicacion resb 1
    residuo resb 1
	cociente resb 1

	

section .text
	global _start
;etiqueta del inicio del seg. de Co.
_start:

;*******ingrese primer numero**********
	escribir msj1, len1 
	lectura n1, 2
;*******ingrese segundo numero**********
	escribir msj2, len2 
	lectura n2, 2

;*******ingrese opcion numero**********
	escribir Ingrese_opcion, lenOpcion 

;*****Opcion*******
	lectura opcion,2
	mov bl,[opcion]
	sub bl,'0'

	cmp bl,1
	je sumar

	cmp bl,2
	je restar

	cmp bl,3
	je multi

	cmp bl,4
	je division

    jmp salir


sumar:    
;******SUMA********
;*******proceso de Suma**********
	mov ax,[n1]
	mov bx,[n2]
	sub ax,'0'
	sub bx,'0'
	add ax,bx
	add ax,'0'	
	mov [suma], ax
;*******imprimir******
	escribir mensajeSuma, lenSuma 	
	escribir suma, 1 
    jmp salir


restar:
;*************RESTA***********
;*******proceso **********
	mov ax,[n1]
	mov bx,[n2]
	sub ax,'0'
	sub bx,'0'
	sub ax,bx
			
	mov [resta], ax
;*******imprimir resta**********
	escribir mensajeResta, lenResta	
	escribir resta, 1 
    jmp salir


multi:
;********MULTIPLICACION*********
;*******proceso Multi**********
	mov al,[n1]
	mov bl,[n2]
	sub al,'0'
	sub bl,'0'
	mul bl
	add al,'0'	
	mov [multiplicacion], al
	add ah,'0'
;*******imprimir Multiplicacion**********
	escribir mensajeMul, lenMul 	
	escribir multiplicacion, 1 
    jmp salir


division:
;*******DIVISION*********
;********Operacion*********
	mov al,[n1]
	mov bl,[n2]
	sub al,'0'
	sub bl,'0'
	div bl
	add al,'0'
	mov [cociente],al
	add ah,'0'
	mov [residuo],ah
;********cociente**********
	escribir msjCociente,lenCociente
	escribir cociente,1
;********residuo**********
	escribir msjResiduo,lenResiduo
	escribir residuo,1
    jmp salir


salir:
;********final**********
	escribir new_line, 1


	mov eax,1
	int 80h
