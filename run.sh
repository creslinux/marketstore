#!/usr/bin/env bash

# Start dnsmasq
exec dnsmasq --no-daemon -D
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start dnsmasq: $status"
  exit $status
fi

# Start marketstore
marketstore start --config  /etc/mkts.yml -D
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start marketstore: $status"
  exit $status
fi

# Check processe are running once per minute
# Otherwise it loops forever, waking up every 60 seconds
while sleep 60; do
  ps aux |grep dnsmasq |grep -q -v grep
  PROCESS_1_STATUS=$?

  ps aux |grep marketstore |grep -q -v grep
  PROCESS_2_STATUS=$?

  # If the greps above find anything, they exit with 0 status
  # If they are not both 0, then something is wrong
  if [ $PROCESS_1_STATUS -ne 0 -o $PROCESS_2_STATUS -ne 0 ]; then
    echo "One of the processes has already exited."
    exit 1
  fi
done