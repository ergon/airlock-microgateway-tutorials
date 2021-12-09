#!/bin/bash
response=$(
  timeout -s 3 $1 \
  redis-cli \
    -h localhost \
    -p $REDIS_PORT \
    ping
)
if [ "$response" != "PONG" ] && [ "$response" != "LOADING Redis is loading the dataset in memory" ]; then
  echo "$response"
  exit 1
fi