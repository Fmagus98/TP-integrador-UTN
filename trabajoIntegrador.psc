Proceso trabajoIntegrador
    Definir usuario, contrasena Como Caracter;
	Definir usuarioCorrecto, contrasenaCorrecta Como Caracter;
	Definir usuarioItem, contrasenaItem Como Caracter;
	Dimension usuarioItem[2],contrasenaItem[2];
    Definir logueado Como Logico;
	
	Definir hamburguesa Como Real;
	Definir nroItem, nombres Como Caracter;
	Definir precios, tiempos Como Real;
	Definir i, tipo, n Como Entero;
	Dimension nroItem[3], nombres[3], precios[3], tiempos[3];
    
	Definir tipoHamburguesa, extraCarne, papas, gaseosa Como Caracter;
    Definir total, descuento, tiempoEspera Como Real;
    Definir ticket Como Caracter;
	Definir numeroTicket Como Entero;
	
	//Definimos las variables para utilizar en el historial de compras del usuario
	Definir historial Como Cadena;
	Dimension  historial[100];
	Definir indiceHistorial Como Entero;
	Definir compra Como Cadena;
	Definir verHistorial Como Caracter;
    
	//Usuarios Precargados
	usuarioItem[0] <- "admin";
    contrasenaItem[0] <- "1234";
	
	usuarioItem[1] <- "user";
    contrasenaItem[1] <- "4321";
    
	
    logueado <- Falso;
    total <- 0;
    descuento <- 0.1; // 10% de descuento para usuarios logueados
    tiempoEspera <- 10; // Tiempo de espera en minutos base
	
	//Inicializamos el historial 
	indiceHistorial <- 0;
	
	//Mostrar Cartel Bienvenida
	Escribir CartelBienvenida;
	
    // Proceso de Login
    Escribir "Bienvenido a la Tienda de Comidas Rápidas";
    Escribir "Ingrese su nombre de usuario: ";
    Leer usuario;
    Escribir "Ingrese su contraseña: ";
    Leer contrasena;
    n <- 0;
	
	Mientras n < 2 y logueado == Falso Hacer
		Si usuario = usuarioItem[n] y contrasena = contrasenaItem[n] Entonces
			logueado <- Verdadero;
		FinSi
		n <- n + 1;
	FinMientras
	
	Si logueado Entonces
		Escribir "Login exitoso. Usted recibirá un descuento del 10%.";
	SiNo
		Escribir "Login fallido. No recibirá descuento.";
	FinSi
	
    // Inicializamos el menú; esto funciona a modo de Diccionario
    nroItem[0] <- "1. ";
	nombres[0] <- "Hamburguesa Simple";
    precios[0] <- 500;
    tiempos[0] <- 2;
	
	nroItem[1] <- "2. ";
    nombres[1] <- "Hamburguesa Doble";
    precios[1] <- 1000;
    tiempos[1] <- 3;
	
	nroItem[2] <- "3. ";
    nombres[2] <- "Hamburguesa Triple";
    precios[2] <- 1500;
    tiempos[2] <- 4;
	
    // Mostrar Menú
	Escribir "Menú:";
    Para i <- 0 Hasta 2 Hacer
        Escribir nroItem[i], nombres[i], " - $", precios[i];
    FinPara
    Escribir "Seleccione el tipo de hamburguesa (1-3):";
    
    // Selección del tipo de hamburguesa
    Repetir
        Leer tipoHamburguesa;
        Si tipoHamburguesa >= "1" y tipoHamburguesa <= "3" Entonces
            tipo <- ConvertirANumero(tipoHamburguesa) - 1;
            hamburguesa <- precios[tipo];
            total <- total + precios[tipo];
            tiempoEspera <- tiempoEspera + tiempos[tipo];
        Sino
            Escribir "Selección inválida. Intente nuevamente.";
        FinSi
    Hasta Que tipoHamburguesa >= "1" y tipoHamburguesa <= "3"
	
	// Opciones adicionales
	Escribir "¿Desea carne extra? (S/N) --> $500: ";
	Leer extraCarne;
	Repetir
		Escribir "Seleccion invalida intente nuevamente";
		Escribir "¿Desea carne extra? (S/N) --> $500: ";
		Leer extraCarne;
	Hasta Que extraCarne = "S" o extraCarne = "s" o extraCarne = 'N' o extraCarne = 'n'; 
	
	Escribir "¿Desea papas fritas? (S/N) --> $250:";
	Leer papas;
	Repetir
		Escribir "Seleccion invalida intentelo nuevamente";
		Escribir "¿Desea papas fritas? (S/N) --> $250:";
		Leer papas;
	Hasta Que papas = 'S' o papas ='s' o papas = 'N' o papas = 'n';
	
	Escribir "¿Desea gaseosa? (S/N) --> $1000:";
	Leer gaseosa;
	Repetir
		Escribir "Seleccion invalida intentelo Nuevamente";
		Escribir "¿Desea gaseosa? (S/N) --> $1000:";
		Leer gaseosa;
	Hasta Que gaseosa = 'S' o gaseosa = 's' o gaseosa = 'N' o gaseosa = 'n';
	
	// Generar numero de ticket y mostrarlo
	numeroTicket <- azar(1000);
	Escribir "";
	Escribir "";
	Escribir CartelHamburguesa;
	Escribir "";
	Escribir "";
	
	Esperar 3 Segundos;
	
	Escribir "------- Ticket de Compra -------";
	Escribir "-------- Numero: ", numeroTicket, " -----------";
	Escribir "--------------------------------";
	Escribir "Nombre de usuario: ", usuario; 
	Escribir "--------------------------------";
	Escribir "";
	Escribir "Tu Pedido: ";
	Escribir " ", nombres[tipo], ": $ ", ConvertirATexto(precios[tipo]);
	
	Si extraCarne = 'S' o extraCarne = 's'  Entonces
		Escribir " + Carne extra: $ 500";
		total <- total + 500;
		tiempoEspera <- tiempoEspera + 3;
	FinSi
	
	Si papas = 'S' o papas = 's' Entonces
		Escribir " + Papas fritas: $ 250";
		total <- total + 250;
		tiempoEspera <- tiempoEspera + 2;
	FinSi
	
	Si gaseosa = 'S' o gaseosa = 's' Entonces
		Escribir " + Gaseosa: $ 1000";
		total <- total + 1000;
		tiempoEspera <- tiempoEspera + 1;
	FinSi
	
	// Aplicar descuento si está logueado
	Si logueado = Verdadero Entonces		
		total <- total * (1 - descuento);		
		Escribir "  + Descuento del 10% => Total:";
		Escribir "$ ", ConvertirATexto(total);
	SiNo
		Escribir " ...............................";
		Escribir " Total: $ ", ConvertirATexto(total);
	FinSi
	
	Escribir "";
	Escribir usuario, " Tu tiempo de espera es de: ";
	Escribir ConvertirATexto(tiempoEspera), " MINUTOS";
	Escribir "";
	Escribir "Te llamaremos por tu nombre y numero";
	Escribir "de ticket cuando el pedido este listo";
	Escribir "";
	Escribir "--------------------------------";
	Escribir "**Muchas Gracias Por Tu Compra**";
	Escribir "--------------------------------";
	
	//----------------------------------- Historial de compras del usuario -------------------------------------------
	// Guardamos la compra en el historial
	compra <- nombres[tipo];
    compra <- Concatenar(compra, " - $");
    compra <- Concatenar(compra, ConvertirATexto(precios[tipo]));
	
    Si extraCarne = 'S' o extraCarne = 's' Entonces
        compra <- Concatenar(compra, " + Carne extra: $500");
    FinSi
    Si papas = 'S' o papas = 's' Entonces
        compra <- Concatenar(compra, " + Papas fritas: $250");
    FinSi
    Si gaseosa = 'S' o gaseosa = 's' Entonces
        compra <- Concatenar(compra, " + Gaseosa: $1000");
    FinSi
    Si logueado = Verdadero Entonces        
        compra <- Concatenar(compra, " + Descuento del 10% => Total: $");
        compra <- Concatenar(compra, ConvertirATexto(total));
    SiNo
        compra <- Concatenar(compra, " Total: $");
        compra <- Concatenar(compra, ConvertirATexto(total));
    FinSi
	
    // Añadimos la compra al historial
    historial[indiceHistorial] <- compra;
    indiceHistorial <- indiceHistorial + 1;
	
    // Mostramos el historial de compras si el usuario lo desea
    Escribir "¿Desea ver el historial de compras? (S/N): ";
    Leer verHistorial;
    Si verHistorial = 'S' o verHistorial = 's' Entonces
        Escribir "------- Historial de Compras -------";
        Para i <- 0 Hasta indiceHistorial - 1 Hacer
            Escribir historial[i];
        FinPara
        Escribir "-------------------------------------";
    FinSi
