#!/bin/bash
echo "Criar usuario dti e diretorio home"
useradd -m dti
echo "Incluir dti no grupo sudo"
usermod -aG sudo dti
echo "Criar pasta .ssh no /home/dti"
mkdir /home/dti/.ssh
echo "Criar arquivo de autorizacao de acesso no /home/dti/.ssh"
touch /home/dti/.ssh/authorized_keys
echo "Mudar proprietario do /home/dti"
chown -R dti:dti /home/dti/.ssh
echo "Mudar permissoes e propriedade dos diretorios e arquivos criados dentro do /home/dti"
chmod 700 /home/dti/.ssh
chmod 600 /home/dti/.ssh/authorized_keys
chown -R dti:dti /home/dti
echo "Definir a SHELL do usuario"
sudo chsh -s /bin/bash dti
echo "Criar senha padrao para dti"
passwd dti
