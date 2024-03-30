# building docker images 
build-env:
	docker compose build
# starting docker-compose  
start-env:
	docker compose up -d
# wait for app and hub 
wait-env:
	bin/wait.sh
# start selenium test inside of the container 
start-test:
	docker compose exec behat ./vendor/bin/behat
# stop environment  
stop-env:
	docker compose down