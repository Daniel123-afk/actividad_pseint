// MÓDULO 1: Solicitar el monto a retirar
SubProceso PedirMonto(saldo, monto Por Referencia)
    Escribir "=== CAJERO AUTOMÁTICO ==="
    Escribir "Saldo disponible en su cuenta: $", saldo
    Escribir Sin Saltar "Ingrese el monto que desea retirar: "
    Leer monto
    
    Mientras monto <= 0 Hacer
        Escribir "Error: El monto debe ser mayor a 0. Ingrese nuevamente: "
        Leer monto
    FinMientras
FinSubProceso

// MÓDULO 2: Verificar saldo y procesar el retiro
SubProceso ProcesarRetiro(monto, saldo Por Referencia, exito Por Referencia)
    Si monto > saldo Entonces
        exito <- Falso
    SiNo
        saldo <- saldo - monto
        exito <- Verdadero
    FinSi
FinSubProceso

// MÓDULO 3: Mostrar el resultado de la transacción
SubProceso MostrarComprobante(exito, monto, saldoRestante)
    Escribir "----------------------------------------"
    Si exito Entonces
        Escribir "Retiro exitoso por: $", monto
        Escribir "Saldo restante en su cuenta: $", saldoRestante
    SiNo
        Escribir "ERROR: Fondos insuficientes."
        Escribir "El monto solicitado ($", monto, ") excede su saldo ($", saldoRestante, ")."
    FinSi
    Escribir "----------------------------------------"
FinSubProceso

// ALGORITMO PRINCIPAL
Algoritmo CajeroAutomatico
    Definir saldoCuenta, montoRetiro Como Real
    Definir retiroAprobado Como Logico
    
    saldoCuenta <- 1000 // Saldo inicial simulado
    
    PedirMonto(saldoCuenta, montoRetiro)
    ProcesarRetiro(montoRetiro, saldoCuenta, retiroAprobado)
    MostrarComprobante(retiroAprobado, montoRetiro, saldoCuenta)
FinAlgoritmo

