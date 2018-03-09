FROM        ubuntu:16.04

MAINTAINER  ki2007, <ki2007@damw.eu>

# Install Dependencies
RUN         apt update \
            && apt upgrade -y \
            && apt install -y ca-certificates less libasound2 libegl1-mesa libglib2.0-0 libnss3 libpulse0 libxcursor1 locales pulseaudio python sudo x11vnc x11-xkb-utils xvfb \
            && useradd -m -d /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/bash", "/entrypoint.sh"]