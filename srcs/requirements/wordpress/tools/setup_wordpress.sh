#!/bin/bash
sleep 10

wp config create	--allow-root \
					--dbname=$SQL_DATABASE \
					--dbuser=$SQL_USER \
					--dbpass=$SQL_PASSWORD \
					--dbhost=mariadb:3306 --path='/var/www/wordpress'

wp core install	--allow-root \
			--url=https://${DOMAIN_NAME} \
			--title=${SITE_TITLE} \
			--admin_user=${ADMIN_USER} \
			--admin_password=${ADMIN_PASSWORD} \
			--admin_email=${ADMIN_EMAIL};

wp user create		--allow-root \
			${USER1_LOGIN} ${USER1_MAIL} \
			--role=author \
			--user_pass=${USER1_PASS} ;

wp cache flush --allow-root

wp plugin install contact-form-7 --activate

wp language core install en_US --activate

wp theme delete twentynineteen twentytwenty
wp plugin delete hello

wp rewrite structure '/%postname%/'


if [ ! -d /run/php ]; then
	mkdir /run/php;
fi

exec /usr/sbin/php82-fpm -F -R

# /usr/sbin/php82-fpm -F