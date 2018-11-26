#!/bin/sh

apt-get install -y python-pip python-setuptools openssl curl sed grep mktemp
rm -rf /root/dehydrated && git clone https://github.com/lukas2511/dehydrated.git /root/dehydrated
rm -rf /usr/local/sbin/dehydrated && ln -s /root/dehydrated/dehydrated /usr/local/sbin/dehydrated
pip install --upgrade pip setuptools
pip install --upgrade dns-lexicon
