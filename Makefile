REGISTRY=jaspnas
# gcc-5, gcc-7, gcc-8 and gcc-10, gcc-11 and gcc-12 are also supported
GCC_VERSION?=gcc-12
VERSION?=$(shell date --rfc-3339=date)
TAG=${GCC_VERSION}-${VERSION}

all: build
build:
	sed -e "s|GCC_VERSION|${GCC_VERSION}|g" Dockerfile | \
		docker build -t ${REGISTRY}/kernel-builder:${TAG} -f - .

push-latest: build
	docker tag ${REGISTRY}/kernel-builder:${TAG} ${REGISTRY}/kernel-builder:${GCC_VERSION}
	docker push ${REGISTRY}/kernel-builder:${GCC_VERSION}
ifeq ($(GCC_VERSION),gcc-12)
	docker tag ${REGISTRY}/kernel-builder:${TAG} ${REGISTRY}/kernel-builder:latest
	docker push ${REGISTRY}/kernel-builder:latest
endif

push-tag: build
	docker push ${REGISTRY}/kernel-builder:${TAG}
