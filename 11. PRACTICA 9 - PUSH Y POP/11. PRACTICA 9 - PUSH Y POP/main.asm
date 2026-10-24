; Materia: Lenguajes de Interfaz
; Nombre: Lugo Martinez Jennifer Scarlet
; Horario: 10:00-11:00 AM 
; Docente: Dr. José Luis Medina Jiménez

INCLUDE Irvine32.inc

.data

.code

main PROC

    ; BLOQUE 1: GUARDAR Y RECUPERAR UN VALOR
    mov eax, 40 ; Guarda 40 en EAX

    push eax ; Guarda el valor de EAX en la pila

    nop

    mov eax, 0 ; Cambia el valor de EAX a 0
    pop ebx ; Recupera el valor guardado y lo guarda en EBX

    nop

    ; BLOQUE 2: ULTIMO EN ENTRAR, PRIMERO EN SALIR
    mov eax, 10 ; Guarda 10 en EAX
    push eax ; Guarda 10 en la pila

    mov eax, 20 ; Guarda 20 en EAX
    push eax ; Guarda 20 en la pila

    mov eax, 30 ; Guarda 30 en EAX
    push eax ; Guarda 30 en la pila

    nop

    pop eax ; Recupera el ultimo valor guardado en EAX
    pop ebx ; Recupera el siguiente valor guardado en EBX
    pop ecx ; Recupera el primer valor guardado en ECX

    nop

    ; BLOQUE 3: GUARDAR VALORES TEMPORALMENTE
    mov eax, 100 ; Guarda 100 en EAX
    mov ebx, 200 ; Guarda 200 en EBX

    push eax ; Guarda el valor de EAX en la pila
    push ebx ; Guarda el valor de EBX en la pila

    pop ebx ; Recupera el valor guardado para EBX
    pop eax ; Recupera el valor guardado para EAX

    nop

    ; BLOQUE 4: LLAMAR UN PROCEDIMIENTO
    mov eax, 50 ; Guarda 50 en EAX
    mov ebx, 100 ; Guarda 100 en EBX

    call aumentarDiez 

    nop
    exit

main ENDP
aumentarDiez PROC
    push ebx ; Guarda el valor actual de EBX

    mov ebx, 10 ; Guarda 10 en EBX
    add eax, ebx ; Suma 10 al valor de EAX

    pop ebx ; Recupera el valor original de EBX

    ret ; Regresa al programa principal

aumentarDiez ENDP

END main
