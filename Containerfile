FROM ghcr.io/ublue-os/silverblue-main:41

COPY files/ /

RUN dnf5 copr enable -y dsommers/openvpn3 \
    && dnf5 copr enable -y grzegorz-gutowski/openvpn3-indicator \
    && dnf5 install -y \
        code \
        fira-code-fonts \
        gcc \
        git \
        gnome-shell-extension-appindicator \
        gnome-shell-extension-caffeine \
        gnome-shell-extension-dash-to-dock \
        keepassxc \
        make \
        nordvpn \
        openvpn3 \
        openvpn3-indicator \
        podman-compose \
        podman-docker \
        powertop \
        python3-pip \
        syncthing \
        tailscale \
        zsh

RUN rm /etc/xdg/autostart/openvpn3-indicator.desktop \
    && systemctl enable podman.socket

RUN ostree container commit
