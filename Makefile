# building docker images 
build-env:
	docker compose build

# starting docker-compose  
start-env:
	docker compose up -d

# wait for selenium hub 
wait-env:
	bin/wait.sh

# start selenium test inside of the container 
start-test:
	docker compose run behat vendor/bin/behat

# stop environment  
stop-env:
	docker compose down