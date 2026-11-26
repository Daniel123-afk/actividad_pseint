// MÓDULO 1: Generar el número secreto aleatorio entre 1 y 100
SubProceso GenerarSecreto(secreto Por Referencia)
    secreto <- Azar(100) + 1
FinSubProceso

// MÓDULO 2: Evaluar el intento del usuario y dar pistas
SubProceso EvaluarIntento(intento, secreto, adivinado Por Referencia)
    Si intento = secreto Entonces
        adivinado <- Verdadero
    SiNo
        adivinado <- Falso
        Si intento < secreto Entonces
            Escribir "Pista: El número secreto es MAYOR que ", intento, "."
        SiNo
            Escribir "Pista: El número secreto es MENOR que ", intento, "."
        FinSi
    FinSi
FinSubProceso

// MÓDULO 3: Mostrar el mensaje de victoria con el total de intentos
SubProceso MostrarVictoria(secreto, totalIntentos)
    Escribir "========================================"
    Escribir "¡FELICIDADES! Adivinaste el número: ", secreto
    Escribir "Lo lograste en ", totalIntentos, " intento(s)."
    Escribir "========================================"
FinSubProceso

// ALGORITMO PRINCIPAL
Algoritmo JuegoAdivinanza
    Definir numSecreto, numUsuario, intentos Como Entero
    Definir acertado Como Logico
    
    GenerarSecreto(numSecreto)
    acertado <- Falso
    intentos <- 0
    
    Escribir "=== JUEGO DE ADIVINANZA (1 AL 100) ==="
    Escribir "He pensado un número entre 1 y 100. ¡Intenta adivinarlo!"
    
    Mientras No acertado Hacer
        Escribir ""
        Escribir Sin Saltar "Ingresa tu número: "
        Leer numUsuario
        
        Mientras numUsuario < 1 O numUsuario > 100 Hacer
            Escribir "Fuera de rango. Ingresa un número entre 1 y 100: "
            Leer numUsuario
        FinMientras
        
        intentos <- intentos + 1
        EvaluarIntento(numUsuario, numSecreto, acertado)
    FinMientras
    
    MostrarVictoria(numSecreto, intentos)
FinAlgoritmo

