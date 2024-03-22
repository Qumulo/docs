#!/bin/bash

# Function to rebuild the docs-builder container
rebuild_container() {
    echo "Rebuilding the docs-builder container..."
    docker build -f docker/build/Dockerfile -t docs-builder .
}

# Function to build HTML documentation
build_html_docs() {
    echo "Building HTML documentation..."
    docker run --rm --user $(id -u):$(id -g) --name docs-container-build -v $(pwd):/src:rw docs-builder
}

# Function to build PDF documentation
build_pdf_docs() {
    echo "Building PDF documentation..."
    ./pdf-build.sh
}

# Function to serve documentation locally
serve_docs_locally() {
    echo "Serving documentation locally..."
    docker run --rm --user $(id -u):$(id -g) --name docs-container-build -v $(pwd):/src:rw docs-builder && cd _site && python3 -m http.server 4000; cd ..
}

# Function to check documentation for link, script, and image errors
check_docs_errors() {
    echo "Checking documentation for link, script, and image errors..."
    docker run --rm --user $(id -u):$(id -g) --name docs-container-check -v $(pwd):/src:rw docs-builder check
}

# Function to check documentation for spelling errors
check_spelling_errors() {
    echo "Checking documentation for spelling errors..."
    docker run --rm --user $(id -u):$(id -g) --name docs-container-proof -v $(pwd):/src:rw docs-builder proof
}

# Main menu
while true; do
    echo -e "\033[1;33m🤖 Welcome to the Documentation Portal Repository\033[0m"
    echo ""
    echo "1. Rebuild the docs-builder container"
    echo "2. Build HTML documentation"
    echo "3. Build PDF documentation"
    echo "4. Serve the documentation locally"
    echo "5. Check the documentation for link, script, and image errors"
    echo "6. Check the documentation for spelling errors"
    echo "q. Quit"
    echo ""
    read -p $'\033[1;33mWhat would you like to do? \033[0m' choice

    case $choice in
        1) rebuild_container ;;
        2) build_html_docs ;;
        3) build_pdf_docs ;;
        4) serve_docs_locally ;;
        5) check_docs_errors ;;
        6) check_spelling_errors ;;
        q) exit ;;
        *) echo "Enter a valid option." ;;
    esac
done
