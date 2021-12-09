#!/bin/bash
  response=$(
  timeout -s 3 $1 \
  redis-cli \
    -h $REDIS_MASTER_HOST \
    -p $REDIS_MASTER_PORT_NUMBER \
    ping
)
if [ "$response" != "PONG" ]; then
  echo "$response"
  exit 1
fi