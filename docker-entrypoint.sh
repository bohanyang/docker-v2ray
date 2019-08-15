#!/usr/bin/env sh

set -e

if [ -n "$V2RAY_CONFIG_URL" ]; then
  wget -O /etc/v2ray/config.json "$V2RAY_CONFIG_URL"
else
  if [ -z "$V2RAY_UUID" ]; then
    V2RAY_UUID="$(cat /proc/sys/kernel/random/uuid)"
    echo "UUID: $V2RAY_UUID"
  fi

  sed -i "s,23ad6b10-8d1a-40f7-8ad0-e3e35cd38297,$V2RAY_UUID," /etc/v2ray/config.json

  if [ -n "$V2RAY_PATH" ]; then
    sed -i "s,/v2ray,$V2RAY_PATH," /etc/v2ray/config.json
  fi
fi

exec "$@"
