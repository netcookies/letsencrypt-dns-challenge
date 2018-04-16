#!/bin/sh

if [ ! -d /app/accounts ] ; then
  mkdir -p /app/accounts
fi

if [ ! -d /app/certs ] ; then
  mkdir -p /app/certs
fi

if [ ! -d /app/chains ] ; then
  mkdir -p /app/chains
fi

if [ -z "$CHALLENGETYPE" ]; then
    echo 'The following environment variables need to set: WP_DOMAIN '
    exit 1
fi

if [ -z "$CONTACT_EMAIL" ]; then
    echo 'The following environment variables need to set: WP_DOMAIN '
    exit 1
fi

if [ -z "$PROVIDER" ]; then
    echo 'The following environment variables need to set: WP_DOMAIN '
    exit 1
fi

sed -i "s/^#CHALLENGETYPE=.*/CHALLENGETYPE=${CHALLENGETYPE}/g" config
sed -i "s/^#CONTACT_EMAIL=.*/CONTACT_EMAIL=${CONTACT_EMAIL}/g" config

/app/dehydrated $@
