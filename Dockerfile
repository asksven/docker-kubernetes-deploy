from python:alpine3.13

RUN apk add bash curl openssl
RUN pip3 install yq==2.10.0 jinja2 jinja2-cli
RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 && chmod 700 get_helm.sh && ./get_helm.sh
COPY get-kubectl.sh /
RUN /get-kubectl.sh

ENTRYPOINT ['/bin/bash']