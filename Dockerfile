FROM debian:stable-slim

RUN apt-get update \
    && apt-get install \
    postfix \
    postfix-pgsql \
    rsyslog \
    syslog-ng -y \
    && apt-get autoremove -y \
    && apt-get clean

VOLUME ["/etc/postfix"]

EXPOSE 25
EXPOSE 465

CMD ["sh", "-c", "service syslog-ng start ; service postfix start ; tail -F /var/log/mail.log"]
