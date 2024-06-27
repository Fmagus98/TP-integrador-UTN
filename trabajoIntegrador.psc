//funcion para crear usuario
Funcion registrausuario(id,nombre,i,contrasenaLogin)
	
	id[i] <- i;
	
	Escribir "                  	=========================";
	Escribir "                         Registrarse";
	Escribir "                  	=========================";
	Escribir " ";
	
	Escribir "Ingrese el nombre de usuario: ";
	Leer nombre[i];
	Escribir "Ingrese la contraseña: ";
	Leer contrasenaLogin[i];
	
	Limpiar Pantalla;
	
	Escribir " ";
	Escribir "                  	-------------------------";
	Escribir "                      ¡Registro exitoso!";
	Escribir "                  	-------------------------";
	
	Esperar 1.75 Segundos;
	
	
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
	
	Escribir "                  	=========================";
	Escribir "                     Bienvenido a BeeFood  ";
	Escribir "                  	=========================";
	Escribir " ";
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
		Escribir "Elige la opción deseada (1-2): ";
		Escribir "1. Registrarse";
		Escribir "2. Iniciar sesión";
		Leer op;
	Hasta Que op ="1"o op ="2"
	Si op = "1" Entonces
		k<- k+1;
		
		Limpiar Pantalla;
		registrausuario(id,nombre,k,contrasenaLogin);
		cont <- cont+1;
	FinSi
	
	Limpiar Pantalla;
	
	// Proceso de Login
	Escribir "                  	=========================";
	Escribir "                        Iniciar sesión";
	Escribir "                  	=========================";
	Escribir " ";
	Escribir "Ingrese el nombre de usuario: ";
	Leer usuario;
	Escribir "Ingrese la contraseña: ";
	Leer contrasena;
	n <- 0;
	logueado <- Falso;
	
	Limpiar Pantalla;
	
	
	Para z <- 0 Hasta 9 Con Paso 1 Hacer
		Si usuario = nombre[z] y contrasena = contrasenaLogin[z] Entonces
			
			Escribir " ";
			Escribir "                  	-------------------------";
			Escribir "                  ¡Inicio de sesión exitoso!";
			Escribir "                  	-------------------------";
			
			Esperar 1.75 Segundos;
			
			logueado <- Verdadero;
			z <- 9;
		FinSi
	FinPara
	
	Si logueado = Falso Entonces 
		Escribir " ";
		Escribir "                  	-------------------------";
		Escribir "                ¡Error en el inicio de sesión!";
		Escribir "                  	-------------------------";
		Escribir " ";
		Escribir "            No se aplicará el descuento del 10%.";
		
		Esperar 4.8 Segundos;
		
	FinSi
	
	Limpiar Pantalla;
	
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
	Escribir "                  	=========================";
	Escribir "                            Menú  ";
	Escribir "                  	=========================";
	Escribir " ";
	Para i <- 0 Hasta 2 Hacer
		Escribir nroItem[i], nombres[i], " - $", precios[i];
	FinPara
	Escribir " ";
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
		Escribir " ";
		Escribir "¿Desea carne extra? (S/N) --> $500: ";
		Leer extraCarne;		
		Si extraCarne = "S" o extraCarne = "s" entonces //Agregue esta condicional en todas las opciones adicionales porque sino los suma aunque ingrese una letra cualquiera.
			total <- total + 500; //esto estaba en el ticket, pero lo reposicione aqui para que vaya sumandose al total, asi no hay error al ingresar un monto en la linea 250.(borrar comentario)
			tiempoEspera <- tiempoEspera + 3;
		FinSi
	Hasta Que extraCarne = "S" o extraCarne = "s" o extraCarne = 'N' o extraCarne = 'n'; 
	
	Definir papasExtra Como Caracter;
	Definir costoPapas Como Entero;
	Definir tipoPapas Como Caracter;
	papasExtra <- "";
	costoPapas <- 0;
	tipoPapas <- "";
	
	Repetir
		Escribir "¿Desea papas fritas? (S/N): ";
		Leer papas;
		Si papas = 'S' o papas ='s' Entonces 
			Repetir
				Escribir "Seleccione el tipo de papas:";
				Escribir "1. Papas pequeñas --> $250";
				Escribir "2. Papas medianas --> $300";
				Escribir "3. Mega papas --> $400";
				Leer tipopapas;
				Si tipopapas = "1" Entonces
					total <- total + 250;
					costoPapas <- 250;
					tiempoEspera <- tiempoEspera + 1;
					papasExtra <- "Papas pequeñas";
				SiNo
					Si tipopapas = "2" Entonces
						total <- total + 300;
						costoPapas <- 300;
						tiempoEspera <- tiempoEspera + 1;
						papasExtra <- "Papas medianas";
					SiNo
						Si tipopapas = "3" Entonces
							total <- total + 400;
							costoPapas <- 400;
							tiempoEspera <- tiempoEspera + 1;
							papasExtra <- "Mega papas";
						SiNo
							Escribir "Selección inválida. Intente nuevamente.";
						FinSi
					FinSi
				FinSi
			Hasta Que tipopapas = "1" o tipopapas = "2" o tipopapas = "3"
			//total <- total + 250; //esto estaba en el ticket.(borrar comentario)
			tiempoEspera <- tiempoEspera + 1;
		FinSi
	Hasta Que papas = 'S' o papas ='s' o papas = 'N' o papas = 'n';
	
	Definir gaseosaExtra Como Caracter;
	Definir costoGaseosa Como Entero;
	Definir tipoGaseosa Como Caracter;
	
	gaseosaExtra <- "";
	costoGaseosa <- 0;
	tipoGaseosa <- "";
	
	Repetir
		Escribir "¿Desea gaseosa? (S/N)";
		Leer gaseosa;
		Si gaseosa = 'S' o gaseosa = 's' Entonces
			Repetir
                Escribir "Seleccione el tipo de gaseosa:";
                Escribir "1. Gaseosa chica --> $1000";
                Escribir "2. Gaseosa mediana --> $1200";
                Escribir "3. Gaseosa grande --> $1400";
                Leer tipoGaseosa;
                Si tipoGaseosa = "1" Entonces
					costoGaseosa <- 1000;
                    total <- total + costoGaseosa;
					gaseosaExtra <- "Gaseosa Chica";
                    tiempoEspera <- tiempoEspera + 0;
                SiNo
                    Si tipoGaseosa = "2" Entonces
						costoGaseosa <- 1200;
                        total <- total + costoGaseosa;
						gaseosaExtra <- "Gaseosa Mediana";
                        tiempoEspera <- tiempoEspera + 0;
                    SiNo
                        Si tipoGaseosa = "3" Entonces
                            costoGaseosa <- 1400;
							total <- total + costoGaseosa;
							gaseosaExtra <- "Gaseosa Grande";
                            tiempoEspera <- tiempoEspera + 0;
                        SiNo
                            Escribir "Selección inválida. Intente nuevamente.";
                        FinSi
                    FinSi
                FinSi
            Hasta Que tipoGaseosa = "1" o tipoGaseosa = "2" o tipoGaseosa = "3"
		FinSi
	Hasta Que gaseosa = 'S' o gaseosa = 's' o gaseosa = 'N' o gaseosa = 'n';
	
	Si logueado Entonces
        total <- total * (1 - 0.1);  //esto estaba en el subproceso del historial de compras. El error que generaba era que le hacia el descuento al descuento.(borrar comentario)
    FinSi
	
	Limpiar Pantalla;
	
	// Selección de la forma de pago
	Escribir "                  	=========================";
	Escribir "                        Forma de pago  ";
	Escribir "                  	=========================";
	Escribir " ";
	
	Repetir 
		Escribir "Elige la opción deseada (1-2): ";
		Escribir "1. Efectivo";
		Escribir "2. Débito";
		Leer formaPago;
	Hasta Que formaPago <> "1" o formaPago <> "2" 
	
	Si formaPago = "1" Entonces
		Escribir " ";
		Escribir "             **Usted eligió pagar en efectivo**";
		Escribir " ";
		Repetir
			Escribir "Ingrese el monto con el que va a pagar: "; //Aqui antes me aceptaba cualquier valor mayor o igual al precio base de la hamburguesa, ya que las opciones adicionales empezaban a sumar recien en el subproceso.(borrar comentario)
			Leer montoPago;
		Hasta Que montoPago >= total 
		
		vuelto <- montoPago - total;  //Aqui habia un "Si" estaba logeado, hacia un calculo, y si no estaba logeado hacia otro calculo. Esto lo resumi en uno solo porque se soluciona en la linea 227. Antes te calculaba un vuelto del descuento al descuento (que quilombo) (borrar comentario)
		
		Limpiar Pantalla;
		
		// Generar ticket y guardar historial
		GenerarTicket_HistorialdeCompras(vuelto, usuario, tipo, extraCarne, papas, papasExtra, costoPapas, gaseosa, costoGaseosa, gaseosaExtra, total, tiempoEspera, logueado, nombres, precios, indiceHistorial, historial);
		
		indiceHistorial <- indiceHistorial + 1; 
		
	SiNo 
		Si formaPago = "2" Entonces
			
			Escribir " ";
			Escribir "             **Usted eligió pagar con débito**";
			Escribir " ";
			Esperar 2 Segundos;
			
			vuelto<-0;  // No hay vuelto en pagos con débito, por lo tanto, se inicializa 'vuelto' a 0
			// Esto es necesario para evitar errores en el subproceso 'GenerarTicket_HistorialdeCompras', 
			// que espera que 'vuelto' siempre tenga un valor.
			
			Limpiar Pantalla;
			
			// Generar ticket y guardar historial
			GenerarTicket_HistorialdeCompras(vuelto, usuario, tipo, extraCarne, papas, papasExtra, costoPapas, gaseosa, costoGaseosa, gaseosaExtra, total, tiempoEspera, logueado, nombres, precios, indiceHistorial, historial);
			
			indiceHistorial <- indiceHistorial + 1;
			
		FinSi 
	FinSi
	
	// Mostramos el historial de compras si el usuario lo desea
	Escribir "";
	Escribir "";
	Escribir "¿Desea ver el historial de compras? (S/N): ";
	Leer verHistorial;
	Escribir "";
	Si verHistorial = 'S' o verHistorial = 's' Entonces
		Escribir "------- Historial de Compras -------";
		Para i <- 0 Hasta indiceHistorial - 1 Hacer
			Escribir historial[i];
		FinPara
		Escribir "-------------------------------------";
	FinSi
