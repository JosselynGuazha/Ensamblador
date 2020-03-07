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

    msj db 10,"Carpeta y Archivo creado con Exito",10
    len_msj equ $ -msj

    mensaje_error db "error en el archivo",10
    len_error equ $ -mensaje_error

    directorio db '/home/josselyn/Documentos/ensamblador/Archivos/Fernando',0

    archivo db '/home/josselyn/Documentos/ensamblador/Archivos/Fernando/prueba4.txt',0
    
section .bss
    texto resb 35
    idarchivo resb 1

section .text
    global _start:
_start:

    escribir mensaje,len

    ;******crear Directorio********
    mov eax, 39 ;servicion para crear un directorio
    mov ebx, directorio ;define la ruta del servicio
    mov ecx, 0x1FF ;definimos el permiso 777
    int 80h

    
    ;******leer texto******* 
    mov eax,3
    mov ebx,2
    mov ecx,texto
    mov edx,35
    int 80h
    
    ;******crear archivo********
    mov eax,8 ;subrutina
    mov ebx,archivo ;ruta
    mov ecx,1 ;acceso
    mov edx,0x1FF ;permiso
    int 80h
    

    ;*******Test del archivo********
    test eax,eax
    jz error

    ;*******asignar id al archivo  archivo********
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
    escribir msj,len_msj

    mov eax, 1
    int 80h
