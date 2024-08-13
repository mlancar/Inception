FROM alpine:3.18

RUN apk update && apk upgrade && apk add \
		openssl	\
		nginx	\
		curl	\
		vim		\
		sudo

COPY		./conf/nginx.conf /etc/nginx/nginx.conf
COPY		/index.html /usr/share/

RUN			openssl req -x509 -nodes -out /etc/nginx/inception.crt -keyout /etc/nginx/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42Paris/OU=malancar.42.fr/CN=malancar"

EXPOSE		443

CMD ["nginx", "-g", "daemon off;"]
