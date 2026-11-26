// MÓDULO 1: Solicitar peso y altura al paciente
SubProceso SolicitarMedidas(peso Por Referencia, altura Por Referencia)
    Escribir "=== ASISTENTE DE NUTRICIÓN (IMC) ==="
    Escribir Sin Saltar "Ingrese su peso en kilogramos (ej. 70.5): "
    Leer peso
    Mientras peso <= 0 Hacer
        Escribir "El peso debe ser mayor a 0. Ingrese nuevamente: "
        Leer peso
    FinMientras
    
    Escribir Sin Saltar "Ingrese su altura en metros (ej. 1.75): "
    Leer altura
    Mientras altura <= 0 Hacer
        Escribir "La altura debe ser mayor a 0. Ingrese nuevamente: "
        Leer altura
    FinMientras
FinSubProceso

// MÓDULO 2: Calcular el valor numérico del IMC y determinar su categoría
SubProceso EvaluarIMC(peso, altura, imc Por Referencia, categoria Por Referencia)
    imc <- peso / (altura ^ 2)
    
    Si imc < 18.5 Entonces
        categoria <- "Bajo peso"
    SiNo
        Si imc < 24.9 Entonces
            categoria <- "Peso normal"
        SiNo
            Si imc <= 29.9 Entonces
                categoria <- "Sobrepeso"
            SiNo
                categoria <- "Obesidad"
            FinSi
        FinSi
    FinSi
FinSubProceso

// MÓDULO 3: Mostrar diagnóstico al paciente
SubProceso MostrarDiagnostico(imc, categoria)
    Escribir "----------------------------------------"
    Escribir "Su Índice de Masa Corporal (IMC) es: ", imc
    Escribir "Categoría nutricional: ", categoria
    Escribir "----------------------------------------"
FinSubProceso

// ALGORITMO PRINCIPAL
Algoritmo AsistenteNutricionista
    Definir pesoPaciente, alturaPaciente, valorIMC Como Real
    Definir diagnostico Como Caracter
    
    SolicitarMedidas(pesoPaciente, alturaPaciente)
    EvaluarIMC(pesoPaciente, alturaPaciente, valorIMC, diagnostico)
    MostrarDiagnostico(valorIMC, diagnostico)
FinAlgoritmo

