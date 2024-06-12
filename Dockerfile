FROM alpine:3.20

# Install python/pip
ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN rm /usr/lib/python*/EXTERNALLY-MANAGED
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools
RUN pip3 install requests
RUN pip3 install ruamel.yaml

RUN apk --update add curl git openssl && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*
