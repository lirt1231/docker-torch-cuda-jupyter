.PHONY:
	build up down

build:
	DOCKER_BUILDKIT=1 docker-compose build

up:
	docker-compose up -d

down:
	docker-compose down --remove-orphans
