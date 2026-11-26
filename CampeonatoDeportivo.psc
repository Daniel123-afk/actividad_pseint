// MÓDULO 1: Solicitar el resultado del partido
SubProceso PedirResultado(resultado Por Referencia)
    Escribir "=== CAMPEONATO DEPORTIVO ==="
    Escribir "Partido: Equipo Local vs. Equipo Visitante"
    Escribir "Ingrese el resultado para el Equipo Local:"
    Escribir "  [G] Ganado"
    Escribir "  [E] Empatado"
    Escribir "  [P] Perdido"
    Escribir Sin Saltar "Seleccione una opción (G, E o P): "
    Leer resultado
    resultado <- Mayusculas(resultado)
    
    Mientras resultado <> "G" Y resultado <> "E" Y resultado <> "P" Hacer
        Escribir "Opción inválida. Ingrese G, E o P: "
        Leer resultado
        resultado <- Mayusculas(resultado)
    FinMientras
FinSubProceso

// MÓDULO 2: Asignar puntos según el resultado
SubProceso ActualizarPuntos(resultado, ptsLocal Por Referencia, ptsVisitante Por Referencia)
    Segun resultado Hacer
        "G":
            ptsLocal <- ptsLocal + 3
        "E":
            ptsLocal <- ptsLocal + 1
            ptsVisitante <- ptsVisitante + 1
        "P":
            ptsVisitante <- ptsVisitante + 3
    FinSegun
FinSubProceso

// MÓDULO 3: Mostrar la tabla de clasificación ordenada
SubProceso MostrarTabla(ptsLocal, ptsVisitante)
    Escribir "----------------------------------------"
    Escribir "       CLASIFICACIÓN ACTUALIZADA        "
    Escribir "----------------------------------------"
    Si ptsLocal >= ptsVisitante Entonces
        Escribir "1. Equipo Local:     ", ptsLocal, " pts"
        Escribir "2. Equipo Visitante: ", ptsVisitante, " pts"
    SiNo
        Escribir "1. Equipo Visitante: ", ptsVisitante, " pts"
        Escribir "2. Equipo Local:     ", ptsLocal, " pts"
    FinSi
    Escribir "----------------------------------------"
FinSubProceso

// ALGORITMO PRINCIPAL
Algoritmo CampeonatoDeportivo
    Definir resPartido Como Caracter
    Definir puntosLocal, puntosVisitante Como Entero
    
    // Puntos iniciales antes de jugar la fecha
    puntosLocal <- 6
    puntosVisitante <- 7
    
    PedirResultado(resPartido)
    ActualizarPuntos(resPartido, puntosLocal, puntosVisitante)
    MostrarTabla(puntosLocal, puntosVisitante)
FinAlgoritmo

