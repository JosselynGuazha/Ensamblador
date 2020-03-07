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
	msj1 db "Operacion de division de 8 bits"
	len1 equ $ -msj1
	mensaje1 db "Primer valor"
	lenUno equ $ -mensaje1
	mensaje2 db "Segundo Valor"
	lenDos equ $ -mensaje2
	msj2 db 10,"El cociente es: "
	len2 equ $ -msj2
	msj3 db 10,"El residuo es : "
	len3 equ $ -msj3
	new_line db 10,""
	
section .bss
	n1 resb 1
	n2 resb 1
	residuo resb 1
	cociente resb 1
section .text
	global _start
_start:
	mov cl, 1

;********Primer Valor*********
	escribir mensaje1, lenUno 
	lectura n1, 2

;********Segundo Valor*******
	escribir mensaje2, lenDos 
	lectura n2, 2

;********Operacion*********
	escribir msj1,len1
	mov al,[n1]
	mov bl,[n2]
	sub al,'0'
	sub bl,'0'
	div cl
	add al,'0'
	mov [cociente],al
	add ah,'0'
	mov [residuo],ah
;********cociente**********
	escribir msj2,len2
	escribir cociente,1
;********residuo**********
	escribir msj3,len3
	escribir residuo,1
;********final**********

	escribir new_line, 1
 	mov eax,1
	int 80h
;[residuo]

