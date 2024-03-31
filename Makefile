# building docker images 
build-env:
	docker compose build

# starting docker-compose  
start-env:
	docker compose up -d --quiet-pull

# wait for selenium hub 
wait-env:
	bin/wait.sh

# start selenium tests
run-tests:
	docker compose run behat vendor/bin/behat --profile=google

# stop environment  
stop-env:
	docker compose down
