#!/bin/bash

sleep 10

mysql start

mysql -e "CREATE DATABASE IF NOT EXISTS Inception;"

mysql -e "CREATE USER IF NOT EXISTS malancar@'%' IDENTIFIED BY password;"

mysql -e "GRANT ALL PRIVILEGES ON Inception.* TO malancar@'%' IDENTIFIED BY password;"

mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY password_root;"


mysql -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p password_root shutdown

exec mysqld_safe