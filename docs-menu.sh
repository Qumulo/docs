#!/bin/bash

check_environment() {
    eval $(~/src/environment) 2>&1
    if [[ $? -ne 0 ]]; then
        echo "Detected an error while running environment script. Remediating toolchain..."
        cd ~/src
        hg up default && hg fetch && hg prebuild
    fi
}

check_symlinks() {
    local git_dir="$HOME/git"
    local docs_symlink="$git_dir/docs-internal"
    local vectara_symlink="$git_dir/vectara-ingest"

    # Detect current script directory as default repo location
    local script_path
    script_path="$(realpath "$0")"
    local default_repo_dir
    default_repo_dir="$(dirname "$script_path")"
    local parent_dir
    parent_dir="$(dirname "$default_repo_dir")"

    # Ensure ~/git exists
    if [[ ! -d "$git_dir" ]]; then
        read -p "Directory $git_dir does not exist. Create it? (y/n): " create_git
        if [[ "$create_git" == "y" ]]; then
            mkdir -p "$git_dir"
            echo "Created $git_dir."
        elif [[ "$create_git" == "n" ]]; then
            echo "Skipping directory creation. Exiting."
            return 1
        fi
    fi

    # Check and create docs-internal symlink
    if [[ ! -L "$docs_symlink" ]]; then
        read -p "Create symlink for $docs_symlink? Use default path ($default_repo_dir)? (y/n): " create_docs
        if [[ "$create_docs" == "y" ]]; then
            ln -s "$default_repo_dir" "$docs_symlink"
            echo "Created symlink $docs_symlink -> $default_repo_dir."
        elif [[ "$create_docs" == "n" ]]; then
            read -p "Enter the full path of the docs-internal repo: " docs_path
            ln -s "$docs_path" "$docs_symlink"
            echo "Created symlink $docs_symlink -> $docs_path."
        fi
    fi

    # Check and create vectara-ingest symlink
    if [[ ! -L "$vectara_symlink" ]]; then
        read -p "Create symlink for $vectara_symlink? Use default path ($parent_dir/vectara-ingest)? (y/n): " create_vectara
        if [[ "$create_vectara" == "y" ]]; then
            ln -s "$parent_dir/vectara-ingest" "$vectara_symlink"
            echo "Created symlink $vectara_symlink -> $parent_dir/vectara-ingest."
        elif [[ "$create_vectara" == "n" ]]; then
            read -p "Enter the full path of the vectara-ingest repo: " vectara_path
            ln -s "$vectara_path" "$vectara_symlink"
            echo "Created symlink $vectara_symlink -> $vectara_path."
        fi
    fi
}

global_docs_menu() {
    # If 'dm' already exists, exit silently
    [[ -f "$HOME/.local/bin/dm" ]] && return

    echo "Making docs-menu.sh globally accessible as 'dm'..."

    mkdir -p ~/.local/bin
    chmod +x ~/git/docs-internal/docs-menu.sh

    # Create the 'dm' wrapper script
    echo '#!/bin/bash' > ~/.local/bin/dm
    echo '"$HOME/git/docs-internal/docs-menu.sh" "$@"' >> ~/.local/bin/dm
    chmod +x ~/.local/bin/dm

    # Ensure ~/.local/bin is in PATH
    if ! echo "$PATH" | grep -q "$HOME/.local/bin"; then
        echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
        export PATH="$HOME/.local/bin:$PATH"
        echo "Added ~/.local/bin to PATH. Restart your shell or run 'source ~/.bashrc' to apply."
    fi

    echo "'dm' is now globally accessible. You can run it by typing: dm"
}

start_in_docs_dir() {
    cd ~/git/docs-internal
}

sweep_toolchain() {
    ~/src/toolchain/qpkg.py sweep
}

prune_docker() {
    start_in_docs_dir
    docker builder prune && docker image prune && docker container prune
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
        echo "[default]"
        echo "api_key=\"<IndexService API Key>\""
        echo
        return 1
    fi
}

