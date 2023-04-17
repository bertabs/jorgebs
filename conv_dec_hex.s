#---Programa parapasar un número entero decimal que de el usuario a hexadecimal
#---en bucle hasta que el usuario ponga 0
	
	#---introducimos el archivo que tiene los servicios del sistema
	.include "serv.s"
	
	#---invocamos al segmento de datos
	.data
	
	#---definimos los strings que se van a mostrar al usuario
	
CAD1:	.string "Introduce numero en decimal: "
CAD2:	.string "Valor en haxadecimal: "

	#---esto es código
	.text
	
bucle: #---hacemos un bucle
	
	la a0, CAD1 #---para cargar la CAD1 en a0
	
	li a7, PRINT_STRING #---imprimimos CAD1 en la consola
	ecall
	
	li a7, READ_INT #---Con este servicio pedimos al usuario un num entero
	ecall		#---y lo almacenamos en a0
	
	mv t0, a0 #---movemos el contenido de a0 a t0
	
	beqz t0, fin #---si el contenido de t0 es igual a 0, salta a la etiqueta 'fin'
	
	la a0, CAD2 #---cargamos CAD2 en a0
	
	li a7, PRINT_STRING #---imprimimos CAD2
	ecall
	
	mv a0, t0 #---movemos el contenido de t0 a a0
	
	li a7, PRINT_HEX #---con este servicio imprimimos el contenido de a0 
	ecall		#---pero con valor hexadecimal
	
	li a0, '\n' #---cargamos en a0 el carácter '\n' que es el salto de línea
	
	li a7, PRINT_CHAR #---imprimimos el carácter que está en a0
	ecall	#---imprimimos el carácter 2 veces
	ecall
	
	b bucle #---hacemos que se repita el bucle 
	
fin: #---al saltar a esta etiqueta el programa termina
	#---terminar
	li a7, EXIT
	ecall