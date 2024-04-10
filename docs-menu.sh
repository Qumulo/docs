#!/bin/bash

sweep_toolchain() {
  ~/src/toolchain/qpkg.py sweep
}

no_toolchain() {
    export PATH=$(echo $PATH | sed "s|/opt/qumulo[^:]*:||g")
}

ignore_warnings() {
    echo -e "\033[1;33mNote: You can ignore any warnings about setting the locale or about GitHub API authentication.\033[0m"
}

ignore_locale() {
    echo -e "\033[1;33mNote: You can ignore any warnings about setting the locale.\033[0m"
}

# Check that the src repository exists
check_docs_internal_repo() {
    if [ ! -d ~/git/docs-internal ]; then
        echo "You must first clone the docs-internal repository to ~/git: https://github.com/Qumulo/docs-internal"
        echo "Exiting..."
        exit 1
    fi
}

# Check that the Vectara Ingest repository exists
check_vectara_ingest_repo() {
    if [ ! -d ~/git/vectara-ingest ]; then
        echo "You must first clone the Vectara Ingest repository to ~/git: https://github.com/Qumulo/vectara-ingest"
        echo "Exiting..."
        exit 1
    fi
}

# Check that the secrets.toml file exists
check_secrets_toml() {
    if [ ! -f ~/git/vectara-ingest/secrets.toml ]; then
        echo "To ingest data into Vectara, you must add secrets.toml to your Vectara Ingest directory"
        echo "and then add your API keys to secrets.toml in the following format:"
        echo
        echo "[general]"
        echo "api = 'vectara_api_value'"
        echo
        echo "[default]"
        echo "api_key=\"<IndexService API Key>\""
        echo
        echo "Exiting..."
        exit 1
    fi
}

# Check whether the user is running Python 2 or Python 3
check_python_version() {
    python_version=$(python -c 'import sys; print(sys.version_info[0])')
    if [ "$python_version" -lt 3 ]; then
        export PATH=$(echo $PATH | sed "s|/opt/qumulo[^:]*:||g")
    fi
}


# Install Docker and explain group changes
install_docker() {
  if ! command -v docker &> /dev/null; then
    echo "Docker is required for documentation builds. Install Docker? (y/n)"
    read -r answer
    if [ "$answer" = "y" ]; then
      echo "Installing Docker..."
      sudo apt-get update && sudo apt-get install -y docker.io
      sudo usermod -aG docker "$(whoami)"
      sudo service docker start
      echo "For the group change to take effect, you must log out of the system and then log back in."
    elif [ "$answer" = "n" ]; then
      echo "Can't continue without installing Docker. Exiting..."
      exit 1
    fi
  fi
}

# Install Noto Color Emoji required for documentation builds
install_noto_emoji() {
  if ! dpkg -l | grep -qw fonts-noto-color-emoji; then
    echo "fonts-noto-color-emoji is required for documentation builds. Install package? (y/n)"
    read -r answer
    if [ "$answer" = "y" ]; then
      echo "Installing fonts-noto-color-emoji..."
      sudo apt-get update && sudo apt-get install -y fonts-noto-color-emoji
    elif [ "$answer" = "n" ]; then
      echo "Continuing without installing fonts-noto-color-emoji..."
    fi
  fi
}

# Rebuild the docs-builder container
rebuild_container() {
    echo "Rebuilding the docs-builder container..."
    docker build -f docker/build/Dockerfile -t docs-builder .
}

# List CLI documentation with appended content
find_modified_cli(){
  echo "Searching for CLI documentation with manually appended content..."
  local flag_file=$(mktemp)
  find ~/git/docs-internal/qq-cli-command-guide -type f -name "*.md" | while IFS= read -r file; do
    start_line=$(grep -n -- '---' "$file" | sed '2q;d' | cut -d: -f1)
    if [ ! -z "$start_line" ]; then
        content=$(tail -n +$((start_line + 1)) "$file" | awk 'NF {if(count<5)print; count++} END {if(count>=5) print "..."}')
        if [[ $content =~ [^[:space:]] ]]; then
            # File found, delete the flag file
            rm -f "$flag_file"
            echo -e "\033[0;31m$file\033[0m"
            echo "$content"
            echo
        fi
    fi
  done
  if [ -f "$flag_file" ]; then
    echo "Can't find files with manually appended content."
    # Clean up the flag file
    rm -f "$flag_file"
  fi
}

# Function to check for the src repository
check_src_repo() {
    if [ ! -d ~/src ]; then
        echo "You must first clone the Vectara Ingest repository: https://qumulo.atlassian.net/wiki/spaces/EN/pages/1167851855/Manually+Checking+Out+Source"
        exit 1
    fi
}

# Regenerate CLI documentation
regen_cli_docs() {
    echo "Regenerating CLI documentation..."
    check_src_repo
    cd ~/src && hg up default && hg fetch && ~/src/tools/extract_cli_help.py --base-dir ~/git/docs-internal && cd -
}

