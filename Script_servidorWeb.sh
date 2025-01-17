#!/bin/bash

echo "atualizando servidor..."

apt update -y
apt upgrade -y 

echo "atualização concluída..."
echo "Instalando aplicativos necessários..."

apt install apache2 -y
apt install unzip -y

echo "Instalação concluída..."
echo "Baixando pacote do site..."

wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip

echo "Download feito..."
echo "Iniciando descompactação..."

unzip main.zip

echo "Movendo arquivos"

cd linux-site-dio-main
cp * -R -v -f /var/www/html/

echo "Fim"
