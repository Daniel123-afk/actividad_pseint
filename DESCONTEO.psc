// MÓDULO 1: Solicitar y validar un número entero positivo
SubProceso PedirNumeroInicial(numInicio Por Referencia)
    Escribir "=== TEMPORIZADOR DE CUENTA REGRESIVA ==="
    Escribir Sin Saltar "Ingrese un número entero positivo para iniciar: "
    Leer numInicio
    
    Mientras numInicio <= 0 Hacer
        Escribir "Error: Debe ingresar un número mayor a 0. Intente de nuevo: "
        Leer numInicio
    FinMientras
FinSubProceso

// MÓDULO 2: Ejecutar la cuenta regresiva hasta 0 usando Mientras
SubProceso EjecutarConteo(contador)
    Escribir "----------------------------------------"
    Mientras contador >= 0 Hacer
        Escribir contador
        contador <- contador - 1
    FinMientras
FinSubProceso

// MÓDULO 3: Mostrar el mensaje de finalización
SubProceso MostrarAlertaFinal
    Escribir "----------------------------------------"
    Escribir "¡Tiempo cumplido!"
    Escribir "----------------------------------------"
FinSubProceso

// ALGORITMO PRINCIPAL
Algoritmo CuentaRegresiva
    Definir numeroInicial Como Entero
    
    PedirNumeroInicial(numeroInicial)
    EjecutarConteo(numeroInicial)
    MostrarAlertaFinal()
FinAlgoritmo

