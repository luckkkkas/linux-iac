#!/bin/bash

# Atualizando o servidor
apt update -y
apt upgrade -y

# Instalando pacotes necessários
apt install unzip apache2 openssh-server -y

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

\. "$HOME/.nvm/nvm.sh"

nvm install 22

# Removendo pacotes conflitantes relacionados ao Docker
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do  
  apt-get remove -y $pkg
done

# Adicionando o GPG oficial do Docker
apt-get update -y
apt-get install ca-certificates curl -y
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

# Adicionando o repositório Docker à lista de fontes do Apt
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null

# Atualizando repositórios e instalando o Docker
apt-get update -y
apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

