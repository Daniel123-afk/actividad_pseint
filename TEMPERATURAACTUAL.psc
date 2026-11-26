// MÓDULO 1: Solicitar la lectura actual de temperatura
SubProceso LeerTemperatura(temp Por Referencia)
    Escribir Sin Saltar "Ingrese la temperatura actual (en °C): "
    Leer temp
FinSubProceso

// MÓDULO 2: Verificar si la temperatura está dentro del rango (18°C a 25°C)
SubProceso VerificarRango(temp, enRango Por Referencia)
    Si temp >= 18 Y temp <= 25 Entonces
        enRango <- Verdadero
    SiNo
        enRango <- Falso
        Escribir "¡ALERTA! Temperatura fuera de rango aceptable (18°C - 25°C)."
        Si temp < 18 Entonces
            Escribir "Motivo: Temperatura demasiado baja (", temp, "°C)."
        SiNo
            Escribir "Motivo: Temperatura demasiado alta (", temp, "°C)."
        FinSi
        Escribir "----------------------------------------"
    FinSi
FinSubProceso

// MÓDULO 3: Confirmar que el sensor está estable
SubProceso MostrarConfirmacion(temp)
    Escribir "========================================"
    Escribir "ESTADO ÓPTIMO: Temperatura normal (", temp, "°C)."
    Escribir "Sistema estabilizado."
    Escribir "========================================"
FinSubProceso

// ALGORITMO PRINCIPAL
Algoritmo SensorTemperatura
    Definir tempActual Como Real
    Definir rangoAceptable Como Logico
    
    rangoAceptable <- Falso
    Escribir "=== MONITOREO DE SENSOR DE TEMPERATURA ==="
    Escribir "Rango permitido: 18°C a 25°C"
    Escribir ""
    
    Mientras No rangoAceptable Hacer
        LeerTemperatura(tempActual)
        VerificarRango(tempActual, rangoAceptable)
    FinMientras
    
    MostrarConfirmacion(tempActual)
FinAlgoritmo

