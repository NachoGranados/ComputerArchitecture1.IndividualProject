<pre>
Este generador de gráficos, fue diseñado, codificado y probado en el sistema operativo Ubuntu 20.04 de Linux.

Para el desarrollo del proyecto en cuestión, se utilizaron las siguientes herramientas que permitieron compilar, ejecutar y revisar el correcto funcionamiento de aplicación desarrollada:
	• SASM: corresponde a un IDE basado en el ISA de x86 (32 o 64 bits) que permite compilar, ejecutar y probar código en
	  ensamblador.
	• Visual Studio Code: este entorno de desarrollo se configuró para que fuera capaz de ejecutar el código alto nivel de 
	  Python.

Para compilar y ejecutar el proyecto actual, debe realizar los siguientes pasos:
	1- Abrir una nueva terminal.
	2- Actualizar el sistema a través del siguiente comando: 
		sudo apt update
	3- Instalar el paquete de NASM a través del siguiente comando:
		sudo apt install nasm gdb
	4- Instalar el IDE de SASM por medio de las siguientes opciones:
		a. Descargar la aplicación desde la tienda oficial de Ubuntu (Ubuntu Software).
		b. Descargar la aplicación a través del siguiente comando:
			sudo apt install sasm
	5- Dentro del IDE de SASM, debe abrir la pestaña de "Settings", luego la pestaña de "Build". Ahí, debe seleccionar la 
	   opción x64. Posteriormente, presione el botón de "Apply" y cierre la ventana emergente.
	6- Dentro del IDE de SASM, debe abrir el archivo "graphicsGeneration.asm" y seguidamente presione el botón de "Build and 
	   run". Este generará el archivo "output.txt", necesario para el lenguaje de alto nivel.
	7- Instalar el IDE de Visual Studio Code por medio de las siguientes opciones:
		a. Descargar la aplicación desde la tienda oficial de Ubuntu (Ubuntu Software).
	b. Descargar la aplicación a través del siguiente comando:
		sudo snap install --classic code
	c. Descargar la aplicación a través de los siguientes comandos:
		sudo apt install software-properties-common apt-transport-https wget
		wget –q https://packages.microsoft.com/key/microsoft.asc -O- | sudo apt-key add -
		sudo add-apt-repository “deb[arch=amd64] https://packages.microsoft.com/repos/vscode stable main”
		sudo apt install code
	8- Dentro del IDE de Visual Studio Code, debe descargar la extensión de Python para poder compilar y ejecutar dicho 
	   lenguaje de alto nivel.
	9- Dentro del IDE de Visual Studio Code, debe abrir la carpeta descomprimida del proyecto actual.
	10- Dentro del IDE de Visual Studio Code, debe abrir el archivo "graphicsGeneration.py" y seguidamente presione el botón 
	    de "Run Python File". Esto generará el archivo "Result.png", el cual mostrará la imagen final del texto digitado.
<pre>
