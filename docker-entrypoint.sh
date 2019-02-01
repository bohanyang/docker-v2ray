#!/usr/bin/env sh

set -e

if [ -z "$V2RAY_UUID" ]; then
  V2RAY_UUID=$(uuidgen)
  echo "Generated UUID: $V2RAY_UUID"
fi

sed -i "s,23ad6b10-8d1a-40f7-8ad0-e3e35cd38297,$V2RAY_UUID," /etc/v2ray/config.json

exec "$@"
