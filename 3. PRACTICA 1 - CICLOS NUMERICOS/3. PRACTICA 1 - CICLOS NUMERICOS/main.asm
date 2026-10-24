INCLUDE Irvine32.inc

.data

.code
main PROC
    mov ecx, 51 ; Inicializar el contador en ECX para uso si uso en la función loop 

ciclo: 
    mov eax, ecx ; Copiamos el valor de ECX en el registro EAX 

    call WriteDec ; Imprime el valor almacenado en EAX
    call Crlf ; Salto de linea
    loop ciclo ; Realiza el decremento de ECX y repite el ciclo

    exit
    
main ENDP

END main