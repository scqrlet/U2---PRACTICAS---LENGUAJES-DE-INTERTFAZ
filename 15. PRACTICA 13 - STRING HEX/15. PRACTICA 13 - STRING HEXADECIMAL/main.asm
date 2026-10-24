; Materia: Lenguajes de Interfaz
; Nombre: Lugo Martinez Jennifer Scarlet
; Horario: 10:00-11:00 AM 
; Docente: Dr. José Luis Medina Jiménez

INCLUDE Irvine32.inc

.data
    valorOriginal DWORD 12AB34CDh
    buffer BYTE 9 DUP(0)

.code
main PROC
    mov eax, valorOriginal ; Copiamos el valor hexadecimal en EAX
    mov ecx, 8 ; Guardamos la cantidad de digitos a convertir
    mov esi, 7 ; Guardamos la ultima posicion del buffer

conv_loop:
    push eax ; Guardamos el valor actual de EAX

    and eax, 0Fh ; Obtenemos los ultimos 4 bits

    cmp al, 9 ; Comparamos si el valor es de 0 a 9
    jbe es_num ; Salta si corresponde a un numero

    sub al, 10 ; Ajustamos el valor para letras
    add al, 'A' ; Convertimos a letra hexadecimal
    jmp almacenar ; Salta para guardar el caracter

es_num:
    add al, '0' ; Convertimos el numero a ASCII

almacenar:
    mov buffer[esi], al ; Guardamos el caracter en el buffer

    pop eax ; Recuperamos el valor original
    shr eax, 4 ; Desplazamos 4 bits a la derecha

    dec esi ; Retrocedemos una posicion en el buffer
    loop conv_loop ; Regresa al ciclo hasta completar los 8 digitos

    mov edx, OFFSET buffer ; Copiamos la direccion de la cadena
    call WriteString ; Imprime la cadena en pantalla
    call Crlf ; Realiza un salto de linea

    exit 

main ENDP

END main
