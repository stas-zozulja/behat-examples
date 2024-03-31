.PHONY: build-env start-env wait-env run-tests stop-env

# Set the default environment to dev
ENV ?= dev
COMPOSE_ENV := .env
ifeq ($(ENV), ci)
    COMPOSE_ENV := .env.ci
endif


# building docker images 
build-env:
	docker compose --env-file=$(COMPOSE_ENV) build

# starting docker-compose  
start-env:
	docker compose --env-file=$(COMPOSE_ENV) up -d --quiet-pull

# wait for selenium hub 
wait-env:
	bin/wait-for-grid.sh

# start selenium tests
run-tests:
	docker compose --env-file=$(COMPOSE_ENV) exec behat vendor/bin/behat --profile=google

# stop environment  
stop-env:
	docker compose --env-file=$(COMPOSE_ENV) down
