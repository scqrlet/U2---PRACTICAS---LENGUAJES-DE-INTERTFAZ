INCLUDE Irvine32.inc

.data
    msg BYTE "Escribe un numero: ", 0
    incremento BYTE "Incremento: ", 0
    decremento BYTE "Decremento: ", 0

.code
main PROC
    mov edx, OFFSET msg ; Copiamos la direccion del mensaje para pedir un numero
    call WriteString ; Imprime el mensaje en pantalla
    call ReadInt ; Lee el numero que escribe el usuario
    mov ebx, eax ; Guardamos el numero original

    mov edx, OFFSET incremento ; Copiamos la direccion del mensaje de incremento
    call WriteString ; Imprime el mensaje en pantalla
    inc eax ; Aumenta 1 al valor de EAX
    call WriteInt ; Imprime el resultado
    call Crlf ; Realiza un salto de linea

    mov eax, ebx ; Copiamos nuevamente el numero original en EAX

    mov edx, OFFSET decremento ; Copiamos la direccion del mensaje de decremento
    call WriteString ; Imprime el mensaje en pantalla
    dec eax ; Disminuye 1 al valor de EAX
    call WriteInt ; Imprime el resultado
    call Crlf ; Realiza un salto de linea

    exit 

main ENDP

END main