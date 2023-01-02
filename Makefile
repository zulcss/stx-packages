PWD := $(shell pwd)
REPO := quay.io/zulcss/stx-packages

image:
	docker build -t stx-base images

build-all:
	sudo luet build --all --destination $(PWD)/build --tree $(PWD)/package \
		--compression gzip

repo:
	sudo luet create-repo \
		 --name "stx-packages" \
                --type docker \
                --output "quay.io/zulcss/stx-packages" \
                --push-images \
                --packages $(PWD)/build \
                --force-push \
                --tree $(PWD)/package
clean:
	$(SUDO) rm -rf $(PWD)/build *.tar *.metdata.yaml

