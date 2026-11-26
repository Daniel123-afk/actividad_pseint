// MÓDULO 1: Solicitar y validar la edad del usuario
SubProceso PedirEdad(edad Por Referencia)
    Escribir "=== ASISTENTE VIRTUAL DE CINE ==="
    Escribir Sin Saltar "Por favor, ingrese su edad: "
    Leer edad
    Mientras edad < 0 Hacer
        Escribir "Edad inválida. Ingrese un valor positivo: "
        Leer edad
    FinMientras
FinSubProceso

// MÓDULO 2: Evaluar el rango de edad y asignar la recomendación
SubProceso ObtenerRecomendacion(edad, categoria Por Referencia, recomendacion Por Referencia)
    Si edad < 7 Entonces
        categoria <- "Niños (Menor a 7 años)"
        recomendacion <- "Películas animadas y educativas aptas para todas las edades (Ej: Toy Story, Mi Vecino Totoro)."
    SiNo
        Si edad <= 17 Entonces
            categoria <- "Niños y Adolescentes (7 a 17 años)"
            recomendacion <- "Películas familiares, aventuras y comedias (Ej: Spider-Man: Un nuevo universo, Jumanji)."
        SiNo
            Si edad <= 30 Entonces
                categoria <- "Adultos (18 a 30 años)"
                recomendacion <- "Acción, drama, comedia y ciencia ficción (Ej: Dune, Inception, John Wick)."
            SiNo
                categoria <- "Personas Mayores (31 años o más)"
                recomendacion <- "Películas clásicas y dramas (Ej: El Padrino, Casablanca, La Lista de Schindler)."
            FinSi
        FinSi
    FinSi
FinSubProceso

// MÓDULO 3: Mostrar la cartelera recomendada
SubProceso MostrarCartelera(categoria, recomendacion)
    Escribir "----------------------------------------"
    Escribir "Público: ", categoria
    Escribir "Recomendación: ", recomendacion
    Escribir "----------------------------------------"
FinSubProceso

// ALGORITMO PRINCIPAL
Algoritmo AsistenteCine
    Definir edadUsuario Como Entero
    Definir grupo, cartelera Como Caracter
    
    PedirEdad(edadUsuario)
    ObtenerRecomendacion(edadUsuario, grupo, cartelera)
    MostrarCartelera(grupo, cartelera)
FinAlgoritmo

