FROM debian:buster

EXPOSE 80

RUN apt update -y && apt upgrade -y && apt install -y nginx

RUN mkdir -p /run/nginx
COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

ENTRYPOINT ["nginx", "-g", "daemon off;"]
