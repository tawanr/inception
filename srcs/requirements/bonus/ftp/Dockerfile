FROM debian:buster

RUN apt update -y && apt upgrade -y && apt install -y vsftpd

COPY conf/vsftpd.conf /etc
COPY tools/configure.sh /tmp/

ENTRYPOINT ["bash", "tmp/configure.sh"]