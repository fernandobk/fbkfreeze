#!/bin/bash

case $1 in
	"-a")
		echo "Congelado" > status
		;;
	"-d")
		echo "Descongelado" > status
		;;
	"-e")
		empaquetar
		;;
	"-v")
		read estado < status
		echo $estado
		;;
	*)
		echo "fbkfreeze - Sistema de congelado de carpeta de usuario para debian"
		echo "";
		echo "Opciones: ";
		echo "	-a	Activa el sistema.";
		echo "	-d	Desactiva el sistema.";
		echo "	-e	Crear o recrea un paquete de la carpeta /home.";
		echo "	-r	Restablecer el sistema (Usar con Cron)."
		echo "	-u	Establecer nombre de usuario."
		echo "	-v	Ver el estado actual del equipo.";
esac

function empaquetar(){
	read usuario < username
	if [$usuario == ""];then
		echo "Falta nombre de usuario:"
		ls /home
		echo "Establecer con -u nombreusuario"
		return
	
	else
		tar -v -c -f "/home/fbkfreeze.tar" -C /home $usuario
	fi
}

function restablecer(){
	tar -v -x -f "/home/fbkfreeze.tar" -C /home
}