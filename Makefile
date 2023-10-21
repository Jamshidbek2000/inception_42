up:
	mkdir -p data/mariadb
	mkdir -p data/wordpress
	docker-compose -f ./srcs/docker-compose.yml up --build -d

down:
	docker-compose -f ./srcs/docker-compose.yml down

clean: down
	rm -rf /home/jergashe/inception_42/data/mariadb/*
	rm -rf /home/jergashe/inception_42/data/wordpress/*
# 	rm -rf /Users/jergashe/Documents/projects/all_inception/inception_42/data/mariadb/*
#	rm -rf /Users/jergashe/Documents/projects/all_inception/inception_42/data/wordpress/*
	@if [ -n "$(shell docker volume ls -q -f name=mariadb)" ]; then \
		docker volume rm -f mariadb; \
	fi
	@if [ -n "$(shell docker volume ls -q -f name=wordpress)" ]; then \
		docker volume rm -f wordpress; \
	fi

stop:
	@if docker ps -a | grep -q wordpress; then docker stop wordpress && docker rm wordpress; fi
	@if docker ps -a | grep -q nginx; then docker stop nginx && docker rm nginx; fi
	@if docker ps -a | grep -q mariadb; then docker stop mariadb && docker rm mariadb; fi

fclean: clean stop


del-i: fclean
	@if docker images -q wordpress_inception; then docker rmi wordpress_inception; fi
	@if docker images -q nginx_inception; then docker rmi nginx_inception; fi
	@if docker images -q mariadb_inception; then docker rmi mariadb_inception; fi

	
del: stop
	@if [ -d "data/wordpress" ]; then rm -r "data/wordpress"; fi
	@if [ -d "data/mariadb" ]; then rm -r "data/mariadb"; fi
	docker container prune &&\
	docker image prune &&\
	docker system prune -a -f

re: 
	make clean && make up

stop-all:
	docker stop $$(docker ps -q)

.DEFAULT_GOAL := up
