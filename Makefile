SHELL = /bin/bash -o pipefail

# Aliases
DOCKER_COMPOSE = docker-compose

DOCKER_RUN = docker run --rm
DOCKER_COMPOSE_RUN = $(DOCKER_COMPOSE) run --rm
DOCKER_COMPOSE_RUN_UTIL = $(DOCKER_COMPOSE) -f docker-compose.utils.yml run --rm
DOCKER_COMPOSE_EXEC = $(DOCKER_COMPOSE) exec
DOCKER_COMPOSE_EXEC_PHP = $(DOCKER_COMPOSE_EXEC) -u www-data php-fpm

install:
	USER_ID=$(shell id -u) GROUP_ID=$(shell id -g) $(DOCKER_COMPOSE) up --build -d

symfony-start:
	$(DOCKER_COMPOSE_EXEC_PHP) symfony 

php:
	$(DOCKER_COMPOSE_EXEC_PHP) bash

nginx:
	$(DOCKER_COMPOSE_EXEC) nginx bash

db:
	$(DOCKER_COMPOSE_EXEC) mariadb bash
