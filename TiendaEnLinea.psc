// MÓDULO 1: Solicitar precio y cantidad de un producto
SubProceso LeerProducto(precio Por Referencia, cantidad Por Referencia)
    Escribir Sin Saltar "Ingrese el precio del producto: $"
    Leer precio
    Mientras precio <= 0 Hacer
        Escribir "El precio debe ser mayor a 0. Ingrese nuevamente: "
        Leer precio
    FinMientras
    
    Escribir Sin Saltar "Ingrese la cantidad que desea comprar: "
    Leer cantidad
    Mientras cantidad <= 0 Hacer
        Escribir "La cantidad debe ser mayor a 0. Ingrese nuevamente: "
        Leer cantidad
    FinMientras
FinSubProceso

// MÓDULO 2: Calcular el subtotal del ítem y sumarlo al total acumulado
SubProceso AcumularCompra(precio, cantidad, totalAcumulado Por Referencia)
    Definir costoProducto Como Real
    costoProducto <- precio * cantidad
    totalAcumulado <- totalAcumulado + costoProducto
    Escribir "-> Costo de este producto: $", costoProducto
    Escribir "-> Total acumulado hasta ahora: $", totalAcumulado
FinSubProceso

// MÓDULO 3: Mostrar el resumen final de la compra
SubProceso MostrarTotalCompra(totalFinal)
    Escribir "========================================"
    Escribir "       RESUMEN DE COMPRA EN LÍNEA       "
    Escribir "========================================"
    Escribir "Costo total a pagar: $", totalFinal
    Escribir "========================================"
FinSubProceso

// ALGORITMO PRINCIPAL
Algoritmo TiendaEnLinea
    Definir precioProd, totalCompra Como Real
    Definir cantProd Como Entero
    Definir continuar Como Caracter
    
    totalCompra <- 0
    continuar <- "S"
    
    Escribir "=== BIENVENIDO A LA TIENDA EN LÍNEA ==="
    Mientras continuar = "S" Hacer
        LeerProducto(precioProd, cantProd)
        AcumularCompra(precioProd, cantProd, totalCompra)
        
        Escribir "----------------------------------------"
        Escribir Sin Saltar "¿Desea agregar otro producto? (S/N): "
        Leer continuar
        continuar <- Mayusculas(continuar)
        
        Mientras continuar <> "S" Y continuar <> "N" Hacer
            Escribir "Respuesta inválida. Ingrese S para Sí o N para No: "
            Leer continuar
            continuar <- Mayusculas(continuar)
        FinMientras
        Escribir ""
    FinMientras
    
    MostrarTotalCompra(totalCompra)
FinAlgoritmo

