#!/bin/bash
echo "Desativar o Firewall:"
sudo systemctl disable ufw && sudo systemctl stop ufw
echo "Atualizar os repositórios e pacotes:"
sudo apt update -y && sudo apt upgrade -y
echo "Instalar os pacotes que mais usamos:"
sudo apt install mailutils build-essential rsync bind9-utils cmake automake net-tools bacula-client postfix s-nail zip chrony lynx lsof -y
echo "Ir ate a psta "/root" e baixar os scripts usados por nos do Github:"
cd /root
git clone https://github.com/marsamogin/linux
echo "Copiar arquivos prontos de config. para destino"
mv -f ./linux/chrony.conf /etc
mv -f ./linux/bacula-fd.conf /etc/bacula
mv -f ./linux/*.sh /root/shell
mv -f /root/shell/main.cf-ubuntu /etc/postfix/main.cf
chmod +x /root/shell/*.sh
echo "Definir nome do host no arquivo do Bacula"
sed -i "s/trocar/$(hostname)/g" /etc/bacula/bacula-fd.conf
echo "Definir o nome do host no arquivo do Postfix"
sed -i "s/trocar/$(hostname)/g" /etc/postfix/main.cf
echo "Habilitar os servicos postfix e bacula da maquina"
systemctl enable postfix && systemctl enable bacula-fd
echo "Ajustar a configuracao do sshd_config"
sed -i "s/#PubkeyAuthentication yes/PubkeyAuthentication yes/g" /etc/ssh/sshd_config
sed -i "s/#PasswordAuthentication yes/PasswordAuthentication no/g" /etc/ssh/sshd_config
echo "Fim do script"
