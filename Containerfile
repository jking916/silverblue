FROM ghcr.io/ublue-os/silverblue-main:41

COPY files/yum.repos.d/ /etc/yum.repos.d/
COPY build.sh /tmp/build.sh

RUN mkdir -p /var/lib/alternatives && \
    /tmp/build.sh && \
    ostree container commit
