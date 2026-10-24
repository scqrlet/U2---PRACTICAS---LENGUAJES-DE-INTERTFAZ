; Materia: Lenguajes de Interfaz
; Nombre: Lugo Martinez Jennifer Scarlet
; Horario: 10:00-11:00 AM 
; Docente: Dr. José Luis Medina Jiménez
; Practica: 12. PRACTICA 10 - CADENA CON DECIMAL
; Descripcion: En esta practica se miro como hacer la simulacion de un sistema de descargas

INCLUDE Irvine32.inc

.data
	bytesDesc DWORD ?
	bytesPend DWORD ?
	gruposComp DWORD ?
	porcentaje DWORD ?
	residuo DWORD ?
	buffer BYTE 11 DUP(0)

.code
main PROC
	mov eax, 125 ; Guardamos 125 en EAX
	mov ebx, 512 ; Guardamos 512 en EBX
	mul ebx ; Multiplicamos EAX por EBX
	mov bytesDesc, eax ; Guardamos los bytes descargados
	
	mov esi, OFFSET buffer ; Copiamos la direccion del buffer
	call convertirDecimal ; Convierte el numero a texto
	mov edx, OFFSET buffer ; Copiamos la direccion del buffer
	call WriteString ; Imprime el resultado
	call Crlf ; Realiza un salto de linea

	mov eax, 100000 ; Guardamos el total de bytes
	sub eax, bytesDesc ; Restamos los bytes descargados
	mov bytesPend, eax ; Guardamos los bytes pendientes
	
	mov eax, bytesPend ; Copiamos los bytes pendientes
	mov esi, OFFSET buffer ; Copiamos la direccion del buffer
	call convertirDecimal ; Convierte el numero a texto
	mov edx, OFFSET buffer ; Copiamos la direccion del buffer
	call WriteString ; Imprime el resultado
	call Crlf ; Realiza un salto de linea

	mov eax, bytesDesc ; Copiamos los bytes descargados
	mov ebx, 100 ; Guardamos 100 en EBX
	mul ebx ; Multiplicamos por 100
	mov ebx, 100000 ; Guardamos el total de bytes
	mov edx, 0 ; Limpiamos EDX
	div ebx ; Calculamos el porcentaje
	mov porcentaje, eax ; Guardamos el porcentaje
	
	mov eax, porcentaje ; Copiamos el porcentaje
	mov esi, OFFSET buffer ; Copiamos la direccion del buffer
	call convertirDecimal ; Convierte el numero a texto
	mov edx, OFFSET buffer ; Copiamos la direccion del buffer
	call WriteString ; Imprime el resultado
	call Crlf ; Realiza un salto de linea

	mov eax, bytesDesc ; Copiamos los bytes descargados
	mov ebx, 1024 ; Guardamos 1024 en EBX
	mov edx, 0 ; Limpiamos EDX
	div ebx ; Dividimos entre 1024
	mov gruposComp, eax ; Guardamos los grupos completos
	mov residuo, edx ; Guardamos el residuo

	mov eax, gruposComp ; Copiamos los grupos completos
	mov esi, OFFSET buffer ; Copiamos la direccion del buffer
	call convertirDecimal ; Convierte el numero a texto
	mov edx, OFFSET buffer ; Copiamos la direccion del buffer
	call WriteString ; Imprime el resultado
	call Crlf ; Realiza un salto de linea

	mov eax, residuo ; Copiamos el residuo
	mov esi, OFFSET buffer ; Copiamos la direccion del buffer
	call convertirDecimal ; Convierte el numero a texto
	mov edx, OFFSET buffer ; Copiamos la direccion del buffer
	call WriteString ; Imprime el resultado
	call Crlf ; Realiza un salto de linea
	call Crlf ; Realiza un salto de linea
	exit 

main ENDP

convertirDecimal PROC
	mov ecx, 0 ; Inicializamos el contador de digitos
	mov ebx, 10 ; Guardamos 10 como divisor

convertirLoop:
	mov edx, 0 ; Limpiamos EDX antes de dividir
	div ebx ; Dividimos entre 10
	push edx ; Guardamos el residuo en la pila
	inc ecx ; Aumentamos el contador

	cmp eax, 0 ; Comparamos si aun quedan digitos
	jne convertirLoop ; Regresa al ciclo si faltan digitos

cadenaLoop:
	pop edx ; Recuperamos un digito de la pila
	add dl, '0' ; Convertimos el digito a ASCII
	mov [esi], dl ; Guardamos el caracter en la cadena
	inc esi ; Avanzamos a la siguiente posicion
	loop cadenaLoop ; Regresa al ciclo
	mov byte ptr [esi], 0 ; Agregamos el fin de cadena

	ret ; Regresa al programa principal

convertirDecimal ENDP

END main
