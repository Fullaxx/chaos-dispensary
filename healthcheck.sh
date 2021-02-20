#!/bin/bash

CHAOS=`curl http://127.0.0.1:8080/status/ | grep Chaos | awk '{print $2}'`

if [ -z "${CHAOS}" ]; then
  exit 1
fi

if [ "${CHAOS}" == "0" ]; then
  exit 2
fi

exit 0
