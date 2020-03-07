;numero de caracteres que se pueden

section .data
	msj db 'Desplegar 9 veces',10
	len equ $ -msj
	ass times 9 db 10,'*'
	len_as equ $ -ass
section .text
	global _start
_start:
	mov eax,4
        mov ebx,1
        mov ecx,msj
        mov edx,len
        int 80H

	mov [msj],dword 'Hola'

	mov eax,4
        mov ebx,1
        mov ecx,ass
        mov edx,len_as
        int 80H

	mov [msj+15],dword '****'

	mov eax,4
        mov ebx,1
        mov ecx,msj
        mov edx,len
        int 80H

	mov eax,1
	int 80H
