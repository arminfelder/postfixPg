FROM debian:stable-slim

RUN apt-get update \
    && apt-get install \
    postfix \
    postfix-pgsql -y

RUN systemctl enable postfix \
    && service postfix start

VOLUME ["/etc/postfix"]

EXPOSE 25

RUN ["/bin/bash"]
