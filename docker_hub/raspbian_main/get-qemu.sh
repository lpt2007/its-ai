#!/bin/sh -ex

QEMU_VERSION="2.9.0.resin1" QEMU_TARGET="arm"
QEMU_SHA256="b39d6a878c013abb24f4cccc7c3a79829546ae365069d5712142a4ad21bcb91b"
QEMU_URL_TAG="v2.9.0%2Bresin1"
QEMU_URL="https://github.com/resin-io/qemu/releases/download/${QEMU_URL_TAG}/qemu-${QEMU_VERSION}-${QEMU_TARGET}.tar.gz"

curl -SL  $QEMU_URL -o qemu-${QEMU_VERSION}-${QEMU_TARGET}.tar.gz
echo "${QEMU_SHA256}  qemu-${QEMU_VERSION}-${QEMU_TARGET}.tar.gz" > qemu-${QEMU_VERSION}-${QEMU_TARGET}.tar.gz.sha256sum
sha256sum -c qemu-${QEMU_VERSION}-${QEMU_TARGET}.tar.gz.sha256sum
rm -f qemu-${QEMU_VERSION}-${QEMU_TARGET}.tar.gz.sha256sum

rm -f qemu-${QEMU_TARGET}-static
tar --strip 1 -xzf qemu-${QEMU_VERSION}-${QEMU_TARGET}.tar.gz
rm -f qemu-${QEMU_VERSION}-${QEMU_TARGET}.tar.gz
