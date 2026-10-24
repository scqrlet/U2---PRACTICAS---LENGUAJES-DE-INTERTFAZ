INCLUDE Irvine32.inc

.data
    ; Mensajes para pedir los datos
    n1 BYTE "Escribe el primer numero a comparar: ", 0
    n2 BYTE "Escribe el segundo numero a comparar: ", 0

    ; Mensajes de resultados
    msgIguales BYTE "Los numeros son iguales", 0
    msgMayor BYTE "El primer numero es mayor", 0
    msgMenor BYTE "El primer numero es menor", 0

    ; Variables numericas
    num1 DWORD ?
    num2 DWORD ?

.code
main PROC
    mov edx, OFFSET n1 ; Copiamos la direccion del mensaje del primer numero
    call WriteString ; Imprime el mensaje en pantalla
    call ReadInt ; Lee el numero que escribe el usuario
    mov num1, eax ; Guardamos el primer numero

    mov edx, OFFSET n2 ; Copiamos la direccion del mensaje del segundo numero
    call WriteString ; Imprime el mensaje en pantalla

    call ReadInt ; Lee el numero que escribe el usuario
    mov num2, eax ; Guardamos el segundo numero

    mov eax, num1 ; Copiamos el primer numero en EAX
    mov ebx, num2 ; Copiamos el segundo numero en EBX

    cmp eax, ebx ; Comparamos ambos numeros

    je iguales ; Salta si los numeros son iguales
    jg mayor ; Salta si el primer numero es mayor
    jl menor ; Salta si el primer numero es menor

iguales:
    mov edx, OFFSET msgIguales ; Copiamos la direccion del mensaje de iguales
    call WriteString ; Imprime el mensaje en pantalla

    jmp fin ; Salta al final del programa

mayor:
    mov edx, OFFSET msgMayor ; Copiamos la direccion del mensaje de mayor
    call WriteString ; Imprime el mensaje en pantalla

    jmp fin ; Salta al final del programa

menor:
    mov edx, OFFSET msgMenor ; Copiamos la direccion del mensaje de menor
    call WriteString ; Imprime el mensaje en pantalla

fin:
    call Crlf ; Realiza un salto de linea
    exit 

main ENDP

END main