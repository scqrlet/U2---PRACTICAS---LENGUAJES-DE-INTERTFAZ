INCLUDE Irvine32.inc

.data
    num BYTE "Escribe un numero: ", 0
    msg1 BYTE "Ingrese nuevamente un numero", 0
    msg2 BYTE "Programa terminado, se ingreso el 0", 0

.code
main PROC

ciclo:
    mov edx, OFFSET num ; Copiamos la direccion del mensaje para pedir un numero
    call WriteString ; Imprime el mensaje en pantalla

    call ReadInt ; Lee el numero que escribe el usuario

    cmp eax, 0 ; Comparamos si el numero ingresado es 0

    je fin ; Salta a fin si el numero es igual a 0

    mov edx, OFFSET msg1 ; Copiamos la direccion del mensaje para volver a intentar
    call Crlf ; Realiza un salto de linea
    call WriteString ; Imprime el mensaje en pantalla

    jmp ciclo ; Regresa a ciclo para pedir otro numero

fin:
    mov edx, OFFSET msg2 ; Copiamos la direccion del mensaje de finalizacion
    call Crlf ; Realiza un salto de linea
    call WriteString ; Imprime el mensaje en pantalla

    exit 

main ENDP

END main