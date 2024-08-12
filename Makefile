all: up

up: folder
	 docker compose -f ./srcs/docker-compose.yml up

folder:
	sudo mkdir -p /home/uclement/data/mariadb
	sudo mkdir -p /home/uclement/data/wordpress

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