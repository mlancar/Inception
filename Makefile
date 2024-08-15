all: up

up: folder
	 docker compose -f ./srcs/docker-compose.yml up --build -d

folder:
	sudo mkdir -p /home/malancar/data/mariadb
	sudo mkdir -p /home/malancar/data/wordpress

down:
	docker compose -f ./srcs/docker-compose.yml down

start:
	docker compose -f ./srcs/docker-compose.yml start

stop:
	docker compose -f ./srcs/docker-compose.yml stop

clean:
	sudo rm -rf /home/malancar/data

fclean: clean
	docker system prune --volumes -fa 

.PHONY: all up down start stop clean fclean