# Build HTML documentation by using Jekyll
build_html_docs() {
    echo "Building HTML documentation..."
    ignore_warnings
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
    ignore_warnings
    docker run --rm --user $(id -u):$(id -g) --name docs-container-build -v $(pwd):/src:rw docs-builder && cd _site && python3 -m http.server 4000 && cd ..
}

# Only serve the documenttion locally on port 4000 by using http.server
only_serve_docs_locally_python() {
    echo "Serving documentation locally on port 4000 by using http.server..."
    cd _site && python3 -m http.server 4000 && cd ..
}

# Build the documentation and serve it locally on port 4000 by using Jekyll LiveReload
build_serve_docs_locally_jekyll() {
    echo "Building documentation and serving it locally by using Jekyll LiveReload..."
    ignore_warnings
    docker run -ti --rm --user $(id -u):$(id -g) --name docs-container-serve -v $(pwd):/src:rw -P --network host docs-builder serve
}

# Check documentation for link, script, and image errors by using HTML Proofer
check_docs_errors() {
    echo "Checking documentation for link, script, and image errors..."
    ignore_locale
    docker run --rm --user $(id -u):$(id -g) --name docs-container-check -v $(pwd):/src:rw docs-builder check
}

# Check documentation for spelling errors by using Hunspell
check_spelling_errors() {
    echo "Checking documentation for spelling errors..."
    ignore_locale
    docker run --rm --user $(id -u):$(id -g) --name docs-container-proof -v $(pwd):/src:rw docs-builder proof
}

# Ingest documentation
ingest_documentation() {
    local yaml_file="$1"
    if [ -z "$yaml_file" ]; then
        echo "You must specify a YAML file."
        exit 1
    fi
    cd ~/git/vectara-ingest && ./run.sh "config/$yaml_file" default && cd -
}

# Ingest docs.qumulo.com into Vectara corpus 2
ingest_docs_portal() {
    echo "Ingesting docs.qumulo.com into Vectara corpus 2..."
    no_toolchain
    check_vectara_ingest_repo
    check_secrets_toml
    check_python_version
    ingest_documentation "qumulo-documentation-portal-v3.yaml"
}

# Ingest care.qumulo.com into Vectara corpus 4
ingest_care_portal() {
    echo "Ingesting cqre.qumulo.com into Vectara..."
    no_toolchain
    check_vectara_ingest_repo
    check_secrets_toml
    check_python_version
    ingest_documentation "qumulo-care-v3.yaml"
}

# Ingest qumulo.com into Vectara corpus 5
ingest_corp_site() {
    echo "Ingesting docs.qumulo.com into Vectara..."
    no_toolchain
    check_vectara_ingest_repo
    check_secrets_toml
    check_python_version
    ingest_documentation "qumulo-main-v3.yaml"
}

# Check ingestion status
check_ingestion_status() {
    docker logs -f vingest
}

check_docs_internal_repo
install_docker
install_noto_emoji

while true; do
    echo
    echo -e "\033[1;33m🤖 Welcome to the Documentation Portal Repository\033[0m"
    echo
    echo "1.  🚧 Rebuild docs-builder container"
    echo "2.  ⚙️  Regenerate CLI documentation"
    echo "3.  🆕 List CLI documentation with appended content"
    echo "4.  ⚙️  Build HTML documentation"
    echo "5.  ⚙️  Build PDF documentation"
    echo "6.  🖥️  Only serve documentation locally"
    echo "7.  🖥️  Build documentation and serve it locally"
    echo "8.  🖥️  Build documentation and serve it locally with LiveReload (can be unstable)"
    echo "9.  📋 Check documentation for link, script, and image errors"
    echo "10. 📋 Check documentation for spelling errors"
    echo "11. 🧹 Sweep Toolchain"
    echo "12. 🔍 Ingest docs.qumulo.com into Vectara"
    echo "13. 🔍 Ingest care.qumulo.com into Vectara"
    echo "14. 🔍 Ingest qumulo.com into Vectara"
    echo "15. 📋 Check ingestion status"
    echo "q.  👋 Quit"
    echo
    read -p $'\033[1;33mWhat would you like to do? \033[0m' choice

    case $choice in
        1) rebuild_container ;;
        2) regen_cli_docs ;;
        3) find_modified_cli ;;
        4) build_html_docs ;;
        5) build_pdf_docs ;;
        6) only_serve_docs_locally_python ;;
        7) build_serve_docs_locally_python ;;
        8) build_serve_docs_locally_jekyll ;;
        9) check_docs_errors ;;
        10) check_spelling_errors ;;
        11) sweep_toolchain ;;
        12) ingest_docs_portal ;;
        13) ingest_care_portal ;;
        14) ingest_corp_site ;;
        15) check_ingestion_status ;;
        q) exit ;;
        *) echo "You must enter a valid option." ;;
    esac
done
