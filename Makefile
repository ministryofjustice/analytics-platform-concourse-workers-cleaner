SHELL = '/bin/bash'
export BUILD_TAG ?= local
export DOCKER_BUILDKIT=1
export PROJECT_NAME=concourse-worker-cleaner

.PHONY: build test push

build:
	docker build -t quay.io/mojanalytics/${PROJECT_NAME}:${BUILD_TAG} .

test:
	docker-compose down
	docker-compose --project-name ${PROJECT_NAME} up -d
	docker-compose run --rm inspec exec tests -t docker://concourse-worker-cleaner_test_1

push:
		docker push quay.io/mojanalytics/${PROJECT_NAME}:${BUILD_TAG}
