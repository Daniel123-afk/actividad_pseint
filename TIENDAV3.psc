// MÓDULO 1: Solicitar y validar nombre, precio y cantidad vendida del producto
SubProceso PedirDatosVenta(producto Por Referencia, precio Por Referencia, cantidad Por Referencia)
    Escribir Sin Saltar "Ingrese el nombre del producto: "
    Leer producto
    
    Escribir Sin Saltar "Ingrese el precio unitario del producto: $"
    Leer precio
    Mientras precio <= 0 Hacer
        Escribir "Precio inválido. Debe ser mayor a 0. Ingrese nuevamente: "
        Leer precio
    FinMientras
    
    Escribir Sin Saltar "Ingrese la cantidad vendida: "
    Leer cantidad
    Mientras cantidad <= 0 Hacer
        Escribir "Cantidad inválida. Debe ser mayor a 0. Ingrese nuevamente: "
        Leer cantidad
    FinMientras
FinSubProceso

// MÓDULO 2: Calcular subtotal, acumular el total de ventas y registrar el detalle
SubProceso ProcesarVentaTienda(producto, precio, cantidad, totalVentas Por Referencia, listaVendidos Por Referencia)
    Definir subtotalProducto Como Real
    Definir detalleItem Como Caracter
    
    subtotalProducto <- precio * cantidad
    totalVentas <- totalVentas + subtotalProducto
    
    detalleItem <- Concatenar("- ", producto)
    detalleItem <- Concatenar(detalleItem, " | Cant: ")
    detalleItem <- Concatenar(detalleItem, ConvertirATexto(cantidad))
    detalleItem <- Concatenar(detalleItem, " x $")
    detalleItem <- Concatenar(detalleItem, ConvertirATexto(precio))
    detalleItem <- Concatenar(detalleItem, " = $")
    detalleItem <- Concatenar(detalleItem, ConvertirATexto(subtotalProducto))
    detalleItem <- Concatenar(detalleItem, " // ")
    
    listaVendidos <- Concatenar(listaVendidos, detalleItem)
FinSubProceso

// MÓDULO 3: Mostrar el resumen de productos vendidos y el total recaudado
SubProceso MostrarReporteVentas(listaVendidos, totalVentas)
    Escribir "========================================"
    Escribir "       REPORTE FINAL DE VENTAS          "
    Escribir "========================================"
    Escribir "Detalle de productos vendidos:"
    Escribir listaVendidos
    Escribir "----------------------------------------"
    Escribir "TOTAL DE VENTAS: $", totalVentas
    Escribir "========================================"
FinSubProceso

// ALGORITMO PRINCIPAL
Algoritmo ProcesoVentasTienda
    Definir nomProd, acumuladorProductos, seguirRegistrando Como Caracter
    Definir precioUnit, totalRecaudado Como Real
    Definir cantVendida Como Entero
    
    acumuladorProductos <- ""
    totalRecaudado <- 0
    seguirRegistrando <- "S"
    
    Escribir "=== SISTEMA DE VENTAS DE TIENDA ==="
    Mientras seguirRegistrando = "S" Hacer
        Escribir ""
        PedirDatosVenta(nomProd, precioUnit, cantVendida)
        ProcesarVentaTienda(nomProd, precioUnit, cantVendida, totalRecaudado, acumuladorProductos)
        
        Escribir Sin Saltar "¿Desea registrar otro producto vendido? (S/N): "
        Leer seguirRegistrando
        seguirRegistrando <- Mayusculas(seguirRegistrando)
        
        Mientras seguirRegistrando <> "S" Y seguirRegistrando <> "N" Hacer
            Escribir "Respuesta inválida. Ingrese S para Sí o N para No: "
            Leer seguirRegistrando
            seguirRegistrando <- Mayusculas(seguirRegistrando)
        FinMientras
    FinMientras
    
    MostrarReporteVentas(acumuladorProductos, totalRecaudado)
FinAlgoritmo

