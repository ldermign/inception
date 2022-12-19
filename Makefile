PROJECT_NAME=inception

DOCKER_COMPOSE_FILE	= ./srcs/docker-compose.yml

DOCKER_COMPOSE		= docker-compose

VOLUME_FILE			= /home/ldermign/data

c					= start container

up: ## Start all or c=<name> containers in foreground
# sudo mkdir -p ${VOLUME_FILE}/mariadb
# sudo mkdir -p ${VOLUME_FILE}/wordpress
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) up

start: ## Start all or c=<name> containers in background
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) up -d $(c)

stop: ## Stop all or c=<name> containers
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) stop $(c)

status: ## Show status of containers
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) ps

restart: ## Restart all or c=<name> containers
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) stop $(c)
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) up $(c) -d

logs: ## Show logs for all or c=<name> containers
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) logs --tail=100 -f $(c)

clean: ## Clean all images
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down -v
	bash ./srcs/requirements/tools/clean_all.sh

fclean: ## Clean all images and volumes on all devices
	sudo rm -rf ${VOLUME_FILE}/mariadb/*
	sudo rm -rf ${VOLUME_FILE}/wordpress/*
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down -v
	bash ./srcs/requirements/tools/clean_all.sh
