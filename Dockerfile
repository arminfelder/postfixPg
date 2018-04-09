FROM debian:stable-slim

RUN apt-get update \
    && apt-get install \
    postfix \
    postfix-pgsql -y \
    && apt-get autoremove -y \
    && apt-get clean

ADD run.sh .

VOLUME ["/etc/postfix"]

EXPOSE 25

CMD ["/run.sh"]
