all:
	@docker-compose -f ./srcs/docker-compose.yml up

down:
	@docker-compose -f ./srcs/docker-compose.yml down

re:
	@docker-compose -f ./srcs/docker-compose.yml up --build

clean:
	@docker stop $$(docker container ls -aq)
	docker rm $$(docker container ls -aq)
	docker rmi -f $$(docker image ls -aq)
	docker volume rm $$(docker volume ls -q)
	docker network rm $$(docker network ls -q)

.PHONY: all re down clean
