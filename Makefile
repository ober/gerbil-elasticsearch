ARCH := $(shell uname -m)
DOCKER_IMAGE := "gerbil/gerbilxx:$(ARCH)"
UID := $(shell id -u)
GID := $(shell id -g)
default: linux-static

check-root:
	@if [ "${UID}" -eq 0 ]; then \
	git config --global --add safe.directory /src; \
	fi

deps:
	gxpkg deps -i

build-release: deps check-root

	/opt/gerbil/bin/gxpkg build --release

linux-static:
	docker run -t \
	-u "$(UID):$(GID)" \
	-v $(PWD):/src:z \
	$(DOCKER_IMAGE) \
	make -C /src/ build-release

install:
	mv .gerbil/bin/elasticsearch /usr/local/bin/elasticsearch

clean:
	gerbil clean
	gerbil clean all
