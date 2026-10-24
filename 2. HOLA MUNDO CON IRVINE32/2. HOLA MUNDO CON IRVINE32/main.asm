; Materia: Lenguajes de Interfaz
; Nombre: Lugo Martinez Jennifer Scarlet
; Horario: 10:00-11:00 AM 
; Docente: Dr. José Luis Medina Jiménez
; Practica: 2. HOLA MUNDO CON IRVINE32
; Descripcion: En este programa se mira el funcionamiento del hola mundo con la libreria IRVINE32
INCLUDE Irvine32.inc

.data
    msg BYTE "Hola mundo", 0 ; AQUI DECLARAMOS MSG DE TIPO BYTE PARA GUARDAR EL MENSAJE

.code
main PROC

    mov ecx, 20 ; GUARDA 20 EN ECX PARA REPETIR EL MENSAJE 20 VECES

ciclo:
    mov edx, OFFSET msg ; SE MUEVE A EDX Y APUNTA AL MENSAJE
    call WriteString ; LEE EL MENSAJE
    call Crlf ; REALIZA UN SALTO DE LINEA

    loop ciclo ; REGRESA A CICLO HASTA COMPLETAR LAS 20 REPETICIONES

    exit
main ENDP

END main
