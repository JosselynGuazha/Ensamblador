%macro escribir 2
    mov eax,4
    mov ebx,1
    mov ecx,%1
    mov edx,%2
    int 80h
%endmacro

section .data
    msj db 10,"Carpeta o directorio creado",10
    len_msj equ $ -msj

    msj1 db "Ingresa direccion donde crear el Directorio ",10
	len1 equ $ - msj1

    ;path db '/home/josselyn/Documentos/Fernando',0
    ;len_path equ $ -path

    path db '/home/josselyn/Documentos/ensamblador/Archivos/Fernando/Hola.txt',0
    len_path equ $ -path


section .bss
	direccion resb 2

section .text
    global _start:
_start:

    escribir msj1,len1

    mov eax,3
	mov ebx,2
	mov ecx,direccion
    mov edx,35
	int 80h
    mov eax, [direccion] 

    mov eax, 39 ;servicion para crear un directorio
    mov ebx, direccion ;define la ruta del servicio
    mov ecx, 0x1FF ;definimos el permiso 777
    int 80h

    escribir msj,len_msj

    mov eax, 1
    int 80h

