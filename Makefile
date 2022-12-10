all:
	docker-compose build --no-cache --build-arg SERVER_URL="http://teamcity:8111"

deploy:
	docker-compose up -d
