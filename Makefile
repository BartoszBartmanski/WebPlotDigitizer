
all: build_4.6

.PHONY: build
build_%:
	docker build -t bartoszbartmanski/webplotdigitizer:$* -f Dockerfile .

.PHONY: push_%
push_%: build_%
	docker push bartoszbartmanski/webplotdigitizer:$*

.PHONY: clean_images
clean_images:
	docker images -a | grep "bartoszbartmanski/webplotdigitizer" | awk '{print $$3}' | xargs docker rmi

