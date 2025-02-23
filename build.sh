#!/bin/bash

set -ouex pipefail

dnf5 copr enable -y dsommers/openvpn3
dnf5 copr enable -y grzegorz-gutowski/openvpn3-indicator

dnf5 install -y \
  1password \
  code \
  fira-code-fonts \
  gcc \
  gnome-shell-extension-appindicator \
  gnome-shell-extension-caffeine \
  gnome-shell-extension-dash-to-dock \
  make \
  openvpn3 \
  openvpn3-indicator \
  podman-compose \
  podman-docker \
  powertop \
  python3-pip \
  tailscale \
  zsh

systemctl enable podman.socket
