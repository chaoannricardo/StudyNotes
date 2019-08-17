#!/bin/bash

echo "Disable IPv6..."

# Add ipv6.disable=1 to /etc/default/grub
sed -i 's/^GRUB_CMDLINE_LINUX="/&ipv6.disable=1 /' /etc/default/grub

# Generate /boot/grub/grub.cfg
update-grub

# Replace ubuntu repository to tw mirror
sed -i 's#http://.*archive\..*/ubuntu/#http://free.nchc.org.tw/ubuntu/#g' /etc/apt/sources.list
apt update

# Upgrade system
DEBIAN_FRONTEND=noninteractive apt-get -y \
     -o Dpkg::Options::="--force-confdef" \
	 -o Dpkg::Options::="--force-confold" upgrade

# Need reboot system
