INCLUDE Irvine32.inc

.data
.code
main PROC
    ; 1. ADD Y SUB: OPERACIONES DE SUMA Y RESTA
    mov eax, 60 ; Guarda el primer numero en EAX
    mov ebx, 24 ; Guarda el segundo numero en EBX

    add eax, ebx ; Suma el valor de EBX a EAX
    sub eax, 15 ; Resta 15 al resultado almacenado en EAX
    nop

    ; 2. CF: ACARREO EN UNA SUMA SIN SIGNO
    mov eax, 12 ; Guarda un valor en EAX
    mov al, 253 ; Guarda 253 en AL

    add al, 4 ; Suma 4 al valor almacenado en AL
    nop

    ; 3. OF: DESBORDAMIENTO EN SUMA CON SIGNO
    mov eax, 0 ; Inicializa EAX en 0
    mov al, 127 ; Guarda el valor maximo positivo en AL

    add al, 1 ; Suma 1 al valor almacenado en AL
    nop

    ; 4. MUL: PRODUCTO DE VALORES DENTRO DE 32 BITS SIN SIGNO
    mov eax, 25 ; Guarda el primer numero en EAX
    mov ebx, 5 ; Guarda el segundo numero en EBX

    mul ebx ; Multiplica EAX por EBX
    nop

    ; 5. IMUL: PRODUCTO DE VALORES CON SIGNO DENTRO DE 32 BITS
    mov eax, -7 ; Guarda un numero negativo en EAX

    imul eax, eax, 3 ; Multiplica EAX por 3

    nop

    ; 6. MUL: PRODUCTO DE VALORES QUE EXCEDEN 32 BITS
    mov eax, 94854 ; Guarda el primer numero en EAX
    mov ebx, 94854 ; Guarda el segundo numero en EBX

    mul ebx ; Multiplica EAX por EBX
    nop

    ; 7. DIV: DIVISION DE NUMERO SIN SIGNO
    mov eax, 130 ; Guarda el dividendo en EAX
    mov edx, 0 ; Limpia EDX para realizar la division

    mov ebx, 13 ; Guarda el divisor en EBX
    div ebx ; Divide EAX entre EBX
    nop

    ; 8. IDIV: DIVISION CON NUMEROS NEGATIVOS
    mov eax, -130 ; Guarda el dividendo en EAX
    cdq ; Extiende el signo de EAX a EDX

    mov ebx, 13 ; Guarda el divisor en EBX
    idiv ebx ; Divide EAX entre EBX
    exit 

main ENDP

END main