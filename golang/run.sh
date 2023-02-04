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
    go run app.go
}

# TODO: Figure out how to show the option list if this is wrong
"$@"
