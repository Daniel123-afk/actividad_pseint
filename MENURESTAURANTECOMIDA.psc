// MÓDULO 1: Mostrar el menú y leer la opción elegida
SubProceso SeleccionarOpcion(opcionMenu Por Referencia)
    Escribir "=== MENÚ DE COMIDAS RÁPIDAS ==="
    Escribir "  1. Hamburguesa Especial  ($18.000)"
    Escribir "  2. Perro Caliente Doble  ($12.000)"
    Escribir "  3. Salchipapa Mixta      ($15.000)"
    Escribir "  4. Porción de Papas      ($6.000)"
    Escribir "  5. Gaseosa               ($4.000)"
    Escribir "  6. Finalizar pedido"
    Escribir Sin Saltar "Elija una opción (1-6): "
    Leer opcionMenu
    
    Mientras opcionMenu < 1 O opcionMenu > 6 Hacer
        Escribir "Opción no válida. Seleccione entre 1 y 6: "
        Leer opcionMenu
    FinMientras
FinSubProceso

// MÓDULO 2: Sumar el precio del producto elegido al total del pedido
SubProceso SumarPedido(opcionMenu, totalPagar Por Referencia)
    Definir cantidad Como Entero
    Escribir Sin Saltar "¿Cuántas unidades desea?: "
    Leer cantidad
    Mientras cantidad <= 0 Hacer
        Escribir "Cantidad inválida. Ingrese un número mayor a 0: "
        Leer cantidad
    FinMientras
    
    Segun opcionMenu Hacer
        1: totalPagar <- totalPagar + (18000 * cantidad)
        2: totalPagar <- totalPagar + (12000 * cantidad)
        3: totalPagar <- totalPagar + (15000 * cantidad)
        4: totalPagar <- totalPagar + (6000 * cantidad)
        5: totalPagar <- totalPagar + (4000 * cantidad)
    FinSegun
    Escribir "-> Producto agregado. Total parcial: $", totalPagar
    Escribir ""
FinSubProceso

// MÓDULO 3: Mostrar el total a pagar y mensaje de agradecimiento
SubProceso MostrarCuentaFinal(totalPagar)
    Escribir "========================================"
    Escribir "Total a pagar por su pedido: $", totalPagar
    Escribir "¡Muchas gracias por su compra! Vuelva pronto."
    Escribir "========================================"
FinSubProceso

// ALGORITMO PRINCIPAL
Algoritmo MenuComidasRapidas
    Definir opc Como Entero
    Definir totalPedido Como Real
    
    totalPedido <- 0
    opc <- 0
    
    Mientras opc <> 6 Hacer
        SeleccionarOpcion(opc)
        Si opc <> 6 Entonces
            SumarPedido(opc, totalPedido)
        FinSi
    FinMientras
    
    MostrarCuentaFinal(totalPedido)
FinAlgoritmo

