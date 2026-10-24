INCLUDE Irvine32.inc

.data

.code
main PROC
    mov eax, 5 ; Guardamos el valor 5 en EAX
    
    jmp continuar ; Salta a la etiqueta continuar
    mov eax, 10 ; Esta instruccion no se ejecuta

continuar:
    call DumpRegs ; Muestra el contenido de los registros

    exit

main ENDP

END main