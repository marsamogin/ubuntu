#!/bin/bash
echo "Desativar o Firewall:"
sudo systemctl disable ufw && sudo systemctl stop ufw
echo "Atualizar os repositórios e pacotes:"
sudo apt update -y && sudo apt upgrade -y
echo "Instalar os pacotes que mais usamos:"
sudo apt install build-essential rsync bind9-utils cmake automake net-tools bacula-fd postfix s-nail zip chrony lynx lsof -y
echo "Ir até a pasta "/tmp" e baixar os scripts usados por nos do Github:"
cd /tmp
git clone https://github.com/marsamogin/linux
echo "Copiar arquivos prontos de config. para destino"
mv -f /tmp/linux/chrony.conf /etc
mv -f /tmp/linux/bacula-fd.conf /etc/bacula
mv -f /tmp/linux/main.cf /etc/postfix
mv -f /tmp/linux/*.sh /root/shell
chmod +x /root/shell/*.sh
echo "Definir nome do host no arquivo do Bacula"
sed -i "s/trocar/$(hostname)/g" /etc/bacula/bacula-fd.conf
echo "Habilitar os servicos postfix e bacula da maquina"
systemctl enable postfix && systemctl enable bacula-fd
echo "Ajustar a configuracao do sshd_config"
sed -i "s/#PubkeyAuthentication yes/PubkeyAuthentication yes/g" /etc/ssh/sshd_config
sed -i "s/#PasswordAuthentication yes/PasswordAuthentication no/g" /etc/ssh/sshd_config
echo "Trocar a senha de root"
passwd
echo "Ultima coisa: lembrar de copiar o conteudo do arq. crontab no /tmp"
