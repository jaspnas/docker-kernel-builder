REGISTRY=luxas
TAG=$(shell date --rfc-3339=date)

all: build
build:
	docker build -t ${REGISTRY}/kernel-builder:${TAG} .

push:
	docker push ${REGISTRY}/kernel-builder:${TAG}
