#!/bin/bash

cd solutions-web || exit 1
git pull


docker stop soluweb
echo y | docker system prune
sleep 2

docker rmi soluweb
docker build -t soluweb .

docker run -p 80:80 -d --name soluweb soluweb:latest

# Espera 5 segundos
sleep 2

# Ver los logs del contenedor
docker logs -f soluweb &

# Espera 5 segundos más
sleep 5

# Cierra los logs
kill $(jobs -p)