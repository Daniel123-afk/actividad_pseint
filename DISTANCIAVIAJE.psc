// MÓDULO 1: Solicitar y validar distancia y velocidad promedio
SubProceso PedirDatosViaje(distancia Por Referencia, velocidad Por Referencia)
    Escribir Sin Saltar "Ingrese la distancia total del viaje (en km): "
    Leer distancia
    Mientras distancia <= 0 Hacer
        Escribir "La distancia debe ser mayor a 0. Ingrese nuevamente: "
        Leer distancia
    FinMientras
    
    Escribir Sin Saltar "Ingrese la velocidad promedio del coche (en km/h): "
    Leer velocidad
    Mientras velocidad <= 0 Hacer
        Escribir "La velocidad debe ser mayor a 0. Ingrese nuevamente: "
        Leer velocidad
    FinMientras
FinSubProceso

// MÓDULO 2: Calcular el tiempo estimado de viaje en horas
SubProceso CalcularTiempoViaje(distancia, velocidad, tiempoHoras Por Referencia)
    tiempoHoras <- distancia / velocidad
FinSubProceso

// MÓDULO 3: Mostrar el resultado del viaje
SubProceso MostrarEstimacion(distancia, velocidad, tiempoHoras)
    Escribir "----------------------------------------"
    Escribir "Distancia: ", distancia, " km | Velocidad: ", velocidad, " km/h"
    Escribir "Tiempo estimado de viaje: ", tiempoHoras, " horas."
    Escribir "----------------------------------------"
FinSubProceso

// ALGORITMO PRINCIPAL
Algoritmo SimuladorViaje
    Definir dist, vel, tiempo Como Real
    Definir otroViaje Como Caracter
    
    otroViaje <- "S"
    Escribir "=== SIMULADOR DE VIAJE EN COCHE ==="
    
    Mientras otroViaje = "S" Hacer
        PedirDatosViaje(dist, vel)
        CalcularTiempoViaje(dist, vel, tiempo)
        MostrarEstimacion(dist, vel, tiempo)
        
        Escribir Sin Saltar "¿Desea simular otro viaje? (S/N): "
        Leer otroViaje
        otroViaje <- Mayusculas(otroViaje)
        
        Mientras otroViaje <> "S" Y otroViaje <> "N" Hacer
            Escribir "Respuesta inválida. Ingrese S para Sí o N para No: "
            Leer otroViaje
            otroViaje <- Mayusculas(otroViaje)
        FinMientras
        Escribir ""
    FinMientras
    
    Escribir "Simulación finalizada. ¡Buen viaje!"
FinAlgoritmo

