all: up

up: volumes
	@docker-compose -f ./srcs/docker-compose.yml up

down:
	@docker-compose -f ./srcs/docker-compose.yml down

volumes:
	mkdir -p ~/data/website ~/data/database ~/data/portainer

re: 
	@cd srcs && docker-compose build --no-cache
	@docker-compose -f ./srcs/docker-compose.yml up

clean:
	-@docker stop $$(docker container ls -aq) 2>/dev/null
	-docker rm $$(docker container ls -aq) 2>/dev/null
	-docker rmi -f $$(docker image ls -aq) 2>/dev/null
	-docker network rm $$(docker network ls -q) 2>/dev/null
	-docker volume rm $$(docker volume ls -q) 2>/dev/null

fclean: clean
	sudo rm -rf ~/data/

.PHONY: all re down clean