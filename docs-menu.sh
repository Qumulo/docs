#!/bin/bash

# Rebuild the docs-builder container
rebuild_container() {
    echo "Rebuilding the docs-builder container..."
    docker build -f docker/build/Dockerfile -t docs-builder .
}

# Build HTML documentation by using Jekyll
build_html_docs() {
    echo "Building HTML documentation..."
    docker run --rm --user $(id -u):$(id -g) --name docs-container-build -v $(pwd):/src:rw docs-builder
}

# Build PDF documentation by using Jekyll and PrinceXML
build_pdf_docs() {
    echo "Building PDF documentation..."
    ./pdf-build.sh
}

# Build the documentation and serve it locally on port 4000 by using http.server
build_serve_docs_locally_python() {
    echo "Building documentation and serving it locally on port 4000 by using http.server..."
    docker run --rm --user $(id -u):$(id -g) --name docs-container-build -v $(pwd):/src:rw docs-builder && cd _site && python3 -m http.server 4000; cd ..
}

# Only serve the documenttion locally on port 4000 by using http.server
only_serve_docs_locally_python() {
    echo "Serving documentation locally on port 4000 by using http.server..."
    cd _site && python3 -m http.server 4000; cd ..
}

# Build the documentation and serve it locally on port 4000 by using Jekyll LiveReload
build_serve_docs_locally_jekyll() {
    echo "Serving documentation locally by using Jekyll LiveReload..."
    docker run -ti --rm --user $(id -u):$(id -g) --name docs-container-serve -v $(pwd):/src:rw -P --network host docs-builder serve
}

# Check documentation for link, script, and image errors by using HTML Proofer
check_docs_errors() {
    echo "Checking documentation for link, script, and image errors..."
    docker run --rm --user $(id -u):$(id -g) --name docs-container-check -v $(pwd):/src:rw docs-builder check
}

# Check documentation for spelling errors by using Hunspell
check_spelling_errors() {
    echo "Checking documentation for spelling errors..."
    docker run --rm --user $(id -u):$(id -g) --name docs-container-proof -v $(pwd):/src:rw docs-builder proof
}

while true; do
    echo -e "\033[1;33m🤖 Welcome to the Documentation Portal Repository\033[0m"
    echo ""
    echo "1. 🚧 Rebuild the docs-builder container"
    echo "2. ⚙️  Build HTML documentation"
    echo "3. ⚙️  Build PDF documentation (requires Prince XML)"
    echo "4. 🖥️  Only serve the documentation locally"
    echo "5. ⚙️  🖥️  Build the documentation and serve it locally"
    echo "6. ⚙️  🖥️  Build the documentation and serve it locally with LiveReload (can be unstable)"
    echo "7. 📋 Check the documentation for link, script, and image errors"
    echo "8. 📋 Check the documentation for spelling errors"
    echo "q. 👋 Quit"
    echo ""
    read -p $'\033[1;33mWhat would you like to do? \033[0m' choice

    case $choice in
        1) rebuild_container ;;
        2) build_html_docs ;;
        3) build_pdf_docs ;;
        4) only_serve_docs_locally_python ;;
        5) build_serve_docs_locally_python ;;
        6) build_serve_docs_locally_jekyll ;;
        7) check_docs_errors ;;
        8) check_spelling_errors ;;
        q) exit ;;
        *) echo "Enter a valid option." ;;
    esac
done
