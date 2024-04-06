#!/bin/bash

cd solutions-web
git pull


docker stop soluweb
echo y | docker system prune
sleep 2

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