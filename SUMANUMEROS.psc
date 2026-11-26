// MÓDULO 1: Solicitar y validar que el número ingresado sea válido (positivo)
SubProceso PedirNumeroValido(num Por Referencia, posicion)
    Escribir Sin Saltar "Ingrese el número #", posicion, " (debe ser mayor a 0): "
    Leer num
    
    Mientras num <= 0 Hacer
        Escribir "Error: Número no válido. Por favor ingrese un valor mayor a 0: "
        Leer num
    FinMientras
FinSubProceso

// MÓDULO 2: Acumular el número en la suma total
SubProceso SumarALista(num, sumaTotal Por Referencia)
    sumaTotal <- sumaTotal + num
FinSubProceso

// MÓDULO 3: Mostrar el resultado final de la suma
SubProceso MostrarResultadoSuma(cantidadNumeros, sumaTotal)
    Escribir "========================================"
    Escribir "         RESULTADO DE LA SUMA           "
    Escribir "========================================"
    Escribir "Cantidad de números sumados: ", cantidadNumeros
    Escribir "La suma total de los números es: ", sumaTotal
    Escribir "========================================"
FinSubProceso

// ALGORITMO PRINCIPAL
Algoritmo SumaListaNumeros
    Definir numeroIngresado, acumuladorSuma Como Real
    Definir contadorNumeros Como Entero
    Definir continuar Como Caracter
    
    acumuladorSuma <- 0
    contadorNumeros <- 0
    continuar <- "S"
    
    Escribir "=== SUMADOR DE LISTA DE NÚMEROS ==="
    Mientras continuar = "S" Hacer
        contadorNumeros <- contadorNumeros + 1
        Escribir ""
        PedirNumeroValido(numeroIngresado, contadorNumeros)
        SumarALista(numeroIngresado, acumuladorSuma)
        
        Escribir Sin Saltar "¿Desea ingresar otro número? (S/N): "
        Leer continuar
        continuar <- Mayusculas(continuar)
        
        Mientras continuar <> "S" Y continuar <> "N" Hacer
            Escribir "Opción inválida. Ingrese S para Sí o N para No: "
            Leer continuar
            continuar <- Mayusculas(continuar)
        FinMientras
    FinMientras
    
    MostrarResultadoSuma(contadorNumeros, acumuladorSuma)
FinAlgoritmo

