// MÓDULO 1: Solicitar nombre y precio del producto
SubProceso PedirProductoCarrito(nombreProd Por Referencia, precioProd Por Referencia)
    Escribir Sin Saltar "Ingrese el nombre del producto: "
    Leer nombreProd
    
    Escribir Sin Saltar "Ingrese el precio del producto: $"
    Leer precioProd
    Mientras precioProd <= 0 Hacer
        Escribir "El precio debe ser mayor a 0. Ingrese nuevamente: "
        Leer precioProd
    FinMientras
FinSubProceso

// MÓDULO 2: Acumular el producto en la lista y sumar su precio al total
SubProceso AgregarAlCarrito(nombreProd, precioProd, listaProductos Por Referencia, totalCarrito Por Referencia)
    Definir itemTexto Como Caracter
    totalCarrito <- totalCarrito + precioProd
    
    itemTexto <- Concatenar("- ", nombreProd)
    itemTexto <- Concatenar(itemTexto, " ($")
    itemTexto <- Concatenar(itemTexto, ConvertirATexto(precioProd))
    itemTexto <- Concatenar(itemTexto, ")  ")
    
    listaProductos <- Concatenar(listaProductos, itemTexto)
FinSubProceso

// MÓDULO 3: Mostrar los productos agregados y el total de la compra
SubProceso MostrarFacturaVirtual(listaProductos, totalCarrito)
    Escribir "========================================"
    Escribir "      RESUMEN DEL CARRITO DE COMPRAS    "
    Escribir "========================================"
    Escribir "Productos agregados:"
    Escribir listaProductos
    Escribir "----------------------------------------"
    Escribir "TOTAL DE LA COMPRA: $", totalCarrito
    Escribir "========================================"
FinSubProceso

// ALGORITMO PRINCIPAL
Algoritmo TiendaVirtualCarrito
    Definir producto, acumuladorProductos, seguirComprando Como Caracter
    Definir precio, acumuladorTotal Como Real
    
    acumuladorProductos <- ""
    acumuladorTotal <- 0
    seguirComprando <- "S"
    
    Escribir "=== TIENDA VIRTUAL - CARRITO DE COMPRAS ==="
    Mientras seguirComprando = "S" Hacer
        Escribir ""
        PedirProductoCarrito(producto, precio)
        AgregarAlCarrito(producto, precio, acumuladorProductos, acumuladorTotal)
        
        Escribir Sin Saltar "¿Desea agregar otro producto al carrito? (S/N): "
        Leer seguirComprando
        seguirComprando <- Mayusculas(seguirComprando)
        
        Mientras seguirComprando <> "S" Y seguirComprando <> "N" Hacer
            Escribir "Opción inválida. Ingrese S para Sí o N para No: "
            Leer seguirComprando
            seguirComprando <- Mayusculas(seguirComprando)
        FinMientras
    FinMientras
    
    MostrarFacturaVirtual(acumuladorProductos, acumuladorTotal)
FinAlgoritmo

