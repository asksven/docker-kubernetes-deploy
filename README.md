# docker-kubernetes-deploy

This is a helper container built for multi-arch (I needed it for arm64) that contains yq, jinja2, jinja2-cli, kubectl and helm3

## Build

1. export `REPO` and `TAG` to suit your needs, e.g. `export REPO=asksven/docker-kubernetes-deploy` and `export TAG=latest`
1. `make` to build for the different architectures. **Note:** the `Makefile` is for darwin tooling, change it to your needs
 
