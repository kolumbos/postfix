#!/bin/sh

echo "setting configuration"
envsubst '$DOMAIN,$HOSTNAME,$TRANSPORT,$MILTER_DEFAULT,$INCOMING_MILTERS,$OUTGOING_MILTERS' < /etc/postfix/main.cf.tpl > /etc/postfix/main.cf

echo "updating aliases"
/usr/bin/newaliases

exec "$@"
