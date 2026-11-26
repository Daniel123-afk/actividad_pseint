// MÓDULO 1: Solicitar nombre y precio del producto vendido
SubProceso PedirVenta(producto Por Referencia, precio Por Referencia)
    Escribir Sin Saltar "Ingrese el nombre del producto vendido: "
    Leer producto
    
    Escribir Sin Saltar "Ingrese el precio del producto: $"
    Leer precio
    Mientras precio <= 0 Hacer
        Escribir "El precio debe ser mayor a 0. Ingrese nuevamente: "
        Leer precio
    FinMientras
FinSubProceso

// MÓDULO 2: Acumular el monto total y agregar el producto al resumen de texto
SubProceso ProcesarVenta(producto, precio, montoTotal Por Referencia, resumenVentas Por Referencia)
    Definir lineaVenta Como Caracter
    montoTotal <- montoTotal + precio
    
    lineaVenta <- Concatenar("- ", producto)
    lineaVenta <- Concatenar(lineaVenta, " ($")
    lineaVenta <- Concatenar(lineaVenta, ConvertirATexto(precio))
    lineaVenta <- Concatenar(lineaVenta, ")  ")
    
    resumenVentas <- Concatenar(resumenVentas, lineaVenta)
FinSubProceso

// MÓDULO 3: Mostrar el cierre de caja con el resumen y monto total
SubProceso MostrarCierreVentas(resumenVentas, montoTotal, cantidadVentas)
    Escribir "========================================"
    Escribir "           RESUMEN DE VENTAS            "
    Escribir "========================================"
    Escribir "Productos vendidos (", cantidadVentas, "):"
    Escribir resumenVentas
    Escribir "----------------------------------------"
    Escribir "MONTO TOTAL DE VENTAS: $", montoTotal
    Escribir "========================================"
FinSubProceso

// ALGORITMO PRINCIPAL
Algoritmo RegistroVentas
    Definir nomProd, resumenTexto, seguirVendiendo Como Caracter
    Definir precioProd, totalRecaudado Como Real
    Definir cantProductos Como Entero
    
    resumenTexto <- ""
    totalRecaudado <- 0
    cantProductos <- 0
    seguirVendiendo <- "S"
    
    Escribir "=== SISTEMA DE REGISTRO DE VENTAS ==="
    Mientras seguirVendiendo = "S" Hacer
        cantProductos <- cantProductos + 1
        Escribir ""
        PedirVenta(nomProd, precioProd)
        ProcesarVenta(nomProd, precioProd, totalRecaudado, resumenTexto)
        
        Escribir Sin Saltar "¿Desea registrar otra venta? (S/N): "
        Leer seguirVendiendo
        seguirVendiendo <- Mayusculas(seguirVendiendo)
        
        Mientras seguirVendiendo <> "S" Y seguirVendiendo <> "N" Hacer
            Escribir "Respuesta inválida. Ingrese S para Sí o N para No: "
            Leer seguirVendiendo
            seguirVendiendo <- Mayusculas(seguirVendiendo)
        FinMientras
    FinMientras
    
    MostrarCierreVentas(resumenTexto, totalRecaudado, cantProductos)
FinAlgoritmo

