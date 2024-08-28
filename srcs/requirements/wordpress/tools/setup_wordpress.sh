#!/bin/bash

sleep 10

# cd /var/www/html/wordpress

wp-cli.phar cli update  --yes \
						--allow-root

wp-cli.phar core download --allow-root

# if ! wp-cli.phar core is-install; then
# which wp-cli.phar
# pwd
# ls -l


# echo WHERE is wp-config.php
# which wp-config.phar
# echo SNIF

# mysql -u malancar -p

/usr/local/bin/wp-cli.phar config create	--allow-root \
					--dbname=$SQL_DATABASE \
					--dbuser=$SQL_USER \
					--dbpass=$SQL_PASSWORD  \
					--dbhost=mariadb:3306 #--path='/var/www/html/wordpress'
					# --config-file=/var/www/html/wordpress

/usr/local/bin/wp-cli.phar core install	--allow-root \
			--url=https://${DOMAIN_NAME} \
			--title=${SITE_TITLE} \
			--admin_user=${ADMIN_USER} \
			--admin_password=${ADMIN_PASSWORD} \
			--admin_email=${ADMIN_EMAIL};

# # ls /var/www/html/wordpress

/usr/local/bin/wp-cli.phar config path

/usr/local/bin/wp-cli.phar user create		--allow-root \
			${USER1_LOGIN} ${USER1_MAIL} \
			--role=author \
			--user_pass=${USER1_PASS} ;


/usr/local/bin/wp-cli.phar cache flush --allow-root

/usr/local/bin/wp-cli.phar plugin install contact-form-7 --activate

/usr/local/bin/wp-cli.phar language core install en_US --activate

/usr/local/bin/wp-cli.phar theme delete twentynineteen twentytwenty
/usr/local/bin/wp-cli.phar plugin delete hello

/usr/local/bin/wp-cli.phar rewrite structure '/%postname%/'

# fi

if [ ! -d /run/php ]; then
	mkdir /run/php;
fi

exec /usr/sbin/php-fpm82 -F -R
