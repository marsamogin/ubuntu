#!/bin/bash
#
# Criar o Volume utilizando a partição criada anteriormente.
sudo pvcreate /dev/sda4
#
# Extende o volume do disco atual
sudo vgextend ubuntu-vg /dev/sda4
#
# Adiciona o espaco
sudo lvextend -l +100%FREE /dev/mapper/ubuntu--vg-ubuntu--lv
#
# Faz o resize em real-time
sudo xfs_growfs /dev/mapper/ubuntu--vg-ubuntu--lv
#
# Confere o novo tamanho no disco
sudo df -h
