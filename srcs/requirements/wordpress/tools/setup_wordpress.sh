#!/bin/bash

sleep 5

# cd /var/www/html/wordpress

wp-cli.phar cli update  --yes \
						--allow-root

wp-cli.phar core download --allow-root

# if ! wp-cli.phar core is-install; then
# which wp-cli.phar
# pwd
# ls -l
chmod +x /usr/local/bin/wp-cli.phar
sudo mv /usr/local/bin/wp-cli.phar /usr/local/bin/wp
# wp --info
# echo WHERE is wp-config.php
# which wp-config.phar
# echo SNIF
# cp wp-config-sample.php wp-config.php

# mysql -u malancar -p

# wp config create	--allow-root \
# 					--dbname=$SQL_DATABASE \
# 					--dbuser=$SQL_USER \
# 					--dbpass=$SQL_PASSWORD  \
					# --dbhost=mariadb:3306 --path='/var/www/html/wordpress'
# 					# --config-file=/var/www/html/wordpress
# # ls /var/www/html/wordpress

# wp config path

# wp core install	--allow-root \
# 			--url=https://${DOMAIN_NAME} \
# 			--title=${SITE_TITLE} \
# 			--admin_user=${ADMIN_USER} \
# 			--admin_password=${ADMIN_PASSWORD} \
# 			--admin_email=${ADMIN_EMAIL};

# wp user create		--allow-root \
# 			${USER1_LOGIN} ${USER1_MAIL} \
# 			--role=author \
# 			--user_pass=${USER1_PASS} ;


# wp cache flush --allow-root

# wp plugin install contact-form-7 --activate

# wp language core install en_US --activate

# wp theme delete twentynineteen twentytwenty
# wp plugin delete hello

# wp rewrite structure '/%postname%/'

# fi

if [ ! -d /run/php ]; then
	mkdir /run/php;
fi

exec /usr/sbin/php-fpm82 -F -R
