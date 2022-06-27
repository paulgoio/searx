# use alpine as base for searx and set workdir as well as env vars
FROM alpine:3.16

COPY ./requirements.txt .

# install build deps and git clone searxng as well as setting the version
RUN apk -U upgrade \
&& apk add --no-cache -t build-dependencies build-base py3-setuptools python3-dev libffi-dev libxslt-dev libxml2-dev openssl-dev tar \
&& apk add --no-cache ca-certificates su-exec python3 py3-pip libxml2 libxslt openssl tini uwsgi uwsgi-python3 brotli git \
&& pip install --upgrade pip wheel setuptools \
&& pip install --no-cache -r requirements.txt; \
apk del build-dependencies \
&& rm -rf /var/cache/apk/* /root/.cache
