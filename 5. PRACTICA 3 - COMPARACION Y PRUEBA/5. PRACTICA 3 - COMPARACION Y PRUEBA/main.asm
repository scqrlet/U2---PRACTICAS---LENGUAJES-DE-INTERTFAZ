; Materia: Lenguajes de Interfaz
; Nombre: Lugo Martinez Jennifer Scarlet
; Horario: 10:00-11:00 AM 
; Docente: Dr. José Luis Medina Jiménez

INCLUDE Irvine32.inc

.data
    msgIguales BYTE "Los numeros son iguales", 0
    msgDiferentes BYTE "Los numeros son diferentes", 0

.code
main PROC
    mov eax, 180 ; Guardamos el primer numero en EAX
    mov ebx, 181 ; Guardamos el segundo numero en EBX

    cmp eax, ebx ; Comparamos el valor de EAX con EBX

    je iguales ; Salta a iguales si los dos numeros son iguales
    mov edx, OFFSET msgDiferentes ; Copiamos la direccion del mensaje de diferentes
    call WriteString ; Imprime el mensaje almacenado en msgDiferentes

    jmp fin ; Salta a la etiqueta fin

iguales:
    mov edx, OFFSET msgIguales ; Copiamos la direccion del mensaje de iguales
    call WriteString ; Imprime el mensaje almacenado en msgIguales

fin:
    exit 

main ENDP

END main
