#!/bin/bash
echo "El estado actual del sistema es:";
cat estado;
echo "";
echo "Opciones: ";
echo "	-a	Activa el sistema";
echo "	-d	Desactiva el sistema";
echo "	-c	Crear o recrea un paquete de la carpeta /home/$usuario";
echo "	-v	Ver el estado actual del equipo";

case $1 in
	"-a")
		ln -s -f -v "congelado.sh" "atreboot"
		;;
	"-d")
		ln -s -f -v "descongelado.sh" "atreboot"
		;;
	"-c")
		./empaquetar.sh
		;;
	"-v")
		read estado < estado
		echo estado;
	*)
		echo "Argumento incorrecto"
esac

function empaquetar(){
	if [$2 == ""];then
		echo "Falta nombre de usuario";
		return;
	fi

	tar -v -c -f "$2.tar" -C /home "$2/" >> logs/
}
