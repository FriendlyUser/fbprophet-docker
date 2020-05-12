FROM alpine:3.8

LABEL maintainer="davidli012345@gmail.com"

RUN apk add --no-cache python3 python3-dev && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
    rm -r /root/.cache

RUN apk --update add --no-cache gcc freetype-dev libpng-dev

RUN apk add --no-cache --virtual .build-deps \
    musl-dev \
    g++

RUN pip install --no-cache-dir fbprophet


# removing dependencies
RUN apk del .build-deps