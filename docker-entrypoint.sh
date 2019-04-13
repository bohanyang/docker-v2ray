#!/usr/bin/env sh

set -e

if [ -z "$V2RAY_UUID" ]; then
  V2RAY_UUID=$(uuidgen)
  echo "Generated UUID: $V2RAY_UUID"
fi

if [ -z "$V2RAY_PATH" ]; then
  V2RAY_PATH=$(uuidgen | tr -d '-')
  echo "Generated Path: /$V2RAY_PATH"
fi

sed -i "s,23ad6b10-8d1a-40f7-8ad0-e3e35cd38297,$V2RAY_UUID," /etc/v2ray/config.json
sed -i "s,a52a2065e863a71ed0175cc93bb3ec17,$V2RAY_PATH," /etc/v2ray/config.json

exec "$@"
