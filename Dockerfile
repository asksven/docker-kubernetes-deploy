
# FROM python:alpine3.15
# COPY requirements.txt .
# RUN apk --no-cache add bash curl openssl && pip3 --no-cache-dir install -r requirements.txt
# RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 && chmod 700 get_helm.sh && ./get_helm.sh
# COPY get-kubectl.sh /
# RUN /get-kubectl.sh
# ENTRYPOINT ["/bin/bash"]
FROM ubuntu:20.04


ARG DEBIAN_FRONTEND=noninteractive

COPY requirements.txt .

# linx stuff
RUN apt-get -y update \
    && apt-get -y --no-install-recommends install -V git curl python3 jq unzip zip python3-pip \
    && pip3 --no-cache-dir install -Iv -r requirements.txt \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
# our stuff    
COPY get-k*.sh /
RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 && chmod 700 get_helm.sh \
    && ./get_helm.sh \
    && /get-kubent.sh \
    && /get-kubectl.sh \
    && /get-kustomize.sh

ENTRYPOINT ["/bin/bash"]