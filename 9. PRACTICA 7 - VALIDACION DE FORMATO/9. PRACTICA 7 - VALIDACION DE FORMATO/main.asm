; Materia: Lenguajes de Interfaz
; Nombre: Lugo Martinez Jennifer Scarlet
; Horario: 10:00-11:00 AM 
; Docente: Dr. José Luis Medina Jiménez
; Practica: 9. PRACTICA 7 - VALIDACION DE FORMATO
; Descripcion: En esta pracica miramos la validacion y comprobacion al momento de ingresar una cadena
; Utilizando un formato especifico

INCLUDE Irvine32.inc

.data
    cadena BYTE "Escribe una cadena (ejemplo TEC-123): ", 0
    msgValido BYTE "Cadena valida", 0
    msgInvalido BYTE "Cadena invalida", 0
    MAX = 20
    stringIn BYTE MAX+1 DUP(?)

.code
main PROC
    mov edx, OFFSET cadena ; Copiamos la direccion del mensaje
    call WriteString ; Imprime el mensaje en pantalla

    mov edx, OFFSET stringIn ; Copiamos la direccion donde se guardara la cadena
    mov ecx, MAX ; Copiamos el tamaño maximo de la cadena
    call ReadString ; Lee la cadena que escribe el usuario

    cmp eax, 7 ; Comparamos si la cadena tiene 7 caracteres
    jne cadenaInvalida ; Salta si la longitud es diferente

    mov esi, 0 ; Guardamos la posicion inicial de las letras
    mov ecx, 3 ; Guardamos la cantidad de letras a revisar

validarLetras:
    mov al, stringIn[esi] ; Copiamos el caracter actual
    cmp al, 'A' ; Comparamos si el caracter es menor que A
    jl cadenaInvalida ; Salta si no es una letra

    cmp al, 'Z' ; Comparamos si el caracter es mayor que Z
    jg cadenaInvalida ; Salta si no es una letra

    inc esi ; Avanza a la siguiente posicion
    loop validarLetras ; Regresa al ciclo

    mov al, stringIn[3] ; Copiamos el cuarto caracter
    cmp al, '-' ; Comparamos si el caracter es un guion
    jne cadenaInvalida ; Salta si es diferente

    mov esi, 4 ; Guardamos la posicion inicial de los numeros
    mov ecx, 3 ; Guardamos la cantidad de numeros a revisar

validarNumeros:
    mov al, stringIn[esi] ; Copiamos el caracter actual

    cmp al, '0' ; Comparamos si el caracter es menor que 0
    jb cadenaInvalida ; Salta si no es un numero

    cmp al, '9' ; Comparamos si el caracter es mayor que 9
    ja cadenaInvalida ; Salta si no es un numero

    inc esi ; Avanza a la siguiente posicion
    loop validarNumeros ; Regresa al ciclo

    jmp cadenaValida ; Salta si toda la cadena es valida

cadenaValida:
    mov edx, OFFSET msgValido ; Copiamos la direccion del mensaje de cadena valida
    call WriteString ; Imprime el mensaje en pantalla
    jmp fin ; Salta al final del programa

cadenaInvalida:
    mov edx, OFFSET msgInvalido ; Copiamos la direccion del mensaje de cadena invalida
    call WriteString ; Imprime el mensaje en pantalla

fin:
    call Crlf ; Realiza un salto de linea
    exit 

main ENDP

END main
