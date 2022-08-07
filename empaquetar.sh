!#/bin/bash

# Crear nuevo registro y mover el anterior
cd /opt/fbkfreeze/
mv -v logfreeze0.txt logfreeze1.txt | tee -a logfreeze0.txt

# Comenzar nuevo registro con fecha y hora
date | tee -a logfreeze0.txt

echo "----- Creando archivador tar -----" | tee -a logfreeze0.txt

# Crear archivador de usuario
tar -v -c -f estudiante.tar -C /home estudiante/ | tee -a logfreeze0.txt

# Fin
echo "========== FIN ==========" | tee -a logfreeze0.txt
