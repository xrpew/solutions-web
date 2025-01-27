# Usa la imagen de Nginx como base
FROM nginx:latest

# Copia los archivos estáticos al directorio de trabajo de Nginx
COPY . /usr/share/nginx/html

# Expone el puerto 80
EXPOSE 80

# Comando para iniciar Nginx en primer plano cuando se ejecute el contenedor
CMD ["nginx", "-g", "daemon off;"]