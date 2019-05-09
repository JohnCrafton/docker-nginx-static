include make_env

NS ?= registry.at.some.tld
VERSION ?= $(BUILD_NUMBER)
IMAGE_NAME ?= docker-nginx-static

.PHONY: all build tag push shell run start stop rm release

build: builder.yml
	@echo "🔧 building $(NS)/${IMAGE_NAME}..."
	docker-compose -f builder.yml build

tag:
	@echo "🏷️ tagging new images..."
	docker tag $(NS)/$(IMAGE_NAME) $(NS)/$(IMAGE_NAME):$(VERSION)
	docker tag $(NS)/$(IMAGE_NAME) $(NS)/$(IMAGE_NAME):latest

push:
	@echo "🛳️ Pushing to $(NS)..."
	docker push $(NS)/$(IMAGE_NAME):$(VERSION)
	docker push $(NS)/$(IMAGE_NAME):latest

release: build tag

print-%: ; @echo $* = $($*)

default: all