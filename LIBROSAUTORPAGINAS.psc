// MÓDULO 1: Solicitar los datos de un libro
SubProceso PedirDatosLibro(titulo Por Referencia, autor Por Referencia, paginas Por Referencia)
    Escribir Sin Saltar "Ingrese el título del libro: "
    Leer titulo
    
    Escribir Sin Saltar "Ingrese el autor del libro: "
    Leer autor
    
    Escribir Sin Saltar "Ingrese el número de páginas: "
    Leer paginas
    Mientras paginas <= 0 Hacer
        Escribir "El número de páginas debe ser mayor a 0. Intente de nuevo: "
        Leer paginas
    FinMientras
FinSubProceso

// MÓDULO 2: Acumular la información del libro en una cadena de texto
SubProceso AgregarALista(titulo, autor, paginas, contador, listaTexto Por Referencia)
    Definir fichaLibro Como Caracter
    fichaLibro <- Concatenar(ConvertirATexto(contador), ". Título: ")
    fichaLibro <- Concatenar(fichaLibro, titulo)
    fichaLibro <- Concatenar(fichaLibro, " | Autor: ")
    fichaLibro <- Concatenar(fichaLibro, autor)
    fichaLibro <- Concatenar(fichaLibro, " | Páginas: ")
    fichaLibro <- Concatenar(fichaLibro, ConvertirATexto(paginas))
    fichaLibro <- Concatenar(fichaLibro, " // ")
    
    listaTexto <- Concatenar(listaTexto, fichaLibro)
FinSubProceso

// MÓDULO 3: Mostrar todos los libros registrados
SubProceso MostrarInventario(listaTexto, totalLibros)
    Escribir "========================================"
    Escribir "    LIBROS REGISTRADOS EN BIBLIOTECA    "
    Escribir "========================================"
    Escribir "Total de libros: ", totalLibros
    Escribir listaTexto
    Escribir "========================================"
FinSubProceso

// ALGORITMO PRINCIPAL
Algoritmo RegistroBiblioteca
    Definir tit, aut, acumuladorLibros, continuar Como Caracter
    Definir pags, cantLibros Como Entero
    
    acumuladorLibros <- ""
    cantLibros <- 0
    continuar <- "S"
    
    Escribir "=== SISTEMA DE REGISTRO DE BIBLIOTECA ==="
    Mientras continuar = "S" Hacer
        cantLibros <- cantLibros + 1
        Escribir ""
        Escribir "--- Registro #", cantLibros, " ---"
        PedirDatosLibro(tit, aut, pags)
        AgregarALista(tit, aut, pags, cantLibros, acumuladorLibros)
        
        Escribir Sin Saltar "¿Desea registrar otro libro? (S/N): "
        Leer continuar
        continuar <- Mayusculas(continuar)
        
        Mientras continuar <> "S" Y continuar <> "N" Hacer
            Escribir "Opción inválida. Ingrese S para Sí o N para No: "
            Leer continuar
            continuar <- Mayusculas(continuar)
        FinMientras
    FinMientras
    
    MostrarInventario(acumuladorLibros, cantLibros)
FinAlgoritmo

