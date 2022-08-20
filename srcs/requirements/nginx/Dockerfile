FROM debian:buster

EXPOSE 80
EXPOSE 443

RUN apt update -y && apt upgrade -y && apt install -y nginx openssl

RUN mkdir -p /run/nginx
COPY conf/nginx.conf /etc/nginx/conf.d/default.conf
RUN mkdir -p /etc/nginx/certs
WORKDIR /etc/nginx/certs
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out MyCertificate.crt -keyout MyKey.key -subj "/C=TH/ST=Bangkok/L=Bangkok/O=inception/CN=tratanat.42.fr"

ENTRYPOINT ["nginx", "-g", "daemon off;"]
