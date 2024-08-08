#!/bin/bash
if [ -d /run/mysqld ]; then
    echo "stopping mariadb"
    rc-service mariadb stop
    rc-service mariadb status
    # mysqladmin -u root -p password_root shutdown
fi


if [ -d /var/lib/mysql/Inception ]; then
    echo "Database already exist"
else

    sleep 2

    /etc/init.d/mariadb setup
    rc-service mariadb start
    sleep 2

    echo "CREATE DATABASE IF NOT EXISTS \`Inception\`;" > db.sql

    echo "CREATE USER IF NOT EXISTS \`malancar\`@'%' IDENTIFIED BY 'password';" >> db.sql

    echo "GRANT ALL PRIVILEGES ON \`Inception\`.* TO \`malancar\`@'localhost' IDENTIFIED BY 'password';" >> db.sql
  
    echo "ALTER USER \`root\`@'localhost' IDENTIFIED BY 'password_root';" >> db.sql
   
    echo "FLUSH PRIVILEGES;" >> db.sql

    mysql < db.sql

    mysqladmin -u root -ppassword_root shutdown
    
fi
exec mysqld_safe