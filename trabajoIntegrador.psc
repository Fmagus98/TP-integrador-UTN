//funcion para crear usuario
Funcion registrausuario(id,nombre,i,contrasenaLogin)
	id[i] <- i;
	Escribir "Ingresa el nombre del usuario";
	Leer nombre[i];
	Escribir "Ingresa la contraseña";
	Leer contrasenaLogin[i];
	Escribir "Registro exitoso";
FinFuncion

Proceso trabajoIntegrador
	Definir usuario, contrasena Como Caracter;
	Definir usuarioCorrecto, contrasenaCorrecta Como Caracter;
	Definir usuarioItem, contrasenaItem Como Caracter;
	Dimension usuarioItem[2],contrasenaItem[2];
	Definir logueado Como Logico;
	//funcion para crear usuario
	Definir nombre,contrasenaLogin Como Caracter;
	Definir id Como Entero;
	Definir z Como Entero;
	Definir cont Como Entero;
	Definir op Como Caracter;
	Definir hamburguesa Como Real;
	Definir nroItem, nombres Como Caracter;
	Definir precios, tiempos Como Real;
	Definir i, tipo, n, k Como Entero;
	Dimension nroItem[3], nombres[3], precios[3], tiempos[3];
	
	Definir tipoHamburguesa, extraCarne, papas, gaseosa Como Caracter;
	Definir total, descuento, tiempoEspera Como Real;
	Definir ticket Como Caracter;
	Definir numeroTicket Como Entero;
	
	//Definimos las variables para utilizar en el historial de compras del usuario
	Definir historial Como Cadena;
	Dimension historial[100];
	Definir indiceHistorial Como Entero;
	//Aqui iba " Definir compra como cadena;" pero lo puse en el subproceso
	Definir verHistorial Como Caracter;
	
	// Variables para el pago
	Definir formaPago Como Caracter;												
	Definir montoPago, vuelto Como Real;
	
	logueado <- Falso;
	total <- 0;
	descuento <- 0.1; // 10% de descuento para usuarios logueados
	tiempoEspera <- 10; // Tiempo de espera en minutos base
	
	//Inicializamos el historial 
	indiceHistorial <- 0;
	
	//Mostrar Cartel Bienvenida
	Escribir CartelBienvenida;
	Esperar 2 segundos;
	Limpiar Pantalla;
	k <- 1;
	cont <- 0;
	Escribir "Bienvenido al registro de usuario de comidas rapidas";
	Dimension id[10];
	Dimension nombre[10];
	Dimension contrasenaLogin[10];
	
	//Usuarios Precargados
	
	Para z<-0 Hasta 9 Con Paso 1 Hacer
		id[z] <- z;
		nombre[z]<- "admin";
		contrasenaLogin[z] <- "1234";
	FinPara
	
	op <- "";
	
	Repetir
		Escribir "elige la opcion deseada";
		Escribir "1. Registrar";
		Escribir "2. Iniciar sesion";
		Leer op;
	Hasta Que op ="1"o op ="2"
	Si op = "1" Entonces
		k<- k+1;
		registrausuario(id,nombre,k,contrasenaLogin);
		cont <- cont+1;
	FinSi
	
	
	// Proceso de Login
	Escribir "Bienvenido a la Tienda de Comidas Rápidas";
	Escribir "Ingrese su nombre de usuario: ";
	Leer usuario;
	Escribir "Ingrese su contraseña: ";
	Leer contrasena;
	n <- 0;
	logueado <- Falso;
	
	Limpiar Pantalla;
	
	
	Para z <- 0 Hasta 9 Con Paso 1 Hacer
		Si usuario = nombre[z] y contrasena = contrasenaLogin[z] Entonces
			Escribir "Login Exitoso!";
			logueado <- Verdadero;
			z <- 9;
	FinPara
	
	Si logueado = Falso Entonces 
		Escribir "No tenes el 10% de descuento";
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
	Repetir
		Escribir "¿Desea carne extra? (S/N) --> $500: ";
		Leer extraCarne;
	Hasta Que extraCarne = "S" o extraCarne = "s" o extraCarne = 'N' o extraCarne = 'n'; 
	
	Repetir
		Escribir "¿Desea papas fritas? (S/N) --> $250:";
		Leer papas;
	Hasta Que papas = 'S' o papas ='s' o papas = 'N' o papas = 'n';
	
	Repetir
		Escribir "¿Desea gaseosa? (S/N)";
		Leer gaseosa;
	Hasta Que gaseosa = 'S' o gaseosa = 's' o gaseosa = 'N' o gaseosa = 'n';
	
	
	Limpiar Pantalla;
	
	// Selección de la forma de pago
	Repetir 
		Escribir "Seleccione la forma de pago(indique el número):";
		Escribir "1_ Efectivo";
		Escribir "2_ Debito";
		Leer formaPago;
	Hasta Que formaPago <> "1" o formaPago <> "2" 
	
	Si formaPago = "1" Entonces
		Repetir
			Escribir "Ingrese el monto con el que va a pagar: ";
			Leer montoPago;
		Hasta Que montoPago >= total 
		Si logueado Entonces
			vuelto <- montoPago - (total- (total*0.1));
		SiNo
			vuelto <- montoPago - total;
		FinSi
		Limpiar Pantalla;
		// Generar ticket y guardar historial
		GenerarTicket_HistorialdeCompras(vuelto, usuario, tipo, extraCarne, papas, gaseosa, total, tiempoEspera, logueado, nombres, precios, indiceHistorial, historial);
		indiceHistorial <- indiceHistorial + 1; // ¯\_(°_°)_/¯
	SiNo 
		Si formaPago = "2" Entonces
			vuelto<-0;  // No hay vuelto en pagos con débito, por lo tanto, se inicializa 'vuelto' a 0
			// Esto es necesario para evitar errores en el subproceso 'GenerarTicket_HistorialdeCompras', 
			// que espera que 'vuelto' siempre tenga un valor
		FinSi 
		
	FinSi
	Limpiar Pantalla;
	
	// Generar ticket y guardar historial
	
	GenerarTicket_HistorialdeCompras(vuelto, usuario, tipo, extraCarne, papas, gaseosa, total, tiempoEspera, logueado, nombres, precios, indiceHistorial, historial);
	
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

