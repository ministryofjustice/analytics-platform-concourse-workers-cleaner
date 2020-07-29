SHELL = '/bin/bash'
export BUILD_TAG ?= local
export DOCKER_BUILDKIT=1
export PROJECT_NAME=concourse-worker-cleaner

.PHONY: build 

build:
	docker build -t 593291632749.dkr.ecr.eu-west-1.amazonaws.com/${PROJECT_NAME}:${BUILD_TAG} .
