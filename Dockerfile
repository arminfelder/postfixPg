FROM debian:stable-slim

RUN apt-get update \
    && apt-get install \
    postfix \
    postfix-pgsql -y \
    && apt-get autoremove -y \
    && apt-get clean

RUN systemctl enable postfix \
    && service postfix start

VOLUME ["/etc/postfix"]

EXPOSE 25

CMD ["/usr/sbin/postfix","start"]
