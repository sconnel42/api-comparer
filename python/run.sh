options=()

options+=("server - Runs the Python server")
server() {
    poetry run python app.py
}

# TODO: Figure out how to show the option list if this is wrong
"$@"
