# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: glibc
# Minimum Panel Version: 0.7.0
# ----------------------------------
FROM        alpine:latest

LABEL       maintainer="brycema@protonmail.com"

RUN         apk update
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