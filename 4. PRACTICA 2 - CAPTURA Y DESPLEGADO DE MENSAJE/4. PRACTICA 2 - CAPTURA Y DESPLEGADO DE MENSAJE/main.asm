; Materia: Lenguajes de Interfaz
; Nombre: Lugo Martinez Jennifer Scarlet
; Horario: 10:00-11:00 AM 
; Docente: Dr. José Luis Medina Jiménez

INCLUDE Irvine32.inc

.data
    mensaje BYTE "Escribe tu nombre: ", 0 ; 
    nombre BYTE 30 DUP(0) ;

.code
main PROC
    ; Mostramos el mensaje en pantalla
    mov edx, OFFSET mensaje ; Copiamos la direccion donde inicia el mensaje
    call WriteString ; Imprime la cadena almacenada en mensaje

    mov edx, OFFSET nombre ; Copiamos la direccion donde se guardara el nombre
    mov ecx, SIZEOF nombre ; Copiamos el tamaño maximo del buffer

    call ReadString ; Lee lo que escribe el usuario y lo guarda en nombre

    ; Mostramos el nombre que escribio el usuario
    mov edx, OFFSET nombre ; Copiamos la direccion donde esta guardado el nombre
    call WriteString ; Imprime la cadena almacenada en nombre
    call Crlf ; Realiza un salto de linea

    exit

main ENDP

END main
