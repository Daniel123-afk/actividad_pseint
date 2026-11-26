// MÓDULO 1: Solicitar la descripción y fecha de vencimiento de una tarea
SubProceso PedirDatosTarea(descripcion Por Referencia, fechaVenc Por Referencia)
    Escribir Sin Saltar "Ingrese la descripción de la tarea: "
    Leer descripcion
    
    Escribir Sin Saltar "Ingrese la fecha de vencimiento (ej. 30/11/2026): "
    Leer fechaVenc
FinSubProceso

// MÓDULO 2: Acumular la tarea en la cadena de texto general
SubProceso RegistrarTarea(descripcion, fechaVenc, numeroTarea, listaTareas Por Referencia)
    Definir itemTarea Como Caracter
    itemTarea <- Concatenar("[Tarea #", ConvertirATexto(numeroTarea))
    itemTarea <- Concatenar(itemTarea, ": ")
    itemTarea <- Concatenar(itemTarea, descripcion)
    itemTarea <- Concatenar(itemTarea, " | Vence: ")
    itemTarea <- Concatenar(itemTarea, fechaVenc)
    itemTarea <- Concatenar(itemTarea, "]  ")
    
    listaTareas <- Concatenar(listaTareas, itemTarea)
FinSubProceso

// MÓDULO 3: Mostrar todas las tareas acumuladas
SubProceso MostrarListaTareas(listaTareas, totalTareas)
    Escribir "========================================"
    Escribir "        LISTA DE TAREAS PENDIENTES      "
    Escribir "========================================"
    Escribir "Total de tareas agregadas: ", totalTareas
    Escribir listaTareas
    Escribir "========================================"
FinSubProceso

// ALGORITMO PRINCIPAL
Algoritmo GestionTareas
    Definir desc, fecha, acumuladorTareas, agregarMas Como Caracter
    Definir contadorTareas Como Entero
    
    acumuladorTareas <- ""
    contadorTareas <- 0
    agregarMas <- "S"
    
    Escribir "=== GESTOR DE TAREAS ==="
    Mientras agregarMas = "S" Hacer
        contadorTareas <- contadorTareas + 1
        Escribir ""
        Escribir "--- Nueva Tarea #", contadorTareas, " ---"
        PedirDatosTarea(desc, fecha)
        RegistrarTarea(desc, fecha, contadorTareas, acumuladorTareas)
        
        Escribir Sin Saltar "¿Desea agregar otra tarea? (S/N): "
        Leer agregarMas
        agregarMas <- Mayusculas(agregarMas)
        
        Mientras agregarMas <> "S" Y agregarMas <> "N" Hacer
            Escribir "Opción inválida. Ingrese S para Sí o N para No: "
            Leer agregarMas
            agregarMas <- Mayusculas(agregarMas)
        FinMientras
    FinMientras
    
    MostrarListaTareas(acumuladorTareas, contadorTareas)
FinAlgoritmo

