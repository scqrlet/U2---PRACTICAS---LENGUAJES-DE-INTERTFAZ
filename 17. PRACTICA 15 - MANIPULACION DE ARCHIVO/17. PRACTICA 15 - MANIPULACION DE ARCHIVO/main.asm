; Materia: Lenguajes de Interfaz
; Nombre: Lugo Martinez Jennifer Scarlet
; Horario: 10:00-11:00 AM 
; Docente: Dr. José Luis Medina Jiménez
; Practica: 17. PRACTICA 15 - MANIPULACION DE ARCHIVO
; Descripcion: Vimos como es la creacion de un archivo el modificarla borrarla y cerrarla

INCLUDE Irvine32.inc

.data
nombreArchivo BYTE "Inventario.txt", 0
texto BYTE "125", 0
archivoHandle DWORD ?
mensajeExito BYTE "Archivo guardado correctamente.", 0
mensajeError BYTE "No se pudo guardar el archivo.", 0

.code
main PROC
    ; CREA EL ARCHIVO DE TEXTO
    mov edx, OFFSET nombreArchivo ; Copiamos la direccion del nombre del archivo
    call CreateOutputFile ; Crea el archivo

    cmp eax, INVALID_HANDLE_VALUE ; Comparamos si hubo un error al crear el archivo
    je error ; Salta a error si no se pudo crear

    mov archivoHandle, eax ; Guardamos el identificador del archivo

    mov eax, archivoHandle ; Copiamos el identificador del archivo
    call CloseFile ; Cierra el archivo

    test eax, eax ; Comparamos si el archivo se cerro correctamente
    jz error ; Salta a error si ocurrió un problema

    mov edx, OFFSET mensajeExito ; Copiamos la direccion del mensaje de exito
    call WriteString ; Imprime el mensaje en pantalla

    jmp fin ; Salta al final del programa

errorEscritura:
    mov eax, archivoHandle ; Copiamos el identificador del archivo
    call CloseFile ; Cierra el archivo

error:
    mov edx, OFFSET mensajeError ; Copiamos la direccion del mensaje de error
    call WriteString ; Imprime el mensaje en pantalla

fin:
    exit

main ENDP

END main
