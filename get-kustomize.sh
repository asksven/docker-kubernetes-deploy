#!/bin/bash

ARCH=$(uname -m)
case $ARCH in
    armv5*) ARCH="armv5";;
    armv6*) ARCH="armv6";;
    armv7*) ARCH="arm";;
    aarch64) ARCH="arm64";;
    x86) ARCH="386";;
    x86_64) ARCH="amd64";;
    i686) ARCH="386";;
    i386) ARCH="386";;
esac

echo "ARCH is $ARCH"
curl -L https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize/v4.5.4/kustomize_v4.5.4_linux_${ARCH}.tar.gz -o kustomize.tar.gz
tar zxvf kustomize.tar.gz
chmod +x kustomize
mv kustomize /usr/local/bin
rm kustomize.tar.gz