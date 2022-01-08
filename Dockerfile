from python:alpine3.15

RUN apk add bash curl openssl && pip3 install yq==2.10.0 jinja2 jinja2-cli
RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 && chmod 700 get_helm.sh && ./get_helm.sh
COPY get-kubectl.sh /
RUN /get-kubectl.sh

ENTRYPOINT ['/bin/bash']