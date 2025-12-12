#!/bin/bash -xv
# Redefine o mapa do teclado para ABNT
localectl set-locale LANG=pt_BR.UTF-8
dpkg-reconfigure keyboard-configuration
# Mover arquivos para diretorio shell
mv /root/shell/ubuntu/*.sh .
mv /root/shell/ubuntu/main.cf-ubuntu .
# Adicionar permissao de execuçao aos aqruivos
chmod +x *.sh
# Remove diretorio baixado
rm -rf /root/shell/ubuntu
