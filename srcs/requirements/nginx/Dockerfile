FROM alpine:3.12

RUN apk update && apk upgrade && apk add \
		openssl	\
		nginx	\
		curl	\
		vim		\
		sudo

COPY		./conf/nginx.conf /etc/nginx/nginx.conf

RUN			openssl req -x509 -nodes -out /etc/nginx/inception.crt -keyout /etc/nginx/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42Paris/OU=malancar.42.fr/CN=malancar"

EXPOSE		4443

CMD ["nginx", "-g", "daemon off;"]
