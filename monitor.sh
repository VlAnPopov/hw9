#!/bin/bash

# Копируем с хоста файл с настройками сервиса
cp -f /vagrant/watchlog /etc/sysconfig
# Копируем собственно исполняемый скрипт и ставим право на запуск для него
cp -f /vagrant/watchlog.sh /opt
chmod +x /opt/watchlog.sh
# Копируем заранее подготовленные юниты
cp -f /vagrant/watchlog.service /etc/systemd/system
chmod 664 /etc/systemd/system/watchlog.service
cp -f /vagrant/watchlog.timer /etc/systemd/system
chmod 664 /etc/systemd/system/watchlog.timer
# Запускаем сервис
systemctl enable --now watchlog.timer
# Установим spawn-fcgi
yum install epel-release -y && yum install spawn-fcgi php php-cli mod_fcgid httpd -y
# Заливаем подготовленные конфиг и файл сервиса
cp -f /vagrant/spawn-fcgi /etc/sysconfig/spawn-fcgi
cp -f /vagrant/spawn-fcgi.service /etc/systemd/system
# Запускаем сервис
systemctl start spawn-fcgi


cp /vagrant/httpd-* /etc/sysconfig
cp /vagrant/*.conf /etc/httpd/conf/
systemctl start httpd@first
systemctl start httpd@second