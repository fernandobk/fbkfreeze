#!/bin/bash
hoy=$(date +%Y-%m-%d)
read username < username.conf
read today < today.conf
read status < status.conf

case $1 in
	"-a")
		echo "Congelado" > status.conf
		;;
	"-d")
		echo "Descongelado" > status.conf
		;;
	"-u")
		echo "Ingrese el nombre del usuario a operar:\n"
		read _u
		echo $_u > username.conf
		echo "Se guardó el nombre de usuario:" $_u
		;;
	"-v")
		echo $status
		;;
	"-e")
		empaquetar
		;;
	
	*)
		echo "fbkfreeze - Sistema de congelado de carpeta de usuario para debian"
		echo ""
		echo "Opciones: "
		echo "	-a	Activa el sistema."
		echo "	-d	Desactiva el sistema."
		echo "	-u	Establecer nombre de usuario."
		echo "	-v	Ver el estado actual del equipo."
		echo "	-e	Crear o recrea un paquete de la carpeta /home."
		echo "	-r	Restablecer el sistema (Usar con Cron)."
esac

function empaquetar(){
	
	if [$username == ""];then
		echo "Falta nombre de usuario:"
		ls /home
		echo "Establecer con -u"
		return
	
	else
		echo "Nombre de usuario registrado:" $username
		read -p "Presiona Enter para continuar..."

		tar -v -c -f "/home/$usuario.tar" -C /home $usuario
	fi
}

function restablecer(){
	
	if ["$today" != "$hoy" && $status=="Congelado"]; then
		rm -R -f -v /home/$username
		tar -v -x -f "/home/$username.tar" -C /home

		echo $hoy > today.conf
	fi
}