#!/bin/bash

adduser ${FTP_USER} --gecos "" --disabled-password
echo "$FTP_USER:$FTP_PASSWORD" | chpasswd
# chown -R $FTP_USER:$FTP_USER /var/www/html
echo "$FTP_USER" >> /etc/vsftpd.userlist
echo "FTP started on port 21."

vsftpd /etc/vsftpd.conf