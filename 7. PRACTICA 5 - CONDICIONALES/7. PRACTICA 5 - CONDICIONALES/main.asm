; Materia: Lenguajes de Interfaz
; Nombre: Lugo Martinez Jennifer Scarlet
; Horario: 10:00-11:00 AM 
; Docente: Dr. José Luis Medina Jiménez

INCLUDE Irvine32.inc

.code
main PROC

; WHILE
    mov ebx, 1 ; Guardamos el valor inicial en EBX

cicloWhile:
    cmp ebx, 100 ; Comparamos si EBX es mayor que 100

    jg fin ; Salta a fin cuando la condicion ya no se cumple

    mov eax, ebx ; Copiamos el valor de EBX en EAX
    call WriteDec ; Imprime el valor almacenado en EAX
    call Crlf ; Realiza un salto de linea

    inc ebx ; Aumenta 1 al valor de EBX
    jmp cicloWhile ; Regresa al inicio del ciclo

fin:
    call Crlf ; Realiza un salto de linea al terminar el while

; DO WHILE
    mov ebx, 1 ; Guardamos el valor inicial en EBX

cicloDoWhile:

    mov eax, ebx ; Copiamos el valor de EBX en EAX
    call WriteDec ; Imprime el valor almacenado en EAX
    call Crlf ; Realiza un salto de linea

    inc ebx ; Aumenta 1 al valor de EBX
    cmp ebx, 100 ; Comparamos si el ciclo debe continuar

    jle cicloDoWhile ; Regresa al ciclo mientras EBX sea menor o igual a 100

    exit 

main ENDP

END main
