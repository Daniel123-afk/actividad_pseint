// MODULO 1: Pedir temperatura y piso 
SubProceso PedirDatosAscensorTemp(temp por referencia, piso por referencia)
	Escribir "Ingresa la temperatura ambiente actual (°C):"
	leer temp
	escribir "¿A que piso deseas ir?:"
	leer piso
FinSubProceso

// MODULO 2:Verificar si la tempertura esta en el rango (18°C A 25°C)
Funcion temp_ok <- ValidarRangoTemp(temp)
	definir temp_ok Como Logico
	
	si temp >= 18 y temp <= 25 Entonces
		temp_ok <- Verdadero 
	sino 
		temp_ok <- Falso
	FinSi
FinFuncion

// MODULO 3: Mostrar si el ascensor se mueve o no
SubProceso MostrarMovimientoAscensor(temp_ok, piso)
	si temp_ok entonces 
		Escribir "Temperatura adecuada. Moviendo el ascensor al piso ", piso, "..."
	SiNo
		escribir "La temperatura no es adecuada. Movimiento del ascensor no permitido."
	FinSi
FinSubProceso

// ALGORITMO PRINCIPAL
Algoritmo AscensorTemperaturaModular
	Definir Temperatura Como Real
	definir piso Como Entero
	definir temperatura_valida Como Logico
	
	PedirDatosAscensorTemp(temperatura, piso)
	temperatura_valida <- ValidarRangoTemp(temperatura)
	MostrarMovimientoAscensor(temperatura_valida, piso)
FinAlgoritmo
