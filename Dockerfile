FROM azul/zulu-openjdk:11.0.19-11.64.19-jre

LABEL author="alvin0319" maintainer="me@minjae.dev"

RUN apt update -y

RUN apt install -y curl ca-certificates openssl git tar bash sqlite fontconfig \
    && adduser --disabled-password --home /home/container container


USER container
ENV USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]

