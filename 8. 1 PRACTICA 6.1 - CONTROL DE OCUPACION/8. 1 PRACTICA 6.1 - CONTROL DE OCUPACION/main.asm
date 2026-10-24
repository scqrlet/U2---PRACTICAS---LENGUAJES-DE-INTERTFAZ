INCLUDE Irvine32.inc

.data
    msg1 BYTE "Cantidad de espacios del estacionamiento: ", 0
    msg2 BYTE "Ingrese 1 para estacionar un auto: ", 0
    msg3 BYTE "Espacios disponibles: ", 0
    msg4 BYTE "Estacionamiento lleno, no se pueden estacionar mas autos", 0
    espacios DWORD ?
    estacionar DWORD ?

.code
main PROC
    mov edx, OFFSET msg1 ; Copiamos la direccion del mensaje para pedir los espacios
    call WriteString ; Imprime el mensaje en pantalla
    call ReadInt ; Lee la cantidad de espacios que escribe el usuario
    mov espacios, eax ; Guardamos la cantidad de espacios disponibles

ciclo:
    cmp espacios, 0 ; Comparamos si aun quedan espacios disponibles
    je lleno ; Salta a lleno si ya no hay espacios

    mov edx, OFFSET msg2 ; Copiamos la direccion del mensaje para estacionar un auto
    call WriteString ; Imprime el mensaje en pantalla
    call ReadInt ; Lee el valor que escribe el usuario
    mov estacionar, eax ; Guardamos el valor ingresado

    cmp estacionar, 1 ; Comparamos si el valor ingresado es 1
    jne ciclo ; Regresa al ciclo si se ingreso otro valor

    dec espacios ; Disminuye en 1 los espacios disponibles

    mov edx, OFFSET msg3 ; Copiamos la direccion del mensaje de espacios restantes
    call WriteString ; Imprime el mensaje en pantalla
    mov eax, espacios ; Copiamos los espacios restantes en EAX
    call WriteDec ; Imprime la cantidad de espacios disponibles
    call Crlf ; Realiza un salto de linea

    jmp ciclo ; Regresa al inicio del ciclo

lleno:
    mov edx, OFFSET msg4 ; Copiamos la direccion del mensaje de estacionamiento lleno
    call WriteString ; Imprime el mensaje en pantalla
    call Crlf ; Realiza un salto de linea
    exit

main ENDP

END main