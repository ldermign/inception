PROJECT_NAME=inception

DOCKER_COMPOSE_FILE	= ./srcs/docker-compose.yml

DOCKER_COMPOSE		= docker-compose

c					= start container

up: ## Start all or c=<name> containers in foreground
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

clean: ## Clean all images and volumes
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down -v
	bash ./srcs/requirements/tools/clean_all.sh
