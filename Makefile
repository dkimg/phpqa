.PHONY: build save

PHP=7.4

build:
	@docker build -t dkimg/phpqa:$(PHP) ./$(PHP)

save:
	@docker save dkimg/phpqa:$(PHP) | gzip > dkimg_phpqa$(PHP).tar.gz