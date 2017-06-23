FROM python:alpine
MAINTAINER Isulew <netcookies@gmail.com>

RUN mkdir /app && cd /app \
 && apk add --update alpine-sdk bash libffi-dev openssl-dev git \
 && git clone https://github.com/lukas2511/dehydrated  \
 && cd dehydrated \
 && git clone https://github.com/ftao/letsencrypt-dnspod-hook hooks/dnspod \
 && pip --no-cache-dir install -r hooks/dnspod/requirements.txt \
 && ln -s /usr/include/locale.h /usr/include/xlocale.h \
 && rm -rf /var/cache/apk/*

WORKDIR /app/dehydrated
ENTRYPOINT ["/app/dehydrated/dehydrated"]
