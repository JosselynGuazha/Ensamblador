%macro escribir 2
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

section .data
    archivo db "/home/josselyn/Documentos/ensamblador/Archivos/codigo1.txt",0
    mensaje_error db "error en el archivo",10
    len_error equ $ -mensaje_error


section .bss
    texto resb 35
    idarchivo resb 1

section .text
    global _start
_start:


;*******abrir el archivo********
    mov eax,5  ;se convoca una rubrutina de lectura al SO
    mov ebx,archivo
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
    mov dword [idarchivo],eax

    mov eax,3
    mov ebx,[idarchivo]
    mov ecx, texto
    mov edx,19
    int 80h

    escribir texto,35

;*******cerrar el archivo********
    mov eax,6
    mov ebx,[idarchivo]
    mov ecx,0
    mov edx,0
    int 80h
    jmp salir


error:
    escribir mensaje_error,len_error

salir:

    mov eax,1
    int 80h