s #!/bin/bash -xv
# Redefine o mapa do teclado para ABNT
localectl set-locale LANG=pt_BR.UTF-8
dpkg-reconfigure keyboard-configuration
# Adicionar permissao de execuçao aos demais arquivos
chmod +x *.sh
./create-users-ubuntu.sh
