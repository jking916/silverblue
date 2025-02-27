#!/bin/bash

set -ouex pipefail

dnf5 copr enable -y dsommers/openvpn3
dnf5 copr enable -y grzegorz-gutowski/openvpn3-indicator

mkdir -p /var/opt
mkdir -p /usr/lib/1Password
ln -fs /usr/lib/1Password /var/opt/1Password

dnf5 install -y \
  1password \
  code \
  fira-code-fonts \
  gcc \
  gnome-shell-extension-appindicator \
  gnome-shell-extension-caffeine \
  gnome-shell-extension-dash-to-dock \
  keepassxc \
  make \
  openvpn3 \
  openvpn3-indicator \
  podman-compose \
  podman-docker \
  powertop \
  python3-pip \
  syncthing \
  tailscale \
  zsh

systemctl enable podman.socket

grep -rl "/opt/1Password" /usr/lib/1Password | xargs sed -i 's/\/opt\/1Password/\/usr\/lib\/1Password/g'
grep -rl "/opt/1Password" /usr/share/applications | xargs sed -i 's/\/opt\/1Password/\/usr\/lib\/1Password/g'
rm /usr/bin/1password
ln -s /usr/lib/1Password/1password /usr/bin/1password

mkdir -p /var/lib/openvpn3/configs
chown -R openvpn:openvpn /var/lib/openvpn3/configs
chmod 700 /var/lib/openvpn3/configs
setsebool -P dbus_access_tuntap_device=1
openvpn3-admin init-config --write-configs
