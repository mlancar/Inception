#!/bin/bash

service mariadb start

CREATE DATABASE wpdb;

CREATE USER 'new_user'@'%' IDENTIFIED BY 'password';

GRANT ALL ON wpdb.* to 'wpuser'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION;

service mariadb stop

mariadbd-safe