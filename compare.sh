#!/bin/bash

PYTHON_PORT=8000
GOLANG_PORT=8080
ENDPOINT="/ping"

echo "Comparing ${ENDPOINT}"

# Python
echo -e "\nPython"
ts=$(date +%s%N)
curl -s http://localhost:${PYTHON_PORT}${ENDPOINT} > /dev/null
echo $((($(date +%s%N) - $ts)/1000000))ms

# Golang
echo -e "\nGolang"
ts=$(date +%s%N)
curl -s http://localhost:${GOLANG_PORT}${ENDPOINT} > /dev/null
echo $((($(date +%s%N) - $ts)/1000000))ms
