REGISTRY=luxas
# gcc-7 is also supported
GCC_VERSION?=gcc-5
TAG=${GCC_VERSION}-$(shell date --rfc-3339=date)

all: build
build:
	sed -e "s|GCC_VERSION|${GCC_VERSION}|g" Dockerfile | \
		docker build -t ${REGISTRY}/kernel-builder:${TAG} -f - .

push: build
	docker push ${REGISTRY}/kernel-builder:${TAG}
