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
curl -LO https://dl.k8s.io/release/v1.23.5/bin/linux/${ARCH}/kubectl
chmod +x kubectl
mv kubectl /usr/local/bin 