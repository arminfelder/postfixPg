FROM debian:stable-slim

RUN apt-get update \
    && apt-get install \
    postfix \
    postfix-pgsql \
    syslog-ng -y --force-yes \ 
    && apt-get autoremove -y \
    && apt-get clean

VOLUME ["/etc/postfix"]

EXPOSE 25
EXPOSE 465
EXPOSE 587

CMD ["sh", "-c", "service syslog-ng start ; service postfix start ; tail -F /var/log/mail.log"]
