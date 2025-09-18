#!/bin/bash
echo "Criar usuario marcio e diretorio home"
useradd -m marcio
echo "Incluir marcio no grupo sudo"
usermod -aG sudo marcio
echo "Criar pasta .ssh no /home/marcio"
mkdir /home/marcio/.ssh
echo "Criar arquivo de autorizacao de acesso no /home/marcio/.ssh"
touch /home/marcio/.ssh/authorized_keys
echo "Mudar proprietario do /home/marcio"
chown -R marcio:marcio /home/marcio/.ssh
echo "Mudar permissoes e propriedade dos diretorios e arquivos criados dentro do /home/marcio"
chmod 700 /home/marcio/.ssh
chmod 600 /home/marcio/.ssh/authorized_keys
chown -R marcio:marcio /home/marcio
echo "Definir a SHELL do usuario"
sudo chsh -s /bin/bash marcio
echo "Criar senha padrao para marcio"
passwd marcio
echo "Criar a chave de acesso de marcio"
ssh-keygen -b 2048 -C "marcio@dti"
echo "Concatenar a chave publica de marcio ao arquivo de autorizacao"
cat marcio@*.pub >> /home/marcio/.ssh/authorized_keys
echo "Remover a chave publica de marcio"
rm -rf marcio@*.pub
