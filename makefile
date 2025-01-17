LOCAL_DEV_IMAGE_NAME = "go-pot-local-dev"
build:
	goreleaser --snapshot --skip-publish --rm-dist

dev:
	docker build -t $(LOCAL_DEV_IMAGE_NAME) --target=dev .
	docker run -it --rm -v $(PWD):/app $(LOCAL_DEV_IMAGE_NAME) 

lint:
	docker run --rm -t -v $(PWD):/app -v ~/.cache/golangci-lint/v1.62.0:/root/.cache -w /app golangci/golangci-lint:v1.62.0 golangci-lint run -v