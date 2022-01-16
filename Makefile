
ARCH = darwin-x64-unknown
SKIP_CHROMIUM =
OUT =
DOCKER_TAG = dev

docker-buildx:
	export DOCKER_CLI_EXPERIMENTAL=enabled
	@if ! docker buildx ls | grep -q container-builder; then\
		docker buildx create --platform "linux/amd64,linux/arm64" --name container-builder --use;\
	fi
	docker buildx build --platform "linux/amd64,linux/arm64" \
		-t ${REPO}:${TAG} \
		. --push
