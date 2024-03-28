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

# Function to check for the Vectara Ingest repository
check_vectara_ingest_repo() {
    if [ ! -d ~/git/vectara-ingest ]; then
        echo "You must first clone the Vectara Ingest repository: https://github.com/Qumulo/vectara-ingest"
        return 1
    else
        return 0
    fi
}

# Function to check for the secrets.toml file
check_secrets_toml() {
    if [ ! -f ~/git/vectara-ingest/secrets.toml ]; then
        echo
        echo "To ingest data into Vectara, you must add secrets.toml to your Vectara Ingest directory"
        echo "and then add your API keys to secrets.toml in the following format:"
        echo
        echo "[general]"
        echo "api = 'vectara_api_value'"
        echo
        echo "[default]"
        echo "api_key=\"<IndexService API Key>\""
        echo
        return 1
    else
        return 0
    fi
}

# Ingest docs.qumulo.com into Vectara corpus 2
ingest_docs_portal() {
    echo "Ingesting docs.qumulo.com into Vectara corpus 2..."

    if ! check_vectara_ingest_repo; then
        return 1
    fi

    if ! check_secrets_toml; then
        return 1
    fi    

    python_version=$(python -c 'import sys; print(sys.version_info[0])')
    
    if [ "$python_version" -lt 3 ]; then
        export PATH=$(echo $PATH | sed "s|/opt/qumulo[^:]*:||g")
    fi
 
    cd ~/git/vectara-ingest; ./run.sh config/qumulo-documentation-portal-v2.yaml default; cd -
}

# Ingest care.qumulo.com into Vectara corpus 4
ingest_docs_portal() {
    echo "Ingesting docs.qumulo.com into Vectara..."

    if ! check_vectara_ingest_repo; then
        return 1
    fi

    if ! check_secrets_toml; then
        return 1
    fi

    python_version=$(python -c 'import sys; print(sys.version_info[0])')

    if [ "$python_version" -lt 3 ]; then
        export PATH=$(echo $PATH | sed "s|/opt/qumulo[^:]*:||g")
    fi

    cd ~/git/vectara-ingest; ./run.sh config/qumulo-care-v2.yaml default; cd -
}

# Ingest qumulo.com into Vectara corpus 5
ingest_corp_site() {
    echo "Ingesting docs.qumulo.com into Vectara..."

    if ! check_vectara_ingest_repo; then
        return 1
    fi

    if ! check_secrets_toml; then
        return 1
    fi

    python_version=$(python -c 'import sys; print(sys.version_info[0])')

    if [ "$python_version" -lt 3 ]; then
        export PATH=$(echo $PATH | sed "s|/opt/qumulo[^:]*:||g")
    fi

    cd ~/git/vectara-ingest; ./run.sh config/qumulo-main-v2.yaml default; cd -
}

# Chedk ingestion status
check_ingestion_status() {
    docker logs -f vingest
}

while true; do
    echo -e "\033[1;33m🤖 Welcome to the Documentation Portal Repository\033[0m"
    echo
    echo "1.  🚧 Rebuild the docs-builder container"
    echo "2.  ⚙️  Build HTML documentation"
    echo "3.  ⚙️  Build PDF documentation"
    echo "4.  🖥️  Only serve the documentation locally"
    echo "5.  ⚙️  🖥️  Build the documentation and serve it locally"
    echo "6.  ⚙️  🖥️  Build the documentation and serve it locally with LiveReload (can be unstable)"
    echo "7.  📋 Check the documentation for link, script, and image errors"
    echo "8.  📋 Check the documentation for spelling errors"
    echo "9.  🔍 Ingest docs.qumulo.com into Vectara"
    echo "10. 🔍 Ingest care.qumulo.com into Vectara"
    echo "11. 🔍 Ingest qumulo.com into Vectara"
    echo "12. 📋 Check ingestion status"
    echo "q.  👋 Quit"
    echo
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
        9) ingest_docs_portal ;;
        10) ingest_care_portal ;;
        11) ingest_corp_site ;;
        12) check_ingestion_status ;;
        q) exit ;;
        *) echo "Enter a valid option." ;;
    esac
done
