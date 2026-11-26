// MÓDULO 1: Seleccionar varios platos y bebidas y pedir método de pago
SubProceso TomarPedido(subtotal Por Referencia, metodoPago Por Referencia)
    Definir opcionMenu, cantidad Como Entero
    subtotal <- 0
    
    Repetir
        Escribir "=== MENÚ DEL RESTAURANTE ==="
        Escribir "  1. Plato Fuerte: Bandeja Especial ($15)"
        Escribir "  2. Plato Fuerte: Pasta Alfredo    ($12)"
        Escribir "  3. Bebida: Jugo Natural           ($4)"
        Escribir "  4. Bebida: Gaseosa                ($3)"
        Escribir "  5. Finalizar pedido y pagar"
        Escribir Sin Saltar "Seleccione una opción (1-5): "
        Leer opcionMenu
        
        Si opcionMenu >= 1 Y opcionMenu <= 4 Entonces
            Escribir Sin Saltar "¿Cuántas unidades desea?: "
            Leer cantidad
            Mientras cantidad <= 0 Hacer
                Escribir "Cantidad inválida. Ingrese un número mayor a 0: "
                Leer cantidad
            FinMientras
            
            Segun opcionMenu Hacer
                1: subtotal <- subtotal + (15 * cantidad)
                2: subtotal <- subtotal + (12 * cantidad)
                3: subtotal <- subtotal + (4 * cantidad)
                4: subtotal <- subtotal + (3 * cantidad)
            FinSegun
            Escribir "-> Agregado al pedido. Subtotal actual: $", subtotal
            Escribir ""
        SiNo
            Si opcionMenu <> 5 Entonces
                Escribir "Opción no válida. Intente nuevamente."
            FinSi
        FinSi
    Hasta Que opcionMenu = 5
    
    Escribir "----------------------------------------"
    Escribir "Seleccione el método de pago:"
    Escribir "  [E] Efectivo (10% de descuento)"
    Escribir "  [T] Tarjeta de crédito (5% de descuento)"
    Escribir "  [C] Cheque (Sin descuento)"
    Escribir Sin Saltar "Método de pago (E, T o C): "
    Leer metodoPago
    metodoPago <- Mayusculas(metodoPago)
    
    Mientras metodoPago <> "E" Y metodoPago <> "T" Y metodoPago <> "C" Hacer
        Escribir "Método inválido. Ingrese E, T o C: "
        Leer metodoPago
        metodoPago <- Mayusculas(metodoPago)
    FinMientras
FinSubProceso

// MÓDULO 2: Calcular el descuento y el total final
SubProceso CalcularTotal(subtotal, metodoPago, descuento Por Referencia, totalFinal Por Referencia)
    Segun metodoPago Hacer
        "E": descuento <- subtotal * 0.10
        "T": descuento <- subtotal * 0.05
        "C": descuento <- 0
    FinSegun
    totalFinal <- subtotal - descuento
FinSubProceso

// MÓDULO 3: Imprimir el recibo de pago
SubProceso MostrarCuenta(subtotal, descuento, totalFinal)
    Escribir "========================================"
    Escribir "           RESUMEN DE CUENTA            "
    Escribir "========================================"
    Escribir "Subtotal consumo:   $", subtotal
    Escribir "Descuento aplicado: $", descuento
    Escribir "Total a pagar:      $", totalFinal
    Escribir "========================================"
FinSubProceso

// ALGORITMO PRINCIPAL
Algoritmo MenuRestaurante
    Definir sub, desc, total Como Real
    Definir pago Como Caracter
    
    TomarPedido(sub, pago)
    CalcularTotal(sub, pago, desc, total)
    MostrarCuenta(sub, desc, total)
FinAlgoritmo
