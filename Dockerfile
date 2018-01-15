FROM python:alpine
MAINTAINER Isulew <netcookies@gmail.com>

RUN apk add --update alpine-sdk bash libffi-dev openssl-dev git \
 && curl -L $(curl -s https://api.github.com/repos/lukas2511/dehydrated/releases/latest | grep 'tarball_' | cut -d\" -f4) | tar xz  \
 && mv lukas2511-dehydrated* app && cd app \
 && git clone https://github.com/ftao/letsencrypt-dnspod-hook hooks/dnspod \
 && pip --no-cache-dir install -r hooks/dnspod/requirements.txt \
 && ln -s /usr/include/locale.h /usr/include/xlocale.h \
 && rm -rf /var/cache/apk/*

WORKDIR /app
ENTRYPOINT ["/app/dehydrated"]
