FROM python:alpine
MAINTAINER Isulew <netcookies@gmail.com>

ADD run.sh /app/

RUN curl -L $(curl -s https://api.github.com/repos/lukas2511/dehydrated/releases/latest | grep 'browser_download_url.*gz"' | cut -d\" -f4) | tar xz  \
    && mv dehydrated* app && rm -rf dehydrated* && cd app \
    && pip install dns-lexicon \
    && wget https://github.com/lukas2511/dehydrated/raw/master/docs/examples/config \
    && wget https://github.com/AnalogJ/lexicon/raw/master/examples/dehydrated.default.sh -O hook.sh \
    && sed -i 's/^#HOOK=.*/HOOK=hook.sh/g' config \
    && sed -i 's/^#KEY_ALGO/KEY_ALGO/g' config \
    && ln -s /usr/include/locale.h /usr/include/xlocale.h \
    && chmod +x run.sh

WORKDIR /app
ENTRYPOINT ["/app/run.sh"]
