INCLUDE Irvine32.inc

.data
alarmaEncencida BYTE "Alarma encendida",0
alarmaApagada BYTE "Alarma apagada",0

; Estados de computadora:
; 0 - Computadora encendida
; 1 - Alarma encendida
; 2 - Computadora conectada a internet
; Estados: 0 = Apagado, 1 = Encendido

; Estado inicial: 0000 0101

.code
main PROC
    ; 1 - OPERACION AND: REVISAR SI LA ALARMA ESTA ENCENDIDA
    mov eax, 0 ; Inicializamos EAX en 0
    mov al, 00000101b ; Guardamos el estado inicial en AL
    and al, 00000010b ; Revisamos solamente el bit de la alarma

    call WriteBin ; Muestra el resultado en binario

    nop

    ; 2 - OPERACION OR: ENCENDER LA ALARMA
    mov eax, 0 ; Inicializamos nuevamente EAX en 0
    mov al, 00000101b ; Guardamos el estado inicial en AL
    or al, 00000010b ; Encendemos el bit de la alarma

    call WriteBin ; Muestra el nuevo estado en binario

    nop

    ; 3 - OPERACION XOR: CAMBIAR EL ESTADO DE LA COMPUTADORA
    mov eax, 0 ; Inicializamos nuevamente EAX en 0
    mov al, 00000101b ; Guardamos el estado inicial
    xor al, 00000001b ; Cambiamos el estado de la computadora

    call WriteBin ; Muestra el resultado en binario

    nop

    ; 4 - OPERACION TEST: REVISAR SI LA ALARMA ESTA ENCENDIDA
    mov eax, 0 ; Inicializamos EAX en 0
    mov al, 00000111b ; Guardamos un estado con la alarma encendida

    test al, 00000010b ; Revisamos el bit de la alarma
    jz apagarAlarma ; Salta si la alarma esta apagada

    mov edx, OFFSET alarmaEncencida ; Copiamos la direccion del mensaje de alarma encendida
    call WriteString ; Imprime el mensaje en pantalla
    call Crlf ; Realiza un salto de linea
    jmp fin ; Salta al final del programa

apagarAlarma:
    mov edx, OFFSET alarmaApagada ; Copiamos la direccion del mensaje de alarma apagada
    call WriteString ; Imprime el mensaje en pantalla
    call Crlf ; Realiza un salto de linea

fin:
    exit 

main ENDP

END main