build:
	docker compose build

start:
	docker compose up -d && docker compose logs -f --tail=100

clear:
	docker compose down && docker volume prune

console:
	docker exec -ti ruby_challenge_api bash

setup_and_start: build start
