#!/bin/bash
response=$(
  timeout -s 3 $1 \
  redis-cli \
    -h localhost \
    -p $REDIS_PORT \
    ping
)
if [ "$response" != "PONG" ]; then
  echo "$response"
  exit 1
fi