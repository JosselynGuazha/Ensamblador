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
   
	as db  "*"
	msj_enter db 10,""

	
section .text 
    global _start:
_start:


	mov eax, 5
	mov ebx, 5
    jmp ciclo
    
ciclo:
	dec ebx	
	push ebx
	jmp imprimir

imprimir:
	
    dec eax	
	push eax
    escribir as,1
	pop eax
		
	cmp eax, 0
	jz regresar
	jmp imprimir

regresar:
	escribir msj_enter,1	
	pop ebx
	mov eax,ebx

	cmp ebx, 0
	jz salir
	jmp ciclo

salir:
    mov eax,1
    int 80H