# Check that the Qumulo configuration files exist
check_qumulo_config_files(){
    if ! ls ~/git/vectara-ingest/config/qumulo-*.yaml >/dev/null 2>&1; then
        echo "To ingest data into Vectara, you must add qumulo-*.yaml files to the config/ subdirectory"
        echo "of your Vectara Ingest directory."
        echo
        return 1
    fi
}

# Refresh Vectara Ingest repo
refresh_vectara_ingest_repo() {
    start_in_docs_dir
    echo "Refreshing the vectara-ingest repository requires synchronizing our fork."
    echo -e "\e[31mThis removes all modifications from the repository. Continue? (y/n)\e[0m"
    read -r answer
    if [ "$answer" = "y" ]; then
        check_vectara_ingest_repo

        cd ~/git/vectara-ingest || { echo "Couldn't find ~/git/vectara-ingest. Clone the repository and add a symlink."; exit 1; }

        echo "Pulling down latest updates..."
        git checkout main
        git remote add upstream https://github.com/vectara/vectara-ingest >/dev/null 2>&1
        git fetch upstream
        git reset --hard upstream/main
        git push --force origin main
        git checkout local-config
        git fetch origin local-config

        LOCAL=$(git rev-parse @)
        REMOTE=$(git rev-parse origin/local-config)
        BASE=$(git merge-base @ origin/local-config)

        if [ "$LOCAL" != "$REMOTE" ]; then
          echo "Your local-config branch has diverged from origin/local-config."
          echo -e "\e[31mTo stop without discarding changes to your local configuration files, select 'n'.\e[0m"
          echo -e "\e[31mTo discard changes to your local configuration files, select 'y'.\e[0m"
          echo -e "\e[31mContinue? (y/n)\e[0m"
          read -r overwrite_answer
          if [ "$overwrite_answer" = "y" ]; then
            echo "Importing configuration files..."
            git reset --hard origin/local-config
          else
            echo "Exiting..."
            exit 1
          fi
        fi

        git merge main

        echo "Preparing repository..."
        chmod +x run.sh

    elif [ "$answer" = "n" ]; then
        echo
        echo "Exiting..."
        exit 1
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
            echo -e "\e[31mFor the group change to take effect, you must log out of the system and then log back in.\e[0m"
            echo -e "\e[31mLog out now? (y/n)\e[0m"
            read -r logout_now
            if [ "$logout_now" = "y" ]; then
                echo "Logging out..."
                pkill -KILL -u "$(whoami)"
            else
                echo "Remember to log out and then log back in later."
            fi
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

# Rebuild the Ruby gems
rebuild_ruby_gems() {
    start_in_docs_dir
    echo "Rebuilding the ruby gems..."
    docker run -ti --user $(id -u):$(id -g) --entrypoint /bin/bash -v $(pwd):/src docs-builder -c "bundle update --bundler; bundle install"
}

# Rebuild the docs-builder container
rebuild_container() {
    start_in_docs_dir
    echo "Rebuilding the docs-builder container..."
    docker build -f docker/build/Dockerfile -t docs-builder .
}

# Rebuild the docs-container-check container
rebuild_check_container() {
    start_in_docs_dir
    echo "Rebuilding the docs-container-check container..."
    docker build -f docker/build/Dockerfile -t docs-container-check .
}

# List CLI documentation with appended content
find_modified_cli(){
    start_in_docs_dir
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

# Check that the ~/src repository exists
check_src_repo() {
    if [ ! -d ~/src ]; then
        echo "You must first bootstrap the dev environment."
        echo "For more information, see"
        echo "https://qumulo.atlassian.net/wiki/spaces/EN/pages/1167851855/Manually+Checking+Out+Source#Bootstrap-the-DEV-environment"
        exit 1
    fi
}

# Check that the SSH keys are added to the agent
check_ssh_keys() {
    if ! ssh-add -l &>/dev/null; then
        echo "You must add SSH keys to the agent."
        echo "For more information, see:"
        echo "https://qumulo.atlassian.net/wiki/spaces/EN/pages/590414149/Dev+Environment+Setup#Create-an-SSH-key-pair-and-Request-Access-to-Mercurial"
        exit 1
    fi
}

# Regenerate CLI documentation
regen_cli_docs() {
    start_in_docs_dir
    check_src_repo
    check_ssh_keys
    while true; do
        read -p "Generate the current (c) or future (f) version of the CLI docs? " version_choice
        if [ "$version_choice" = "c" ]; then
            echo "Regenerating current CLI documentation from default branch..."
            cd ~/src && hg up default && hg fetch && ./tools/extract_cli_help.py --base-dir ~/git/docs-internal && cd -
            break
        elif [ "$version_choice" = "f" ]; then
            while true; do
                read -p "Enter the Qumulo Core release number in N.N.N format (for example, 7.1.2): " version_number
                if [[ $version_number =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
                    echo "Regenerating CLI documentation from release-$version_number branch..."
                    cd ~/src && hg up default && hg fetch && hg up release-$version_number && ./tools/extract_cli_help.py --base-dir ~/git/docs-internal && cd -
                    break 2
                else
                    echo "Enter a release version in the N.N.N format, where N is a number."
                fi
            done
        else
            echo "Invalid choice. Enter 'c' for the current version or 'f' for a future version."
        fi
    done
}

# Regenerate API documentation
regen_api_docs() {
    start_in_docs_dir
    check_src_repo
    echo "Building API documentation from the Music cluster..."
    python3 tools/gen-api.py
}

# Build HTML documentation by using Jekyll
build_html_docs() {
    start_in_docs_dir
    echo "Building HTML documentation..."
    ignore_warnings
    docker run --rm --user $(id -u):$(id -g) --name docs-container-build -v $(pwd):/src:rw docs-builder
}

# Build PDF documentation by using Jekyll and PrinceXML
build_pdf_docs() {
    start_in_docs_dir
    echo "Building PDF documentation..."
    ./tools/pdf-build.sh
}

# Build the documentation and serve it locally by using Tailscale
build_serve_docs_locally_tailscale() {
    start_in_docs_dir
    echo -e "Building documentation and serving it locally on \e[31m$(hostname).qumulo.ts.net\e[0m by using Tailscale..."
    ignore_warnings
    docker run --rm --user $(id -u):$(id -g) --name docs-container-build -v $(pwd):/src:rw docs-builder && cd _site && sudo tailscale serve $PWD && cd ..
}

# Build the documentation and serve it locally on port 4000 by using Python
build_serve_docs_locally_python() {
    start_in_docs_dir
    echo -e "Building documentation and serving it locally on \e[31m$(hostname):4000\e[0m by using Python..."
    ignore_warnings
    docker run --rm --user $(id -u):$(id -g) --name docs-container-build -v $(pwd):/src:rw docs-builder && cd _site && python3 -m http.server 4000 && cd ..
}

# Build the documentation and serve it locally on port 4000 by using Jekyll LiveReload
build_serve_docs_locally_jekyll() {
    start_in_docs_dir
    echo "Building documentation and serving it locally on \e[31m$(hostname):4000\e[0m by using Jekyll LiveReload..."
    ignore_warnings
    docker run -ti --rm --user $(id -u):$(id -g) --name docs-container-serve -v $(pwd):/src:rw -P --network host docs-builder serve
}

# Only serve the documentation locally on port 4000 by using http.server
only_serve_docs_locally_python() {
    start_in_docs_dir
    echo -e "Serving documentation locally on \e[31m$(hostname):4000\e[0m by using Python..."
    echo -e "\e[31m⚠️  Caution: This method of running an HTTP server is insecure.\e[0m"
    cd _site && python3 -m http.server 4000 && cd ..
}

# Only serve the documentation locally by using Tailscale
only_serve_docs_locally_tailscale() {
    start_in_docs_dir
    echo -e "Serving documentation locally on \e[31m$(hostname).qumulo.ts.net\e[0m by using Tailscale..."
    cd _site && sudo tailscale serve $PWD && cd ..
}

# Check documentation for link, script, and image errors by using HTML Proofer
check_docs_errors() {
    start_in_docs_dir
    echo "Checking documentation for link, script, and image errors..."
    ignore_locale
    docker run --rm --user $(id -u):$(id -g) --name docs-container-check -v $(pwd):/src:rw docs-builder check
}

# Check documentation for spelling errors by using Hunspell
check_spelling_errors() {
    start_in_docs_dir
    echo "Checking documentation for spelling errors..."
    ignore_locale
    docker run --rm --user $(id -u):$(id -g) --name docs-container-proof -v $(pwd):/src:rw docs-builder proof
}

# Ingest documentation
ingest_documentation() {
    start_in_docs_dir
    local yaml_file="$1"
    if [ -z "$yaml_file" ]; then
        echo "You must specify a YAML file."
        exit 1
    fi
    cd ~/git/vectara-ingest && ./run.sh "config/$yaml_file" default && cd -
}

# Ingest docs.qumulo.com into Vectara corpus 2
ingest_docs_portal() {
    start_in_docs_dir
    echo "Ingesting docs.qumulo.com into Vectara corpus 2..."
    no_toolchain
    check_vectara_ingest_repo
    check_secrets_toml
    check_qumulo_config_files
    if [[ "$(hostname)" == *"plena-lucis"* ]]; then
      ingest_documentation "qumulo-documentation-portal.yaml"
    else
      NUM_PROCS=$(printf "%.${2:-0}f" "$(bc <<< "0.625*$(nproc)")")
      sed -i "s/^  ray_workers:.*/  ray_workers: ${NUM_PROCS}/" ~/git/vectara-ingest/config/qumulo-documentation-portal.yaml
      ingest_documentation "qumulo-documentation-portal.yaml"
    fi
}

# Ingest care.qumulo.com into Vectara corpus 4
ingest_care_portal() {
    start_in_docs_dir
    echo "Ingesting cqre.qumulo.com into Vectara..."
    no_toolchain
    check_vectara_ingest_repo
    check_secrets_toml
    check_qumulo_config_files
    if [[ "$(hostname)" == *"plena-lucis"* ]]; then
      ingest_documentation "qumulo-care.yaml"
    else
      NUM_PROCS=$(printf "%.${2:-0}f" "$(bc <<< "0.625*$(nproc)")")
      sed -i "s/^  ray_workers:.*/  ray_workers: ${NUM_PROCS}/" ~/git/vectara-ingest/config/qumulo-care.yaml
      ingest_documentation "qumulo-care.yaml"
    fi
}

# Ingest qumulo.com into Vectara corpus 5
ingest_corp_site() {
    start_in_docs_dir
    echo "Ingesting docs.qumulo.com into Vectara..."
    no_toolchain
    check_vectara_ingest_repo
    check_secrets_toml
    check_qumulo_config_files
    if [[ "$(hostname)" == *"plena-lucis"* ]]; then
      ingest_documentation "qumulo-main.yaml"
    else
      NUM_PROCS=$(printf "%.${2:-0}f" "$(bc <<< "0.625*$(nproc)")")
      sed -i "s/^  ray_workers:.*/  ray_workers: ${NUM_PROCS}/" ~/git/vectara-ingest/config/qumulo-main.yaml
      ingest_documentation "qumulo-care.yaml"
    fi
}

# Check ingestion status
check_ingestion_status() {
    docker logs -f vingest
}

# Find unused scripts
find_unused_scripts() {
 # Navigate to the js/ directory relative to the current directory
    cd "$(dirname "$0")/js" || { echo "js directory not found"; return 1; }

    # Get the list of .js files in the js/ directory
    js_files=$(find . -name "*.js")

    # Initialize an array to hold unused scripts
    unused_scripts=()

    # Go up a level to the parent directory
    cd ..

    # Loop through each .js file and check if it is used in the parent directory
    for js_file in $js_files; do
        js_file_name=$(basename "$js_file")
        # Search for occurrences of the .js file in various contexts
        usage=$(grep -rE "(src=['\"].*\/$js_file_name['\"]|$js_file_name)" . 2>/dev/null)

        if [ -z "$usage" ]; then
            unused_scripts+=("$js_file_name")
        fi
    done

    # Report back the names of unused scripts
    if [ ${#unused_scripts[@]} -eq 0 ]; then
        echo "All scripts are used."
    else
        echo "Unused scripts:"
        for script in "${unused_scripts[@]}"; do
            echo "$script"
        done
    fi
}

check_environment
check_symlinks
global_docs_menu
install_docker
install_noto_emoji

while true; do
    echo
    echo -e "\033[1;33m🤖 Hello and welcome to the Documentation Portal Repository!\033[0m"
    echo -e "\033[1;33m   My name is Robert the helpful documentation robot.\033[0m"
    echo -e "\033[1;33m   How can I assist you?\033[0m"
    echo
    echo "1.  🚧 Rebuild Ruby gems"
    echo "2.  🚧 Rebuild docs-builder container"
    echo "3.  🚧 Rebuild docs-container-check container"
    echo "4.  ⚙️  Regenerate CLI documentation"
    echo "5.  ⚙️  Regenerate API documentation"
    echo "6.  🆕 List CLI documentation with appended content"
    echo "7.  ⚙️  Only build HTML documentation"
    echo "8.  ⚙️  Only build PDF documentation"
    echo "9.  🖥️  Only serve documentation locally (Tailscale over HTTPS)"
    echo "10. 🖥️  Only serve documentation locally (Python over HTTP)"
    echo "11. 🖥️  Build documentation and serve it locally (Tailscale over HTTPS)"
    echo "12. 🖥️  Build documentation and serve it locally (Python over HTTP)"
    echo "13. 🖥️  Build documentation and serve it locally (Jekyll with LiveReload over HTTP)"
    echo "14. 📋 Check documentation for link, script, and image errors"
    echo "15. 📋 Check documentation for spelling errors"
    echo "16. 🧹 Sweep Toolchain"
    echo "17. 🧹 Prune Docker"
    echo "18. 🔄 Refresh Vectara Ingest repo"
    echo "19. 🔍 Ingest docs.qumulo.com into Vectara"
    echo "20. 🔍 Ingest care.qumulo.com into Vectara"
    echo "21. 🔍 Ingest qumulo.com into Vectara"
    echo "22. 📋 Check ingestion status"
    echo "23. ❌ Find unused .js scripts"
    echo "q.  👋 Quit"
    echo
    read -p $'\033[1;33mWhat would you like to do? \033[0m' choice

    case $choice in
        1) rebuild_ruby_gems ;;
        2) rebuild_container ;;
        3) rebuild_check_container ;;
        4) regen_cli_docs ;;
        5) regen_api_docs ;;
        6) find_modified_cli ;;
        7) build_html_docs ;;
        8) build_pdf_docs ;;
        9) only_serve_docs_locally_tailscale ;;
        10) only_serve_docs_locally_python ;;
        11) build_serve_docs_locally_tailscale ;;
        12) build_serve_docs_locally_python ;;
        13) build_serve_docs_locally_jekyll ;;
        14) check_docs_errors ;;
        15) check_spelling_errors ;;
        16) sweep_toolchain ;;
        17) prune_docker ;;
        18) refresh_vectara_ingest_repo;;
        19) ingest_docs_portal ;;
        20) ingest_care_portal ;;
        21) ingest_corp_site ;;
        22) check_ingestion_status ;;
        23) find_unused_scripts ;;
        q) exit ;;
        *) echo "You must enter a valid option." ;;
    esac
done
