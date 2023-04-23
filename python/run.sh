# DB
export DB_USER="postgres"
export DB_PASS="samplepassword"
export DB_HOST="localhost"
export DB_PORT="5432"
export DB_NAME="postgres"
export DATABASE_URL="postgresql://${DB_USER}:${DB_PASS}@${DB_HOST}:${DB_PORT}/${DB_NAME}"


options=()

options+=("install - Installs dependencies")
install() {
    poetry install
}

options+=("refmt - Reformats code")
refmt() {
    install
    poetry run black .
}

options+=("server - Runs the Python server")
server() {
    install

    pushd api_comparer_python > /dev/null
    poetry run uvicorn main:app --reload
    popd > /dev/null
}

# TODO: Figure out how to show the option list if this is wrong
"$@"
