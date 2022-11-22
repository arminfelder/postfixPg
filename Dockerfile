FROM debian:bullseye-slim

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true apt-get install \
    postfix \
    postfix-pgsql \
    syslog-ng -y --force-yes --no-install-recommends \
    && apt-get autoremove -y \
    && apt-get clean

COPY run.sh /run.sh

RUN chmod +x /run.sh

VOLUME ["/etc/postfix"]

EXPOSE 25
EXPOSE 465
EXPOSE 587

CMD ["/run.sh"]