FinProceso

Subproceso GenerarTicket_HistorialdeCompras(vuelto, usuario, tipo, extraCarne, papas, papasExtra, costoPapas, gaseosa, costoGaseosa, gaseosaExtra, total, tiempoEspera, logueado, nombres, precios, indiceHistorial, historial)
	
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
	Escribir "------------------------------------";
    Escribir "--------- Ticket de Compra ---------";
    Escribir "---------- Número: ", numeroTicket, " -------------";
    Escribir "------------------------------------";
    Escribir "Nombre de usuario: ", usuario;
    Escribir "------------------------------------";
    Escribir "";
    Escribir "Tu Pedido: ";
    Escribir " ", nombres[tipo], ": $ ", ConvertirATexto(precios[tipo]);
    
    Si extraCarne = 'S' o extraCarne = 's' Entonces
        Escribir " + Carne extra: $ 500";
    FinSi
    
    Si papas = 'S' o papas = 's' Entonces
		Escribir " ", papasExtra;
        Escribir " ===> $ :", ConvertirATexto(costoPapas);
    FinSi
    
    Si gaseosa = 'S' o gaseosa = 's' Entonces
		Escribir " ", gaseosaExtra;
        Escribir " ===> $ :", ConvertirATexto(costoGaseosa);
    FinSi
    
    Si logueado Entonces
       
        Escribir " + Descuento del 10%";
		Escribir " ...................................";
    SiNo
        Escribir " ...................................";
    FinSi
    
    Escribir " => TOTAL: $ ", ConvertirATexto(total);
	
	// Mostrar vuelto si es en efectivo
	Si vuelto > 0 Entonces
		Escribir "Su vuelto es: $", ConvertirATexto(vuelto);
	FinSi
	
	
    Escribir "";
    Escribir usuario, " Tu tiempo de espera es de: ";
    Escribir ConvertirATexto(tiempoEspera), " MINUTOS";
    Escribir "";
    Escribir "Te llamaremos por tu nombre y número";
    Escribir "de ticket cuando el pedido este listo";
    Escribir "";
    Escribir "------------------------------------";
    Escribir "  **Muchas Gracias Por Tu Compra**";
    Escribir "------------------------------------";
	
	
	
	//----------------------------------- Historial de compras del usuario -------------------------------------------
	
	// Guardamos la compra en el historial
    Definir compra como cadena;
	
    compra <- nombres[tipo];
	compra <- concatenar(compra,": $");
	compra <- Concatenar(compra,ConvertirATexto(precios[tipo]));
    
    Si extraCarne = 'S' o extraCarne = 's' Entonces
        compra <- compra;
		compra <- concatenar(compra," + Carne extra: $500 ");
    FinSi
    
	//Agregar Logica de eleccion de extra papas
    Si papas = 'S' o papas = 's' Entonces
        compra <- compra;
		Definir valorPapas Como Caracter;
		valorPapas <- ConvertirATexto(costoPapas);
		valorPapas <- Concatenar(" : $ ",valorPapas);
		compra <- concatenar(compra, papasExtra);
		compra <- Concatenar(compra, valorPapas);
    FinSi
    
	//Agregar Logica eleccion Gaseosa
    Si gaseosa = 'S' o gaseosa = 's' Entonces
        compra <- compra;
		compra <- concatenar( compra," + Gaseosa: $ ");
		Definir valorGaseosa Como Caracter;
		valorGaseosa <- ConvertirATexto(costoGaseosa);
		compra <- Concatenar(compra, valorGaseosa);
    FinSi
    
    Si logueado Entonces
        compra <- compra;
		compra <- concatenar(compra," + Descuento del 10% => Total: $");
		compra <- Concatenar(compra, ConvertirATexto(total));
    SiNo
        compra <- compra;
		compra <- concatenar(compra," => Total: $");
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
// 3_ Ver la lógica en el adicional de extra carne cuando se eligió hamburguesa doble [LISTO]
// 4_ Añadir lógica de precios en tipos de papas [LISTO]
// 5_ Añadir lógica de precios en tipos de gaseosa [LISTO]
// 6_ Refactorizar el código --> Final [INICIADO]
// 7_ Se podría crear una función para crear usuario [LISTO]
// 8_ Realizar un bucle para productos adicionales al introducir un dato no válido [LISTO]
// 9_ Crear función de la compra de producto [LISTO]
// 10_ Añadir n° de ticket en cada compra (Bloqueado por punto 9) [LISTO]
// 11_ Historial de compra del usuario. [LISTO]
// 12_ Informar al usuario el pedido --> tiempo de espera (utilizar función esperar) [LISTO]
// 13_ Crear lógica de compra en pesos(opcional) [LISTO]


// Requisitos:
// 1_ Ciclos
// 2_ Condicionales
// 3_ Arreglos
// 4_ Matrices
// 5_ Funciones
// 6_ Recursividad (opcional)
// 7_ Video de presenracion 15' - 30'

