#!/bin/bash
##########################################
##########################################
#echo "Configurar acesso usuario ludgero"
#./create-user-ubuntu-ludgero.sh
##########################################
echo "Configurar acesso usuario marcio"
./create-user-ubuntu-marcio.sh
##########################################
echo "Configurar acesso usuario keite"
./create-user-ubuntu-keite.sh
##########################################
#echo "Configurar acesso usuario otoniel"
#./create-user-ubuntu-otoniel.sh
##########################################
echo "Configurar acesso usuario danfeijo"
./create-user-ubuntu-danfeijo.sh
##########################################
echo "Configurar acesso usuario dti"
./create-user-ubuntu-dti.sh
##########################################
# Capturar o nome da maquina
hostname=$(hostname)
echo "Copiar as chaves privadas para a maquina Linux auxiliar"
scp *@$hostname marcio@143.106.108.5:/tmp
rm -rf *@$hostname
./config-ubuntu.sh
