// MÓDULO 1: Solicitar y validar los datos de entrada
SubProceso PedirDatos(tipo Por Referencia, cantidad Por Referencia)
    Escribir "=== BIENVENIDO A LA TIENDA ==="
    Escribir "Tipos de producto disponibles:"
    Escribir "  [A] Alimentos ($10 c/u - 10% desc.)"
    Escribir "  [V] Vestimenta ($25 c/u - 5% desc.)"
    Escribir "  [E] Electrónicos ($100 c/u - Sin desc.)"
    Escribir Sin Saltar "Ingrese el tipo de producto (A, V o E): "
    Leer tipo
    tipo <- Mayusculas(tipo)
    
    Mientras tipo <> "A" Y tipo <> "V" Y tipo <> "E" Hacer
        Escribir "Opción inválida. Por favor ingrese A, V o E: "
        Leer tipo
        tipo <- Mayusculas(tipo)
    FinMientras
    
    Escribir Sin Saltar "Ingrese la cantidad de unidades: "
    Leer cantidad
    Mientras cantidad <= 0 Hacer
        Escribir "Error: La cantidad debe ser un número positivo. Intente de nuevo: "
        Leer cantidad
    FinMientras
FinSubProceso

// MÓDULO 2: Calcular costos sin descuento y con descuento
SubProceso CalcularCompra(tipo, cantidad, totalSinDesc Por Referencia, totalConDesc Por Referencia)
    Definir precioBase, porcentajeDesc Como Real
    
    Segun tipo Hacer
        "A":
            precioBase <- 10
            porcentajeDesc <- 0.10
        "V":
            precioBase <- 25
            porcentajeDesc <- 0.05
        "E":
            precioBase <- 100
            porcentajeDesc <- 0
    FinSegun
    
    totalSinDesc <- precioBase * cantidad
    totalConDesc <- totalSinDesc - (totalSinDesc * porcentajeDesc)
FinSubProceso

// MÓDULO 3: Mostrar los resultados finales
SubProceso MostrarFactura(totalSinDesc, totalConDesc)
    Escribir "----------------------------------------"
    Escribir "Costo sin descuento: $", totalSinDesc
    Escribir "Costo total con descuento aplicado: $", totalConDesc
    Escribir "----------------------------------------"
FinSubProceso

// ALGORITMO PRINCIPAL
Algoritmo TiendaModular
    Definir tipoProducto Como Caracter
    Definir unidades Como Entero
    Definir subtotal, totalFinal Como Real
    
    PedirDatos(tipoProducto, unidades)
    CalcularCompra(tipoProducto, unidades, subtotal, totalFinal)
    MostrarFactura(subtotal, totalFinal)
FinAlgoritmo

