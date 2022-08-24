FROM debian:buster

RUN apt update -y && apt upgrade -y && apt install -y redis

COPY conf/redis.conf /etc/redis/

CMD ["redis-server","--protected-mode no"]