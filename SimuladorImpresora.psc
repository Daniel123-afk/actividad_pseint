// MÓDULO 1: Solicitar la cantidad de páginas a imprimir
SubProceso PedirPaginas(papelDisponible, paginas Por Referencia)
    Escribir "Papel disponible en bandeja: ", papelDisponible, " hojas."
    Escribir Sin Saltar "Ingrese la cantidad de páginas que desea imprimir: "
    Leer paginas
    
    Mientras paginas <= 0 Hacer
        Escribir "Cantidad inválida. Debe imprimir al menos 1 página: "
        Leer paginas
    FinMientras
FinSubProceso

// MÓDULO 2: Verificar capacidad de papel y descontar hojas impresas
SubProceso ProcesarImpresion(paginas, papelRestante Por Referencia, impreso Por Referencia)
    Si paginas <= papelRestante Entonces
        papelRestante <- papelRestante - paginas
        impreso <- Verdadero
    SiNo
        impreso <- Falso
    FinSi
FinSubProceso

// MÓDULO 3: Mostrar estado de la impresión y papel restante
SubProceso MostrarEstadoImpresora(impreso, paginas, papelRestante)
    Escribir "----------------------------------------"
    Si impreso Entonces
        Escribir "Imprimiendo ", paginas, " página(s)..."
        Escribir "Impresión completada. Papel restante: ", papelRestante, " hojas."
    SiNo
        Escribir "ERROR: Papel insuficiente para imprimir ", paginas, " páginas."
        Escribir "Solo quedan ", papelRestante, " hojas disponibles."
    FinSi
    Escribir "----------------------------------------"
FinSubProceso

// ALGORITMO PRINCIPAL
Algoritmo SimuladorImpresora
    Definir capacidadPapel, paginasImprimir Como Entero
    Definir exitoImpresion Como Logico
    
    capacidadPapel <- 50 // Capacidad inicial de la bandeja
    
    Escribir "=== SIMULADOR DE IMPRESORA ==="
    Mientras capacidadPapel > 0 Hacer
        PedirPaginas(capacidadPapel, paginasImprimir)
        ProcesarImpresion(paginasImprimir, capacidadPapel, exitoImpresion)
        MostrarEstadoImpresora(exitoImpresion, paginasImprimir, capacidadPapel)
        Escribir ""
    FinMientras
    
    Escribir "ALERTA: La impresora se ha quedado sin papel (0 hojas). Proceso finalizado."
FinAlgoritmo

