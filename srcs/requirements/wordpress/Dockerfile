FROM alpine:3.18


RUN apk update && apk upgrade && apk add \
        wget  \  
        php82 \
        php82-fpm \
        php82-mysqli \
        php82-phar    \
        mariadb-client  
        # default-mysql-client

RUN wget https://wordpress.org/wordpress-6.1.1.tar.gz -P /var/www/html

RUN cd /var/www/html \
    && tar -xzf /var/www/html/wordpress-6.1.1.tar.gz \
    && rm /var/www/html/wordpress-6.1.1.tar.gz

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

# RUN chown -R www-data:www-data /var/www/*
# RUN chmod -R 755 /var/www/*

EXPOSE 9000

COPY ./tools/setup_wordpress.sh ./
RUN chmod +x ./setup_wordpress.sh

COPY ./conf/wordpress.conf /etc/php/82/fpm/pool.d/www.conf

ENTRYPOINT ["sh", "./setup_wordpress.sh"]