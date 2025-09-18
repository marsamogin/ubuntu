#!/bin/bash
echo "Criar usuario danfeijo e diretorio home"
useradd -m danfeijo
echo "Incluir danfeijo no grupo sudo"
usermod -aG sudo danfeijo
echo "Criar pasta .ssh no /home/danfeijo"
mkdir /home/danfeijo/.ssh
echo "Criar arquivo de autorizacao de acesso no /home/danfeijo/.ssh"
touch /home/danfeijo/.ssh/authorized_keys
echo "Mudar proprietario do /home/danfeijo"
chown -R danfeijo:danfeijo /home/danfeijo/.ssh
echo "Mudar permissoes e propriedade dos diretorios e arquivos criados dentro do /home/danfeijo"
chmod 700 /home/danfeijo/.ssh
chmod 600 /home/danfeijo/.ssh/authorized_keys
chown -R danfeijo:danfeijo /home/danfeijo
echo "Definir a SHELL do usuario"
sudo chsh -s /bin/bash danfeijo
echo "Criar senha padrao para danfeijo"
passwd danfeijo
echo "Criar a chave de acesso de danfeijo"
ssh-keygen -b 2048 -C "danfeijo@dti"
echo "Concatenar a chave publica de danfeijo ao arquivo de autorizacao"
cat danfeijo@*.pub >> /home/danfeijo/.ssh/authorized_keys
echo "Remover a chave publica de danfeijo"
rm -rf danfeijo@*.pub
