# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: glibc
# Minimum Panel Version: 0.7.0
# ----------------------------------
FROM        frolvlad/alpine-glibc

LABEL       maintainer="brycema@protonmail.com"

RUN         apk add --update --no-cache curl ca-certificates openssl libstdc++ busybox-extras binutils \
            && apk add libc++ jq --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing

RUN         apk add \
            icu-dev \
            curl \
            openssl-dev \
            libunwind \
            libstdc++ \
            g++ \
            libc6-compat \
            strace

RUN         adduser -D -h /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/ash", "/entrypoint.sh"]