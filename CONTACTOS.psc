// MÓDULO 1: Solicitar nombre y número de teléfono del contacto
SubProceso PedirContacto(nombre Por Referencia, telefono Por Referencia)
    Escribir Sin Saltar "Ingrese el nombre del contacto: "
    Leer nombre
    
    Escribir Sin Saltar "Ingrese el número de teléfono: "
    Leer telefono
FinSubProceso

// MÓDULO 2: Guardar el contacto en la cadena acumuladora
SubProceso GuardarEnAgenda(numeroContacto, nombre, telefono, agendaTexto Por Referencia)
    Definir fichaContacto Como Caracter
    fichaContacto <- Concatenar(ConvertirATexto(numeroContacto), ". ")
    fichaContacto <- Concatenar(fichaContacto, nombre)
    fichaContacto <- Concatenar(fichaContacto, " - Tel: ")
    fichaContacto <- Concatenar(fichaContacto, telefono)
    fichaContacto <- Concatenar(fichaContacto, " // ")
    
    agendaTexto <- Concatenar(agendaTexto, fichaContacto)
FinSubProceso

// MÓDULO 3: Mostrar la lista completa de contactos registrados
SubProceso MostrarAgenda(totalContactos, agendaTexto)
    Escribir "========================================"
    Escribir "          AGENDA DE CONTACTOS           "
    Escribir "========================================"
    Escribir "Contactos guardados: ", totalContactos
    Escribir agendaTexto
    Escribir "========================================"
FinSubProceso

// ALGORITMO PRINCIPAL
Algoritmo AgendaContactos
    Definir nomContacto, telContacto, acumuladorAgenda, agregarOtro Como Caracter
    Definir contadorContactos Como Entero
    
    acumuladorAgenda <- ""
    contadorContactos <- 0
    agregarOtro <- "S"
    
    Escribir "=== MI AGENDA DE CONTACTOS ==="
    Mientras agregarOtro = "S" Hacer
        contadorContactos <- contadorContactos + 1
        Escribir ""
        Escribir "--- Contacto #", contadorContactos, " ---"
        PedirContacto(nomContacto, telContacto)
        GuardarEnAgenda(contadorContactos, nomContacto, telContacto, acumuladorAgenda)
        
        Escribir Sin Saltar "¿Desea agregar otro contacto? (S/N): "
        Leer agregarOtro
        agregarOtro <- Mayusculas(agregarOtro)
        
        Mientras agregarOtro <> "S" Y agregarOtro <> "N" Hacer
            Escribir "Respuesta inválida. Ingrese S para Sí o N para No: "
            Leer agregarOtro
            agregarOtro <- Mayusculas(agregarOtro)
        FinMientras
    FinMientras
    
    MostrarAgenda(contadorContactos, acumuladorAgenda)
FinAlgoritmo

