#!/usr/bin/env bash

cp /etc/resolv.conf /var/spool/postfix/etc/ &&

exec postfix start-fg
