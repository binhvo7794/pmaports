#!/bin/sh -e
# Description: build mkinitfs and generate ci-tron packages
# Options: native
# https://postmarketos.org/pmb-ci

set -x

if [ "$(id -u)" = 0 ]; then
	set -x
	exec su "${TESTUSER:-pmos}" -c "sh -e $0"
fi

DEVICE=qemu-amd64
KERNEL_FLAVOR=lts

PMB="pmbootstrap --details-to-stdout"
$PMB config device $DEVICE
$PMB config kernel $KERNEL_FLAVOR
if [ -d keys ]; then
	mkdir -p /home/pmos/.local/var/pmbootstrap/config_apk_keys/
	cp keys/* /home/pmos/.local/var/pmbootstrap/config_apk_keys/
fi
if [ -d packages ]; then
	cp -r packages /home/pmos/.local/var/pmbootstrap/
	ls -l /home/pmos/.local/var/pmbootstrap/
	ls -l /home/pmos/.local/var/pmbootstrap/packages
fi

$PMB chroot --rootfs apk add device-$DEVICE device-$DEVICE-kernel-$KERNEL_FLAVOR postmarketos-mkinitfs-hook-ci

$PMB chroot --rootfs mkinitfs
$PMB export --no-install
