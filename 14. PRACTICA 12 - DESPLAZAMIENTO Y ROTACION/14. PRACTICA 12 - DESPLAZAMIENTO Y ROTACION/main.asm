INCLUDE Irvine32.inc

.data

.code
main PROC
    mov eax, 0
    mov ebx, 0
    mov ecx, 0
    mov edx, 0

    ; 1 - SHL: DESPLAZAR UNA POSICION A LA IZQUIERDA
    mov al, 10000000b ; Guardamos el valor binario en AL
    shl al, 1 ; Desplazamos 1 bit hacia la izquierda

    call DumpRegs ; Muestra el contenido de los registros
    call WriteBin ; Muestra el resultado en binario

    ; 2 - SHR: DESPLAZAR UNA POSICION A LA DERECHA
    mov al, 00001101b ; Guardamos el valor binario en AL
    shr al, 1 ; Desplazamos 1 bit hacia la derecha

    call DumpRegs ; Muestra el contenido de los registros
    call WriteBin ; Muestra el resultado en binario

    ; 3 - SAR: DESPLAZAMIENTO CON SIGNO
    mov al, -9 ; Guardamos un numero negativo en AL
    sar al, 1 ; Desplazamos 1 bit conservando el signo

    call DumpRegs ; Muestra el contenido de los registros
    call WriteBin ; Muestra el resultado en binario

    ; 4 - DESPLAZAMIENTO CON CONSTANTE
    mov al, 00001111b ; Guardamos el valor binario en AL
    shl al, 2 ; Desplazamos 2 bits hacia la izquierda

    call DumpRegs ; Muestra el contenido de los registros
    call WriteBin ; Muestra el resultado en binario

    ; 5 - DESPLAZAMIENTO CON CL
    mov al, 00010100b ; Guardamos el valor binario en AL
    mov cl, 2 ; Guardamos la cantidad de desplazamientos
    shr al, cl ; Desplazamos a la derecha la cantidad indicada por CL

    call DumpRegs ; Muestra el contenido de los registros
    call WriteBin ; Muestra el resultado en binario

    ; 6 - ROR, ROL, RCL, RCR

    ; ROR
    mov al, 10000001b ; Guardamos el valor binario en AL
    ror al, 1 ; Rotamos 1 bit hacia la derecha

    call DumpRegs ; Muestra el contenido de los registros
    call WriteBin ; Muestra el resultado en binario

    ; ROL
    mov al, 10000001b ; Guardamos el valor binario en AL
    rol al, 1 ; Rotamos 1 bit hacia la izquierda

    call DumpRegs ; Muestra el contenido de los registros
    call WriteBin ; Muestra el resultado en binario

    ; RCL
    clc ; Limpiamos el bit de acarreo
    mov al, 10000001b ; Guardamos el valor binario en AL
    rcl al, 1 ; Rotamos a la izquierda usando el carry

    call DumpRegs ; Muestra el contenido de los registros
    call WriteBin ; Muestra el resultado en binario

    ; RCR
    clc ; Limpiamos el bit de acarreo
    mov al, 10000001b ; Guardamos el valor binario en AL
    rcr al, 1 ; Rotamos a la derecha usando el carry

    call DumpRegs ; Muestra el contenido de los registros
    call WriteBin ; Muestra el resultado en binario

    exit

main ENDP

END main