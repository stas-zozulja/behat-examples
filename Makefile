# building docker images 
build-env:
	docker compose build

# starting docker-compose  
start-env:
	docker compose up -d --quiet-pull

# wait for selenium hub 
wait-env:
	bin/wait.sh

# start selenium test inside of the container 
start-test:
	docker compose run behat ls -la

# stop environment  
stop-env:
	docker compose down