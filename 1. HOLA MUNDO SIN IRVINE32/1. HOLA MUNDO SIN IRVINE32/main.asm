.386 ; Esta directiva le permite a ensamblador reconocer que se va a trabajar con arquitectura intel 80386
	 ; y conozca las palabras reservadas de cada una de los registros

.model flat, stdcall 
; .model flat, se trabaja con las direcciones de memoria en forma secuencial.
; stdcall nos permite obtener los servicios que proporciona windows

.stack 4096 ;si queremos manejar pilas
;Nos permite reservar un espacio para el manejo de la pila dentro de la RAM. la pila nos permite pasar parametros

; SERVICIOS DE WINDOWS 

GetStdHandle PROTO, ; proto declara un prototitpo
	nStdHandle: DWORD

	WriteConsoleA PROTO,
		hConsoleOutput: DWORD,   ;El dword de 32 bits, word de 16
		lpBuffer: PTR BYTE, 
		nNumberOfCharsToWrite:DWORD, 
		lpNumberCharsWritten:PTR DWORD,
		lpReserved:DWORD

;hConsoleHandle nos permite manejar en donde vamos a escribir, en este caso la consola
;lpBuffer Nos va a permitir ir a la direccion donde se encuentra el primer caracter
;nNumberOfCharToWrite es el numero de caracteres que se van a escribir
;lpNumberCharsWritten se guardan en una direccion el numero de caracteres escritos realmente, se ocupa saber el numero de caracteres ya escritos para saber hasta donde va y seguir contando hasta el siguiente caracter
;lpReserved es un parametro reservado.

ExitProcess PROTO,
	dwExitCode: DWORD

;Declaracion de funcion para terminacion el proceso. DWORD va a recibir el codigo para finalizar el programa correctamente

STD_OUTPUT_HANDLE EQU -11  ;diy constante simbolica que me ayude a manejar ese -11, lo estoy llamando de manera stoutputhandle
;EQU crea una constante simbolica.
; STD_OUTPUT_HANDLE se representa con el -11 

.data ;variables, cada caracter se guarda mediante BYTE
mensaje BYTE "Hola, mundo!", 13,10  

 ;dos valores, saltos de linea
; 13 significa Carriage Line (CL)
; 10 Line Feed (LF)
;en conjunto producen un salto de linea
;utilizamos los caracteres
; calcular la longitud del mensaje

longitud EQU ($ - mensaje)

; Calcula la cantidad de bytes que ocupa el mensaje
;$ representa la posicion de donde comenzo la cadena

CaracteresEscritos DWORD ?
;caracteresEscritos reserva una variable de 32 bits
;reservamos un espacio de memoria pero no lo inicializa, solo maneja num caracteres escritos

.code ;Codigo a ejecutar
main PROC
;PROC indica el inicio del procedimiento

	INVOKE GetStdHandle, STD_OUTPUT_HANDLE ;ayuda a manejar la consola
	;Invoca el procedimiento, nos permite a ayudar a identificar funciones

	mov ebx, eax

	INVOKE WriteConsoleA,  ;WriteConsoleA Escribir los caracteres en la consola
		ebx, 
		ADDR mensaje,
		longitud, 
		ADDR CaracteresEscritos,
		0  ;valor para guardar o reservar la memoria

		INVOKE ExitProcess, 0

main ENDP
END main