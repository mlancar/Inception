FROM alpine:3.18

RUN apk update && apk upgrade && apk add \
		openssl		\
		mariadb		\
		mariadb-client	\
		openrc	\
		procps				\
		curl		\
		vim			\
		sudo	\
		mariadb-common

RUN openrc

RUN touch /run/openrc/softlevel

RUN rm -f /etc/mariadb/mariadb.conf

COPY		./conf/mariadb.conf /etc/mariadb/mariadb.conf
COPY		./tools/setup_mariadb.sh ./setup_mariadb.sh

RUN			chmod -R +x ./setup_mariadb.sh

EXPOSE		3306

ENTRYPOINT	["sh" , "./setup_mariadb.sh"]

