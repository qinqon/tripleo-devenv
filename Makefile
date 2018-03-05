NAME = qinqon/tripleo-devenv
VERSION = 0.1.0

.PHONY: all build tag_latest release

all: build

build:
	docker build -t $(NAME):$(VERSION) .

tag_latest:
	docker tag $(NAME):$(VERSION) $(NAME):latest

release: tag_latest
	@if ! docker images $(NAME) | awk '{ print $$2 }' | grep -q -F $(VERSION); then echo "$(NAME) version $(VERSION) is not yet built. Please run 'make build'"; false; fi
	docker push $(NAME)
	@echo "*** Don't forget to create a tag by creating an official GitHub release."

run:
	docker run -v /tmp/:/host/tmp/:z -it $(NAME):$(VERSION)
