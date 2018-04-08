FROM debian:stable-slim

RUN apt-get update \
    && apt-get install \
    postfix \
    postfix-pgsql -y

VOLUME ["/etc/postfix"]

RUN ["/bin/bash"]
