all:
	docker-compose build --no-cache

deploy:
	docker-compose up -d