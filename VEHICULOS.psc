// MÓDULO 1: Solicitar la placa y hora de ingreso de un vehículo
SubProceso PedirDatosVehiculo(numVehiculo, placa Por Referencia, horaIngreso Por Referencia)
    Escribir "--- Vehículo #", numVehiculo, " ---"
    Escribir Sin Saltar "Ingrese la placa del vehículo (ej. ABC-123): "
    Leer placa
    placa <- Mayusculas(placa)
    
    Escribir Sin Saltar "Ingrese la hora de ingreso (ej. 08:30 AM): "
    Leer horaIngreso
FinSubProceso

// MÓDULO 2: Acumular la información del vehículo en una variable de texto
SubProceso AcumularVehiculo(numVehiculo, placa, horaIngreso, registroTotal Por Referencia)
    Definir fichaVehiculo Como Caracter
    fichaVehiculo <- Concatenar(ConvertirATexto(numVehiculo), ". Placa: ")
    fichaVehiculo <- Concatenar(fichaVehiculo, placa)
    fichaVehiculo <- Concatenar(fichaVehiculo, " | Hora de ingreso: ")
    fichaVehiculo <- Concatenar(fichaVehiculo, horaIngreso)
    fichaVehiculo <- Concatenar(fichaVehiculo, " // ")
    
    registroTotal <- Concatenar(registroTotal, fichaVehiculo)
FinSubProceso

// MÓDULO 3: Mostrar el resumen final de vehículos ingresados
SubProceso MostrarResumenParqueadero(cantidad, registroTotal)
    Escribir "========================================"
    Escribir "   RESUMEN DE VEHÍCULOS EN PARQUEADERO  "
    Escribir "========================================"
    Escribir "Total de vehículos registrados: ", cantidad
    Escribir registroTotal
    Escribir "========================================"
FinSubProceso

// ALGORITMO PRINCIPAL
Algoritmo RegistroParqueadero
    Definir totalVehiculos, i Como Entero
    Definir placaCarro, horaEntrada, acumuladorCarros Como Caracter
    
    acumuladorCarros <- ""
    Escribir "=== CONTROL DE INGRESO PARQUEADERO ==="
    Escribir Sin Saltar "¿Cuántos vehículos ingresarán al parqueadero?: "
    Leer totalVehiculos
    
    Mientras totalVehiculos <= 0 Hacer
        Escribir "Cantidad inválida. Ingrese un número mayor a 0: "
        Leer totalVehiculos
    FinMientras
    
    Para i <- 1 Hasta totalVehiculos Con Paso 1 Hacer
        Escribir ""
        PedirDatosVehiculo(i, placaCarro, horaEntrada)
        AcumularVehiculo(i, placaCarro, horaEntrada, acumuladorCarros)
    FinPara
    
    MostrarResumenParqueadero(totalVehiculos, acumuladorCarros)
FinAlgoritmo

