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

RELEASE="0.5.1"

echo "ARCH is $ARCH"
curl -LO https://github.com/doitintl/kube-no-trouble/releases/download/${RELEASE}/kubent-${RELEASE}-linux-${ARCH}.tar.gz
tar zxf kubent-${RELEASE}-linux-${ARCH}.tar.gz
rm kubent-${RELEASE}-linux-${ARCH}.tar.gz
chmod +x kubent
mv kubent /usr/local/bin 