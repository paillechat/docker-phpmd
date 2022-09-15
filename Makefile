ifneq (,)
.error This Makefile requires GNU Make.
endif

.PHONY: build tag login push

CURRENT_DIR = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
CURRENT_PHP_VERSION =

DIR = .
FILE = Dockerfile
IMAGE = paillechat/phpmd
TAG = latest

PHP   = latest
PHPMD = @stable

build:
ifeq ($(PHP),latest)
	docker build --build-arg PHP=8-cli-alpine --build-arg PHPMD=$(PHPMD) -t $(IMAGE) -f $(DIR)/$(FILE) $(DIR)
else
	docker build --build-arg PHP=$(PHP)-cli-alpine --build-arg PHPMD=$(PHPMD) -t $(IMAGE) -f $(DIR)/$(FILE) $(DIR)
endif

tag:
	docker tag $(IMAGE) $(IMAGE):$(TAG)

login:
	yes | docker login --username $(USER) --password $(PASS)

push:
	@$(MAKE) tag TAG=$(TAG)
	docker push $(IMAGE):$(TAG)

enter:
	docker run --rm --name $(subst /,-,$(IMAGE)) -it --entrypoint=/bin/sh $(ARG) $(IMAGE):$(TAG)		
