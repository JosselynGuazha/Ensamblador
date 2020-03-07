%macro escribir 2
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

section .data
    mensaje db "Ingrese Texto",10
    len equ $ -mensaje

    mensaje1 db "Ingrese nombre del Directorio",10
    len1 equ $ -mensaje1

    archivo db "/home/josselyn/Documentos/esamblador/codigo2.txt",0
    mensaje_error db "error en el archivo",10
    len_error equ $ -mensaje_error

section .bss
    texto resb 35
    idarchivo resb 1
    direccion resb 1

section .text
    global _start
_start:
    escribir mensaje1,len1
    

    escribir mensaje,len
    
    mov eax,3
    mov ebx,2
    mov ecx,texto
    mov edx,35
    int 80h

    mov eax,8 ;subrutina
    mov ebx,archivo ;ruta
    mov ecx,1 ;acceso
    mov edx,0x1FF ;permiso
    int 80h
    
    test eax,eax
    jz error

    mov dword[idarchivo],eax

    mov eax,4
    mov ebx,[idarchivo]
    mov ecx, texto
    mov edx,35
    int 80h

    jmp salir

error:
    escribir mensaje_error,len_error

salir: 
    mov eax,1
    int 80h