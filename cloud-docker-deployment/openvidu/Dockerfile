FROM ubuntu:16.04
LABEL maintainer="openvidu@gmail.com"

ARG ov_version

# Openvidu recordings directory
RUN mkdir -p /opt/openvidu/recordings

# Install main components and Download Openvidu
RUN apt-get update && apt-get install --yes \
    --no-install-recommends \
    openjdk-8-jre \
    supervisor \
    coturn \
    redis-server \
    software-properties-common \
    gnupg \
    wget curl


COPY ./entrypoint.sh /usr/local/bin
COPY ./supervisor.conf /etc/supervisor/conf.d/openvidu.conf
COPY ./openvidu-server.sh /usr/local/bin/openvidu-server.sh

RUN wget -O /opt/openvidu/openvidu-server.jar https://github.com/OpenVidu/openvidu/releases/download/v$ov_version/openvidu-server-$ov_version.jar

RUN chmod +x /usr/local/bin/entrypoint.sh /usr/local/bin/openvidu-server.sh

ENV JAVA_OPTS="" \
    PROG_OPTS=""

CMD /usr/local/bin/entrypoint.sh