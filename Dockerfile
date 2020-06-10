FROM bohan/v2ray-core:4.24.2

COPY config.json /etc/v2ray/

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 80
CMD ["v2ray", "-config=/etc/v2ray/config.json"]
