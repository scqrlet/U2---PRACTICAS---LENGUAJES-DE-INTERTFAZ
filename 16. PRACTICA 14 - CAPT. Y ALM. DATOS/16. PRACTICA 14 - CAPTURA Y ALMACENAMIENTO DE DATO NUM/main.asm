INCLUDE Irvine32.inc

.data
cantidadInicial DWORD 25
cantidadRecibida DWORD ?
existenciaActual DWORD ?
recepcion BYTE "Ingrese una cantidad (1-99): ",0
msgError BYTE "Cantidad recibida invalida",0
msg1 BYTE "Existencia inicial ",0
msg2 BYTE " + recepcion de ",0
msg3 BYTE " existencia actual ",0
msg4 BYTE " unidades",0
cadena BYTE 10 DUP(0)
buffer BYTE 3 DUP(0)

.code
main PROC
capturar:
    mov edx, OFFSET recepcion ; Copiamos la direccion del mensaje para pedir la cantidad
    call WriteString ; Imprime el mensaje

    mov edx, OFFSET buffer ; Copiamos la direccion donde se guardara la entrada
    mov ecx, SIZEOF buffer ; Copiamos el tamaño maximo del buffer
    call ReadString ; Lee lo que escribe el usuario

    cmp eax, 0 ; Comparamos si no se escribio nada
    je error ; Salta si la entrada esta vacia

    cmp eax, 2 ; Comparamos si se escribieron mas de 2 digitos
    ja error ; Salta si la longitud es mayor

    mov bl, buffer[0] ; Copiamos el primer caracter

    cmp bl, '0' ; Comparamos si es menor que 0
    jb error

    cmp bl, '9' ; Comparamos si es mayor que 9
    ja error

    cmp eax, 1 ; Comparamos si solo se escribio un digito
    je unDigito

    mov bl, buffer[1] ; Copiamos el segundo caracter

    cmp bl, '0' ; Comparamos si es menor que 0
    jb error

    cmp bl, '9' ; Comparamos si es mayor que 9
    ja error

    movzx eax, buffer[0] ; Copiamos el primer digito
    sub eax, '0' ; Convertimos el caracter a numero

    mov ebx, 10 ; Guardamos 10 en EBX
    mul ebx ; Multiplicamos el digito por 10

    movzx ebx, buffer[1] ; Copiamos el segundo digito
    sub ebx, '0' ; Convertimos el caracter a numero

    add eax, ebx ; Formamos el numero completo
    jmp validarRango ; Salta a la validacion

unDigito:
    movzx eax, buffer[0] ; Copiamos el unico digito
    sub eax, '0' ; Convertimos el caracter a numero

validarRango:
    cmp eax, 1 ; Comparamos si es menor que 1
    jb error

    cmp eax, 99 ; Comparamos si es mayor que 99
    ja error

    mov cantidadRecibida, eax ; Guardamos la cantidad recibida
    mov eax, cantidadInicial ; Copiamos la existencia inicial
    add eax, cantidadRecibida ; Sumamos la cantidad recibida
    mov existenciaActual, eax ; Guardamos la existencia actual

    mov edx, OFFSET msg1 ; Copiamos la direccion del mensaje
    call WriteString ; Imprime el mensaje

    mov eax, cantidadInicial ; Copiamos la existencia inicial
    mov esi, OFFSET cadena ; Copiamos la direccion de la cadena
    call convertirDecimal ; Convierte el numero a texto

    mov edx, OFFSET cadena ; Copiamos la direccion de la cadena
    call WriteString ; Imprime la cadena

    mov edx, OFFSET msg2 ; Copiamos la direccion del mensaje
    call WriteString ; Imprime el mensaje

    mov eax, cantidadRecibida ; Copiamos la cantidad recibida
    mov esi, OFFSET cadena ; Copiamos la direccion de la cadena
    call convertirDecimal ; Convierte el numero a texto

    mov edx, OFFSET cadena ; Copiamos la direccion de la cadena
    call WriteString ; Imprime la cadena

    mov edx, OFFSET msg3 ; Copiamos la direccion del mensaje
    call WriteString ; Imprime el mensaje

    mov eax, existenciaActual ; Copiamos la existencia actual
    mov esi, OFFSET cadena ; Copiamos la direccion de la cadena
    call convertirDecimal ; Convierte el numero a texto

    mov edx, OFFSET cadena ; Copiamos la direccion de la cadena
    call WriteString ; Imprime la cadena

    mov edx, OFFSET msg4 ; Copiamos la direccion del mensaje
    call WriteString ; Imprime el mensaje

    call Crlf ; Realiza un salto de linea
    exit 

error:
    mov edx, OFFSET msgError ; Copiamos la direccion del mensaje de error
    call WriteString ; Imprime el mensaje
    call Crlf ; Realiza un salto de linea
    jmp capturar ; Regresa para pedir la cantidad

main ENDP
convertirDecimal PROC
    mov ecx, 0 ; Inicializamos el contador de digitos
    mov ebx, 10 ; Guardamos 10 como divisor

convertirLoop:
    mov edx, 0 ; Limpiamos EDX antes de dividir
    div ebx ; Dividimos entre 10

    push edx ; Guardamos el residuo en la pila
    inc ecx ; Aumentamos el contador

    cmp eax, 0 ; Comparamos si aun quedan digitos
    jne convertirLoop ; Regresa al ciclo si aun faltan digitos

cadenaLoop:
    pop edx ; Recuperamos un digito de la pila
    add dl, '0' ; Convertimos el digito a ASCII

    mov [esi], dl ; Guardamos el caracter en la cadena
    inc esi ; Avanzamos a la siguiente posicion

    loop cadenaLoop ; Regresa al ciclo

    mov BYTE PTR [esi], 0 ; Agregamos el fin de cadena

    ret ; Regresa al programa principal

convertirDecimal ENDP

END main