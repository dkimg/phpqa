.PHONY: run build login push latest test save

PHP=7.4

run: build login push

build:
	@docker build -t dkimg/phpqa:$(PHP) ./$(PHP)

login:
	@echo "$(DOCKER_PASSWORD)" | docker login -u "$(DOCKER_USERNAME)" --password-stdin
	@echo "$(QUAY_PASSWORD)" | docker login quay.io -u "$(QUAY_USERNAME)" --password-stdin

push:
	@docker tag dkimg/phpqa:$(PHP) quay.io/dkimg/phpqa:$(PHP)
	@docker push dkimg/phpqa:$(PHP)
	@docker push quay.io/dkimg/phpqa:$(PHP)

latest:
	@docker tag dkimg/phpqa:$(PHP) dkimg/phpqa:latest
	@docker tag dkimg/phpqa:$(PHP) quay.io/dkimg/phpqa:latest
	@docker push dkimg/phpqa:$(PHP)
	@docker push quay.io/dkimg/phpqa:$(PHP)

test:
	@docker pull dkimg/phpqa:$(PHP)
	@docker pull quay.io/dkimg/phpqa:$(PHP)
	@docker run --rm dkimg/phpqa:$(PHP) php -v
	@docker run --rm quay.io/dkimg/phpqa:$(PHP) php -v

save:
	@docker save dkimg/phpqa:$(PHP) | gzip > dkimg_phpqa$(PHP).tar.gz