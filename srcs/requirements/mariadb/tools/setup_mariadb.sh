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

    echo "CREATE DATABASE IF NOT EXISTS \`$SITE_TITLE\`;" > db.sql

    echo "CREATE USER IF NOT EXISTS \`$SQL_USER\`@'%' IDENTIFIED BY '$SQL_PASSWORD';" >> db.sql

    echo "GRANT ALL PRIVILEGES ON \`$SITE_TITLE\`.* TO \`$SQL_USER\`@'localhost' IDENTIFIED BY '$SQL_PASSWORD';" >> db.sql
  
    echo "ALTER USER \`root\`@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD';" >> db.sql
   
    echo "FLUSH PRIVILEGES;" >> db.sql

    mysql < db.sql

    mysqladmin -u root -ppassword_root shutdown
    
fi
exec mysqld_safe