FinProceso

SubProceso cartelBienvenida <- CartelBienvenida
	Escribir "   ____  _                           _     _                  ";
	Escribir "  |  _ \(_)                         (_)   | |              _  ";
	Escribir "  | |_) |_  ___ _ ____   _____ _ __  _  __| | ___     __ _(_) ";
	Escribir "  |  _ <| |/ _ \ `_ \ \ / / _ \ `_ \| |/ _` |/ _ \   / _` |   ";
	Escribir "  | |_) | |  __/ | | \ V /  __/ | | | | (_| | (_) | | (_| |_  ";
	Escribir "  |____/|_|\___|_| |_|\_/ \___|_|_|_|_|\__,_|\___/   \__,_(_) ";
	Escribir "           |  _ \          |  ____|            | |            ";
	Escribir "           | |_) | ___  ___| |__ ___   ___   __| |            ";
	Escribir "           |  _ < / _ \/ _ \  __/ _ \ / _ \ / _` |            ";
	Escribir "           | |_) |  __/  __/ | | (_) | (_) | (_| |            ";
	Escribir "           |____/ \___|\___|_|  \___/ \___/ \__,_|            ";
	
FinSubProceso

SubProceso cartelHamburguesa <- CartelHamburguesa
	Escribir "   _______________________________";
    Escribir "  /        Generando Ticket       \";
	Escribir " /            De Compra            \";
    Escribir " (_________________________________)";
    Escribir "  {_.-`-._.-`-._.-`-._.-`-._.-`-._}";
    Escribir "  :MM\_/MMMMMMMMMMMMMMMMMMMMMMMMMM:";
    Escribir "  :MMMMMMMMMMMMMMMMMMMMMMMM\_/MMMM:";
	Escribir "  {_.-`-._.-`-._.-`-._.-`-._.-`-._}";
    Escribir " (_________________________________)";
	Escribir "\                                  /";
    Escribir " \________________________________/ ";
