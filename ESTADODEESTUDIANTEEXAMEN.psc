// MÓDULO 1: Solicitar y validar la nota de un examen
SubProceso PedirNota(nota Por Referencia, numeroExamen)
    Escribir Sin Saltar "Ingrese la calificación del examen #", numeroExamen, " (0.0 a 5.0): "
    Leer nota
    Mientras nota < 0 O nota > 5 Hacer
        Escribir "Nota inválida. Ingrese un valor entre 0.0 y 5.0: "
        Leer nota
    FinMientras
FinSubProceso

// MÓDULO 2: Calcular el promedio y determinar si aprueba o reprueba
SubProceso EvaluarRendimiento(sumaNotas, totalExamenes, promedio Por Referencia, estado Por Referencia)
    promedio <- sumaNotas / totalExamenes
    Si promedio >= 3.0 Entonces
        estado <- "APROBADO"
    SiNo
        estado <- "REPROBADO"
    FinSi
FinSubProceso

// MÓDULO 3: Mostrar el boletín de resultados finales
SubProceso MostrarBoletin(totalExamenes, promedio, estado)
    Escribir "========================================"
    Escribir "         RESULTADOS ACADÉMICOS          "
    Escribir "========================================"
    Escribir "Cantidad de exámenes evaluados: ", totalExamenes
    Escribir "Promedio final: ", promedio
    Escribir "Estado del estudiante: ", estado
    Escribir "========================================"
FinSubProceso

// ALGORITMO PRINCIPAL
Algoritmo PromedioExamenes
    Definir calificacion, acumuladorNotas, promFinal Como Real
    Definir cantExamenes Como Entero
    Definir continuar, estadoFinal Como Caracter
    
    acumuladorNotas <- 0
    cantExamenes <- 0
    continuar <- "S"
    
    Escribir "=== SISTEMA DE CALIFICACIONES ==="
    Mientras continuar = "S" Hacer
        cantExamenes <- cantExamenes + 1
        PedirNota(calificacion, cantExamenes)
        acumuladorNotas <- acumuladorNotas + calificacion
        
        Escribir Sin Saltar "¿Desea ingresar otro resultado? (S/N): "
        Leer continuar
        continuar <- Mayusculas(continuar)
        
        Mientras continuar <> "S" Y continuar <> "N" Hacer
            Escribir "Respuesta inválida. Ingrese S para Sí o N para No: "
            Leer continuar
            continuar <- Mayusculas(continuar)
        FinMientras
        Escribir ""
    FinMientras
    
    EvaluarRendimiento(acumuladorNotas, cantExamenes, promFinal, estadoFinal)
    MostrarBoletin(cantExamenes, promFinal, estadoFinal)
FinAlgoritmo

