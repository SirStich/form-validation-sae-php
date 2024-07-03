PHONY: build, interact, autoload, dump, install, clean-vendor, dev

build:
	docker compose up --build -d
# in the dev build is caching for nginx disabled
dev:
	docker compose -f docker-compose.dev.yml up --build -d
interact:
	docker exec -it form-validation-app sh

autoload:
	docker exec -it form-validation-app composer dump-autoload

dump:
	docker compose down
# show running containers
list:
	docker compose ps

install:
	docker exec -it form-validation-app composer install

clean-vendor:
	docker exec -it form-validation-app rm -rf /var/www/vendor