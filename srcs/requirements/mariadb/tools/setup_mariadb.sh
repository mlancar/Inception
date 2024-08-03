#!/bin/bash

service mariadb start

CREATE USER 'new_user'@'%' IDENTIFIED BY 'password';

service mariadb stop

mariadbd-safe