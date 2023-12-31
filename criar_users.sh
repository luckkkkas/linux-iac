#!/bin/bash 

echo "Criando Diretórios..."

mkdir  publico adm ven sec

echo "Diretórios criados... "

echo "criando Grupos..."

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Gupos criados..."

echo "Iniciando a Criação de Usuários no sistema... "

useradd carlos  -c "Carlos_" -m -s /bin/bash -g GRP_ADM -p $(openssl passwd -crypt Senha123) 

useradd maria -c "Maria_" -m -s /bin/bash -G GRP_ADM -p $(openssl passwd -crypt Senha123) 

useradd joao  -c "João_" -m -s /bin/bash -G GRP_ADM -p $(openssl passwd -crypt Senha123) 

useradd debora -c "Débora_" -m -s /bin/bash -G GRP_VEN -p $(openssl passwd -crypt Senha123) 

useradd sebastiana -c "Sebastiana_" -m -s /bin/bash -G GRP_VEN -p $(openssl passwd -crypt Senha123) 

useradd roberto -c "Roberto_" -m -s /bin/bash -G GRP_VEN -p $(openssl passwd -crypt Senha123) 

useradd josefina -c "Josefina_" -m -s /bin/bash -G GRP_SEC -p $(openssl passwd -crypt Senha123) 

useradd amanda -c "Amanda_" -m -s /bin/bash -G GRP_SEC

useradd rogerio  -c "Rogério_" -m -s /bin/bash -G GRP_SEC


echo "Terminado a criação..."


echo "Alterando Permissões..."

chown root:root /publico/
chown root:GRP_ADM /adm/
chown root:GRP_VEN /ven/
chown root:GRP_SEC /sec

chmod 777 publico
chmod 770 adm
chmod 770 ven
chmod 770 sec

echo "Permissões alteradas com sucesso..."
