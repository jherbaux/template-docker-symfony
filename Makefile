SHELL = /bin/bash -o pipefail

# Aliases
DOCKER_COMPOSE = docker-compose

DOCKER_RUN = docker run --rm
DOCKER_COMPOSE_RUN = $(DOCKER_COMPOSE) run --rm
DOCKER_COMPOSE_RUN_UTIL = $(DOCKER_COMPOSE) -f docker-compose.utils.yml run --rm
DOCKER_COMPOSE_EXEC = $(DOCKER_COMPOSE) exec

install:
	USER_ID=$(id -u) GROUP_ID=$(id -g) $(DOCKER_COMPOSE) up --build

php:
	$(DOCKER_COMPOSE_EXEC) -u www-data php-fpm bash

