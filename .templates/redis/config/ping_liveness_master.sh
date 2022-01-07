#!/bin/bash
response=$(
  timeout -s 3 $1 \
  redis-cli \
    -h $REDIS_MASTER_HOST \
    -p $REDIS_MASTER_PORT_NUMBER \
    ping
)
if [ "$response" != "PONG" ] && [ "$response" != "LOADING Redis is loading the dataset in memory" ]; then
  echo "$response"
  exit 1
fi