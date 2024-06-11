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
    
	//Usuarios Precargados
	usuarioItem[0] <- "admin";
    contrasenaItem[0] <- "1234";
	
	usuarioItem[1] <- "user";
    contrasenaItem[1] <- "4321";
    
	
    logueado <- Falso;
    total <- 0;
    descuento <- 0.1; // 10% de descuento para usuarios logueados
    tiempoEspera <- 10; // Tiempo de espera en minutos base
	
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
	
	Si extraCarne = 'S' o extraCarne = 's' Entonces
		total <- total + 500;
		tiempoEspera <- tiempoEspera + 3;
		// en el caso de que elija hamburguesa doble, ver que se le puede informar al usuario
	FinSi
	
	Escribir "¿Desea papas fritas? (S/N) --> $250:";
	Leer papas;
	Si papas = 'S' o papas = 's' Entonces
		total <- total + 250;
		tiempoEspera <- tiempoEspera + 2;
		// añadir tipos de papas
	FinSi
	
	Escribir "¿Desea gaseosa? (S/N) --> $1000:";
	Leer gaseosa;
	Si gaseosa = 'S' o gaseosa = 's' Entonces
		total <- total + 1000;
		tiempoEspera <- tiempoEspera + 1;
		// añadir tipos de gaseosas
	FinSi
	
	// Generar y mostrar ticket
	Escribir "------- Ticket de Compra -------";
	Escribir " ", nombres[tipo], ": $ ", ConvertirATexto(precios[tipo]);
	
	Si extraCarne = 'S' o extraCarne = 's' Entonces
		Escribir " + Carne extra: $ 500";
	FinSi
	
	Si papas = 'S' o papas = 's' Entonces
		Escribir " + Papas fritas: $ 250";
	FinSi
	
	Si gaseosa = 'S' o gaseosa = 's' Entonces
		Escribir " + Gaseosa: $ 1000";
	FinSi
	
	// Aplicar descuento si está logueado
	Si logueado = Verdadero Entonces		
		total <- total * (1 - descuento);		
		Escribir "  + Descuento del 10% => Total: $ ", ConvertirATexto(total);

	SiNo
		Escribir " ...............................";
		Escribir " Total: $ ", ConvertirATexto(total);
	FinSi
	
	Escribir " Tiempo de espera: ", ConvertirATexto(tiempoEspera), " minutos";
	Escribir "--------------------------------";	
FinProceso


// Tareas a realizar
// 1_ Crear un bucle en el caso que se elija mal la hamburguesa [LISTO]
// 2_ Crear un array con clientes [LISTO]
// 3_ Ver la lógica en el adicional de extra carne cuando se eligió hamburguesa doble
// 4_ Añadir lógica de precios en tipos de papas
// 5_ Añadir lógica de precios en tipos de gaseosa
// 6_ Refactorizar el código --> Final [INICIADO]
// 7_ Se podría crear una función para crear usuario
// 8_ Realizar un bucle para productos adicionales al introducir un dato no válido
