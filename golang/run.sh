# DB
export DB_USER="postgres"
export DB_PASS="samplepassword"
export DB_HOST="localhost"
export DB_PORT="5432"
export DB_NAME="postgres"
export DATABASE_URL="postgresql://${DB_USER}:${DB_PASS}@${DB_HOST}:${DB_PORT}/${DB_NAME}"

# Gin
export PORT=8080
export GIN_MODE=debug

options=()

options+=("refmt - Reformats code")
refmt() {
    go fmt
}

options+=("server - Runs the Go server")
server() {
    # http://localhost:${PORT}
    go run *.go
}

# TODO: Figure out how to show the option list if this is wrong
"$@"
