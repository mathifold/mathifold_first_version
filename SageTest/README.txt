############## CONTENIDO #################
Esta prueba contiene los siguientes scripts:
	- hipocicloide.sage: genera una animacion de una hipocicloide obtenida
al girar una circunferencia de radio r dentro de una de radio R,
con r/R irracional. Debido a la gran cantidad de imagenes que necesitan ser
generadas, su ejecucion puede llevar varios minutos. Por ello, para comprobar
la correcta instalacion de SAGE en la maquina, se recomienda ejecutar
pruebaSage.sage.
	- pruebaSage.sage: dibuja sen(x) para -pi <= x <= pi. Permite
comprobar la correcta instalacion de la libreria SAGE.

############## DESCARGA #################
Para descargar la libreria SAGE, utilicense las opciones disponibles en el link:
	http://www.sagemath.org/index.html

############## EJECUCION EN ENTORNO SAGE #################
SAGE permite usar dos entornos distintos:
	- Notebook: lanza un editor online que permite visualizar en linea
dibujos y LaTeX generado. Lo mas recomendado para ejecucion interactiva. Se
ejecuta invocando
	sage -notebook

	- Linea de comandos: abre un interprete de SAGE por linea de comandos.
El mas recomendable para ejecutar scripts ya implementados. Puede llamarse:
		* sage: abre el interprete.
		* sage <nombre_fichero.sage>: ejecuta el script en
	<nombre_fichero.sage> y se cierra al finalizar.

############## EJEMPLO DE EJECUCION DE LOS SCRIPTS #################
	- hipocicloide.sage: sage hipocicloide.sage
	+ pruebaSage.sage: sage pruebaSage.sage