Subproceso GenerarTicket_HistorialdeCompras(vuelto, usuario, tipo, extraCarne, papas, gaseosa, total, tiempoEspera, logueado, nombres, precios, indiceHistorial, historial)
	
    Definir numeroTicket Como Entero;
    numeroTicket <- azar(1000);
	
	Escribir "";
	Escribir "";
	Escribir CartelHamburguesa;
	Escribir "";
	Escribir "";
	
	Esperar 3 Segundos;
	
	Limpiar Pantalla;
    
    Escribir "";
    Escribir "";
    Escribir "------- Ticket de Compra -------";
    Escribir "-------- Numero: ", numeroTicket, " -----------";
    Escribir "--------------------------------";
    Escribir "Nombre de usuario: ", usuario;
    Escribir "--------------------------------";
    Escribir "";
    Escribir "Tu Pedido: ";
    Escribir " ", nombres[tipo], ": $ ", ConvertirATexto(precios[tipo]);
    
    Si extraCarne = 'S' o extraCarne = 's' Entonces
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
    
    Si logueado Entonces
        total <- total * (1 - 0.1);
        Escribir "  + Descuento del 10% => Total:";
    SiNo
        Escribir " ...............................";
    FinSi
    
    Escribir " Total: $ ", ConvertirATexto(total);
	
	// Mostrar vuelto si es en efectivo
	Si vuelto > 0 Entonces
		Escribir "Su vuelto es: $", ConvertirATexto(vuelto);
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
    Definir compra como cadena;
	
    compra <- nombres[tipo];
	compra <- concatenar(compra,": $");
	compra <- Concatenar(compra,ConvertirATexto(precios[tipo]));
    
    Si extraCarne = 'S' o extraCarne = 's' Entonces
        compra <- compra;
		compra <- concatenar(compra," + Carne extra: $500");
    FinSi
    
    Si papas = 'S' o papas = 's' Entonces
        compra <- compra;
		compra <- concatenar(compra," + Papas fritas: $250");
    FinSi
    
    Si gaseosa = 'S' o gaseosa = 's' Entonces
        compra <- compra;
		compra <- concatenar( compra," + Gaseosa: $1000");
    FinSi
    
    Si logueado Entonces
        total <- total * (1 - 0.1);
        compra <- compra;
		compra <- concatenar(compra," + Descuento del 10% => Total: $");
		compra <- Concatenar(compra, ConvertirATexto(total));
    SiNo
        compra <- compra;
		compra <- concatenar(compra," ............................... Total: $");
		compra <- Concatenar(compra, ConvertirATexto(total));
    FinSi
    
	// Añadimos la compra al historial
    historial[indiceHistorial] <- compra;
    
FinSubproceso

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
// 8_ Realizar un bucle para productos adicionales al introducir un dato no válido
// 9_ Crear función de la compra de producto
// 10_ Añadir n° de ticket en cada compra (Bloqueado por punto 9) [LISTO]
// 11_ Historial de compra del usuario.
// 12_ Informar al usuario el pedido --> tiempo de espera (utilizar función esperar)
// 13_ Crear lógica de compra en pesos(opcional)
// 14_ Compra con Tarjeta (Bloqueado por punto 13)


// Requisitos:
// 1_ Ciclos
// 2_ Condicionales
// 3_ Arreglos
// 4_ Matrices
// 5_ Funciones
// 6_ Recursividad (opcional)
// 7_ Video de presenracion 15' - 30'