FinSubProceso    


// Tareas a realizar:
// 1_ Crear un bucle en el caso que se elija mal la hamburguesa [LISTO]
// 2_ Crear un array con clientes [LISTO]
// 3_ Ver la lógica en el adicional de extra carne cuando se eligió hamburguesa doble
// 4_ Añadir lógica de precios en tipos de papas
// 5_ Añadir lógica de precios en tipos de gaseosa
// 6_ Refactorizar el código --> Final [INICIADO]
// 7_ Se podría crear una función para crear usuario
// 8_ Realizar un bucle para productos adicionales al introducir un dato no válido[LISTO]
// 9_ Crear función de la compra de producto
// 10_ Añadir n° de ticket en cada compra (Bloqueado por punto 9) [LISTO]
// 11_ Historial de compra del usuario.
// 12_ Informar al usuario el pedido --> tiempo de espera (utilizar función esperar)
// 13_ Crear lógica de compra en pesos(opcional)
// 14_ Compra con Tarjeta (Bloqueado por punto 13)
// 15_ Dibujos con caracteres de los productos [LISTO]


// Requisitos:
// 1_ Ciclos
// 2_ Condicionales
// 3_ Arreglos
// 4_ Matrices
// 5_ Funciones
// 6_ Recursividad (opcional)
// 7_ Video de presenracion 15' - 30'