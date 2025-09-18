#!/bin/bash -xv
# Redefine o mapa do teclado para ABNT
localectl set-keymap br-abnt
# Instalar o git
apt install git -y
# Criar diretorio shell e entrar nele
mkdir /root/shell && cd /root/shell
# Baixar shell do Github
git clone https://github.com/marsamogin/ubuntu
# Mover arquivos para diretorio shell
mv /root/shell/ubuntu/*.sh .
# Adicionar permissao de execuçao aos aqruivos
chmod +x *.sh
# Remove diretorio baixado
rm -rf /root/shell/ubuntu
