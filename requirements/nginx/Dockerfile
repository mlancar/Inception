FROM alpine:3.12

RUN apk update && apk upgrade && apk add \
		openssl	\
		nginx	\
		curl	\
		vim		\
		sudo



RUN rm -f /etc/nginx/nginx.conf

COPY		./conf/nginx.conf /etc/nginx/nginx.conf
COPY		./scripts/setup_nginx.sh /setup_nginx.sh

RUN			chmod -R +x /setup_nginx.sh	\
			openssl req -x509 -newkey rsa:4096 -keyout key.key -out cert.cert -sha256 -days 365



EXPOSE		443

ENTRYPOINT	["nginx", "-g", "daemon off"]

