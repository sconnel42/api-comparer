#!/bin/bash

PYTHON_PORT=8000
GOLANG_PORT=8080
ENDPOINT="/deep-ping"

# A function to check if the server is running
is_server_running() {
    output=$(lsof -i -P -n | grep $2)
    if [ -z "${output}" ]; then
        echo "No $1 server running on port $2"
        exit 1
    fi
}

# A function to check if all the servers are running
are_servers_running() {
    declare -a servers
    servers[0]="Python;${PYTHON_PORT}"
    servers[1]="Golang;${GOLANG_PORT}"
    for server in "${servers[@]}"
    do
        # Extract variables
        IFS=";" read -r -a arr <<< "${server}"
        server_name="${arr[0]}"
        port="${arr[1]}"

        # Check if this server is running
        is_server_running ${server_name} ${port}
    done
}

# Setup
./run.sh start_db
are_servers_running

# Now compare them
echo -e "\nComparing ${ENDPOINT}"

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
