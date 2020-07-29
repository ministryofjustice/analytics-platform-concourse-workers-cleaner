SHELL = '/bin/bash'
export BUILD_TAG ?= local
export DOCKER_BUILDKIT=1
export PROJECT_NAME=concourse-worker-cleaner

.PHONY: build push

build:
	docker build -t quay.io/mojanalytics/${PROJECT_NAME}:${BUILD_TAG} .

push:
		docker push quay.io/mojanalytics/${PROJECT_NAME}:${BUILD_TAG}
