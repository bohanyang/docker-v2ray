FROM v2ray/official:latest

RUN apk add --no-cache sed util-linux

COPY config.json /etc/v2ray/
COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]
