#!/bin/bash

# Mover último log a log antiguo
# cd /opt/fbkfreeze/
# mv -v .log logs/logreboot1.txt >> logreboot0.txt

echo "========== INICIO ==========" | tee -a logreboot0.txt
date logs/logreboot0.txt

echo "----- Eliminar la carpeta actual del usuario -----" | tee -a logreboot0.txt

# Eliminamos la carpeta home actual y del servidor web
rm -R -f -v /home/estudiante /var/www/html/* | tee -a logreboot0.txt

echo "----- Extraer carpeta congelada en $HOME -----" | tee -a logreboot0.txt

# Extraer la carpeta home congelada
tar -v -x -f estudiante.tar -C /home | tee -a logreboot0.txt

# Fin
echo "========== FIN ==========" | tee -a logreboot0.txt
