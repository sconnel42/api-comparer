options=()

options+=("refmt - Reformats code")
refmt() {
    poetry run black .
}

options+=("server - Runs the Python server")
server() {
    pushd api_comparer_python > /dev/null
    poetry run uvicorn main:app --reload
    popd > /dev/null
}

# TODO: Figure out how to show the option list if this is wrong
"$@"
