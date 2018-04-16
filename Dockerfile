FROM python:alpine
MAINTAINER Isulew <netcookies@gmail.com>

RUN apk add --update alpine-sdk bash libffi-dev openssl-dev git \
    && curl -L $(curl -s https://api.github.com/repos/lukas2511/dehydrated/releases/latest | grep 'browser_download_url.*gz"' | cut -d\" -f4) | tar xz  \
    && mv dehydrated* app && rm -rf dehydrated* && cd app \
    && pip install dns-lexicon \
    && wget https://github.com/lukas2511/dehydrated/raw/master/docs/examples/config \
    && wget https://github.com/AnalogJ/lexicon/raw/master/examples/dehydrated.default.sh -O hook.sh \
    && sed -i 's/^#HOOK.*/HOOK=hook.sh/g' config \
    && sed -i 's/^#KEY_ALGO/KEY_ALGO/g' config \
    && sed -i 's/^#CHALLENGETYPE.*/CHALLENGETYPE=$CHALLENGETYPE/g' config \
    && sed -i 's/^#CONTACT_MAIL/CONTACT_MAIL=$CONTACL_MAIL/g' config \
    && ln -s /usr/include/locale.h /usr/include/xlocale.h \
    && rm -rf /var/cache/apk/*

WORKDIR /app
ENTRYPOINT ["/app/dehydrated"]
