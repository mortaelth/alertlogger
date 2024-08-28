GO111MODULE := on
DOCKER_TAG := $(or ${GIT_TAG_NAME}, latest)

all: alertlogger

.PHONY: alertlogger
alertlogger:
	go build -o bin/alertlogger
	strip bin/alertlogger

.PHONY: dockerimages
dockerimages:
	docker build -t mortaelth/alertlogger:${DOCKER_TAG} .

.PHONY: dockerpush
dockerpush:
	docker push mortaelth/alertlogger:${DOCKER_TAG}

.PHONY: clean
clean:
	rm -f bin/*
