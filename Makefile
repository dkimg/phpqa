.PHONY: build test save

PHP=7.4

build:
	@docker build -t dkimg/phpqa:$(PHP) ./$(PHP)

test:
	@docker pull dkimg/phpqa:$(PHP)
	@docker pull quay.io/dkimg/phpqa:$(PHP)
	@docker run --rm dkimg/phpqa:$(PHP) php -v
	@docker run --rm quay.io/dkimg/phpqa:$(PHP) php -v

push:
	@echo "$(DOCKER_PASSWORD)" | docker login -u "$(DOCKER_USERNAME)" --password-stdin
	@echo "$(QUAY_PASSWORD)" | docker login quay.io -u "$(QUAY_USERNAME)" --password-stdin
	@docker tag dkimg/phpqa:$(PHP) quay.io/dkimg/phpqa:$(PHP)
	@docker push dkimg/phpqa:$(PHP)
	@docker push quay.io/dkimg/phpqa:$(PHP)

save:
	@docker save dkimg/phpqa:$(PHP) | gzip > dkimg_phpqa$(PHP).tar.gz