#!/bin/bash
##########################################
##########################################
#echo "Configurar acesso usuario ludgero"
#/root/shell/./create-user-ubuntu-ludgero.sh
##########################################
echo "Configurar acesso usuario marcio"
/root/shell/./create-user-ubuntu-marcio.sh
##########################################
echo "Configurar acesso usuario keite"
/root/shell/./create-user-ubuntu-keite.sh
##########################################
#echo "Configurar acesso usuario otoniel"
#/root/shell/./create-user-ubuntu-otoniel.sh
##########################################
echo "Configurar acesso usuario danfeijo"
/root/shell/./create-user-ubuntu-danfeijo.sh
##########################################
# Capturar o nome da maquina
hostname=$(hostname)
echo "Copiar as chaves privadas para a maquina Linux auxiliar"
scp *@$hostname marcio@143.106.108.5:/tmp
rm -rf *@$hostname
/root/shell/./config-ubuntu.sh
