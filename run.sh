DB_USER="postgres"
DB_PASS="samplepassword"
DB_HOST="localhost"
DB_PORT="5432"
DB_NAME="postgres"

options=()

options+=("start_db - Starts up the DB")
start_db() {
    docker compose up -d
}

options+=("stop_db - Stops the DB")
stop_db() {
    docker compose down
}

options+=("connect - Connect to the DB using psql")
connect() {
    psql postgresql://${DB_USER}:${DB_PASS}@${DB_HOST}:${DB_PORT}/${DB_NAME}
}

options+=("cleanup - Removes any DB resources")
cleanup() {
    # Stop the DB
    stop_db

    # Clean up any Docker data
    docker volume rm -f api-comparer_db
    docker network rm -f api-comparer_default
}

# TODO: Figure out how to show the option list if this is wrong
"$@"
