FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && apt-get install -y nginx openssl

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/vduchi.42.fr.conf /etc/nginx/conf.d/vduchi.42.fr.conf

COPY conf/vduchi.crt /etc/ssl/certs/vduchi.crt
COPY conf/vduchi.key /etc/ssl/private/vduchi.key

CMD ["nginx", "-g", "daemon off;"]
