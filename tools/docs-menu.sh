#!/bin/bash

check_environment() {
    # If ~/src is missing, offer to bootstrap the dev environment.
    if [[ ! -d "$HOME/src" ]]; then
        read -rp "~/src doesn't exist. Set up development environment? (y/n): " setup_env
        if [[ "$setup_env" == "y" ]]; then
            read -rp "Enter your full name: " full_name
            read -rp "Enter your Qumulo login (email): " qumulo_email
            echo "Setting up development environment..."
            if ! curl -fsSL https://gravyweb.eng.qumulo.com/home/onboarding/install_source.sh \
                 | bash -s -- "$full_name" "$qumulo_email"; then
                echo "Bootstrap failed. Exiting..."
                exit 1
            fi
        elif [[ "$setup_env" == "n" ]]; then
            echo "Can't continue without ~/src. Exiting..."
            exit 1
        fi
    fi

    # Helper function to execute environment check and capture output
    run_env_check() {
        "$HOME/src/environment" > /tmp/env.out 2>&1
    }

    # Attempt running the environment script
    if ! run_env_check; then
        # Check if the output contains the low disk space warning
        if grep -q "You've got a root file system which is less than 5 GB free!" /tmp/env.out; then
            echo -e "\033[1;33mRoot file system has less than 5 GB free.\033[0m"
            read -p $'\033[1;33mPerform emergency disk cleanup and qpkg sweep? (y/n): \033[0m' do_cleanup
            
            if [[ "$do_cleanup" == "y" ]]; then
                echo "Performing emergency disk cleanup..."
                sudo apt-get clean && sudo journalctl --vacuum-time=1d && rm -rf ~/.cache/*
                find /tmp -mindepth 1 -maxdepth 1 ! -name "env.out" -exec rm -rf {} + 2>/dev/null
                
                echo "Sweeping toolchain..."
                sweep_toolchain

                echo "Retrying environment initialization..."
                run_env_check
            fi
        fi

        # If it still fails after cleanup (or if user declined/error was unrelated to space)
        if [[ $? -ne 0 ]]; then
            if [[ -d "$HOME/src" ]]; then
                echo "Detected an error while running environment script. Remediating toolchain..."
                cd "$HOME/src" && hg up default && hg fetch && ./prebuild
                run_env_check
            fi
        fi
    fi

    # Evaluate environment variables if output file exists and is non-empty
    if [[ -s /tmp/env.out ]]; then
        eval "$(cat /tmp/env.out)"
    fi
}

check_symlinks() {
    local git_dir="$HOME/git"
    local docs_symlink="$git_dir/docs-internal"
    local vectara_symlink="$git_dir/vectara-ingest"

    # Detect current script directory as default repo location
    local script_path
    if [[ -n "${BASH_SOURCE[0]}" ]]; then
        script_path="$(realpath "${BASH_SOURCE[0]}")"
    else
        script_path="$(realpath "$0")"
    fi

    # Resolve the path of the file with the currently running function, even if it's invoked from elsewhere
    local default_repo_dir
    default_repo_dir="$(dirname "$(dirname "$script_path")")"

    local parent_dir
    parent_dir="$(dirname "$default_repo_dir")"

    # Ensure ~/git exists
    if [[ ! -d "$git_dir" ]]; then
        read -p "Directory $git_dir doesn't exist. Create it? (y/n): " create_git
        if [[ "$create_git" == "y" ]]; then
            mkdir -p "$git_dir"
            echo "Created $git_dir."
        elif [[ "$create_git" == "n" ]]; then
            echo "Skipping directory creation. Exiting."
            return 1
        fi
    fi

    # Check and create docs-internal symlink
    if [[ ! -L "$docs_symlink" || ! -e "$docs_symlink" ]]; then
        read -p "Create symlink for $docs_symlink? Use default path ($default_repo_dir)? (y/n): " create_docs
        if [[ "$create_docs" == "y" ]]; then
            ln -s "$(realpath "$default_repo_dir")" "$docs_symlink"
            echo "Created symlink $docs_symlink -> $default_repo_dir."
        elif [[ "$create_docs" == "n" ]]; then
            read -p "Enter the full path of the docs-internal repo: " docs_path
            ln -s "$(realpath "$docs_path")" "$docs_symlink"
            echo "Created symlink $docs_symlink -> $docs_path."
        fi
    fi

    # Check and create vectara-ingest symlink
    if [[ ! -L "$vectara_symlink" || ! -e "$vectara_symlink" ]]; then
        read -p "Create symlink for $vectara_symlink? Use default path ($parent_dir/vectara-ingest)? (y/n): " create_vectara
        if [[ "$create_vectara" == "y" ]]; then
            ln -s "$(realpath "$parent_dir/vectara-ingest")" "$vectara_symlink"
            echo "Created symlink $vectara_symlink -> $parent_dir/vectara-ingest."
        elif [[ "$create_vectara" == "n" ]]; then
            read -p "Enter the full path of the vectara-ingest repo: " vectara_path
            ln -s "$(realpath "$vectara_path")" "$vectara_symlink"
            echo "Created symlink $vectara_symlink -> $vectara_path."
        fi
    fi
}

global_docs_menu() {
    # Check if 'dm' exists but isn't a regular file (i.e., broken symlink or dir)
    if [[ -e "$HOME/.local/bin/dm" && ! -f "$HOME/.local/bin/dm" ]]; then
        echo "Warning: ~/.local/bin/dm exists but isn't a regular file. Removing..."
        rm -rf "$HOME/.local/bin/dm"
    fi

    # If 'dm' is already properly set up, exit
    [[ -f "$HOME/.local/bin/dm" ]] && return

    echo "Making docs-menu.sh globally accessible as 'dm'..."

    mkdir -p "$HOME/.local/bin"
    chmod +x "$HOME/git/docs-internal/tools/docs-menu.sh"

    # Create the 'dm' wrapper script
    cat <<EOF > "$HOME/.local/bin/dm"
#!/bin/bash
exec "\$HOME/git/docs-internal/tools/docs-menu.sh" "\$@"
EOF

    chmod +x "$HOME/.local/bin/dm"

    # Ensure ~/.local/bin is in PATH
    if ! echo "$PATH" | grep -q "$HOME/.local/bin"; then
        echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.bashrc"
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

check_tqdm() {
    if ! python3 -c "import tqdm" &>/dev/null; then
        read -p "Package tqdm isn't installed or not visible. Install it? (y/n): " REPLY
        if [[ "$REPLY" == "y" ]]; then
            sudo apt install -y python3-pip python3-tqdm
        else
            echo "Can't continue without tqdm. Exiting..."
            return 1
        fi
    fi
    return 0
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

        # ensure upstream exists, but don't re-add it every time
        if git remote get-url upstream >/dev/null 2>&1; then
            git remote set-url upstream git@github.com:vectara/vectara-ingest.git
        else
            git remote add upstream git@github.com:vectara/vectara-ingest.git
        fi

        #git remote add upstream https://github.com/vectara/vectara-ingest >/dev/null 2>&1
        git fetch upstream
        git reset --hard upstream/main
        git push --force origin main || { echo "Push failed"; exit 1; }
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

        git merge main -m "Refreshing vectara-ingest"
        git push

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

update_specific_ruby_gem() {
  local gem_name="$1"

  if [ -z "$gem_name" ]; then
    read -rp "Enter the name of the gem to update: " gem_name
    if [ -z "$gem_name" ]; then
      echo "No gem name provided. Aborting."
      return 1
    fi
  fi

  docker run -ti \
    --user $(id -u):$(id -g) \
    --entrypoint /bin/bash \
    -v "$(pwd)":/src \
    -e BUNDLE_PATH=/tmp/bundle \
    docs-builder \
    -c "bundle lock --update $gem_name && bundle install"
}

rebuild_ruby_gems() {
    start_in_docs_dir
    echo "Rebuilding the ruby gems..."
    docker run -ti --user $(id -u):$(id -g) --entrypoint /bin/bash -v $(pwd):/src docs-builder -c "bundle update --bundler; bundle install"
}

rebuild_container() {
    start_in_docs_dir
    echo "Rebuilding the docs-builder container..."
    docker build -f docker/build/Dockerfile -t docs-builder .
}

rebuild_container_bypass_cache() {
    start_in_docs_dir
    echo "Rebuilding the docs-builder container while bypassing the cache..."
    docker build --no-cache -f docker/build/Dockerfile -t docs-builder .
}

rebuild_vec_container_bypass_cache() {
    cd ~/git/vectara-ingest 
    echo "Rebuilding the vectara-ingest container while bypassing the cache..."
    docker build --no-cache -t vectara-ingest:latest .
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

    # Non-interactive execution
    if [ -n "$1" ]; then
        if [ "$1" = "current" ]; then
            echo "Regenerating current CLI documentation from default branch..."
            cd ~/src && hg up default && hg fetch && ./tools/extract_cli_help.py --base-dir ~/git/docs-internal && cd -
            sweep_toolchain
            return 0
        elif [[ "$1" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
            echo "Regenerating CLI documentation from release-$1 branch..."
            cd ~/src && hg up default && hg fetch && hg up release-$1 && ./tools/extract_cli_help.py --base-dir ~/git/docs-internal && cd -
            sweep_toolchain
            return 0
        else
            echo "Error: Invalid version format '$1'. Expected 'current' or 'N.N.N'."
            return 1
        fi
    fi

    # Interactive execution
    while true; do
        read -p "Generate the current (c) or future (f) version of the CLI docs? " version_choice
        if [ "$version_choice" = "c" ]; then
            echo "Regenerating current CLI documentation from default branch..."
            cd ~/src && hg up default && hg fetch && ./tools/extract_cli_help.py --base-dir ~/git/docs-internal && cd -
            sweep_toolchain
            break
        elif [ "$version_choice" = "f" ]; then
            while true; do
                read -p "Enter the Qumulo Core release number in N.N.N format (for example, 7.1.2): " version_number
                if [[ $version_number =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
                    echo "Regenerating CLI documentation from release-$version_number branch..."
                    cd ~/src && hg up default && hg fetch && hg up release-$version_number && ./tools/extract_cli_help.py --base-dir ~/git/docs-internal && cd -
                    sweep_toolchain
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

# Regenerate REST API documentation
regen_api_docs() {
    start_in_docs_dir
    check_src_repo
    check_tqdm || return 1

    # Capture var to determine non-interactive or interactive execution
    local api_version="$1"

    no_toolchain
    USER_SITE=$(python3 -m site --user-site)

    if [ -n "$api_version" ]; then
        # Non-Interactive execution
        echo "Building REST API documentation for version $api_version from artifacts.eng.qumulo.com ..."
        PYTHONPATH="$USER_SITE:$PYTHONPATH" python3 tools/gen-api.py "$api_version"
    else
        # Interactive execution
        echo "Building REST API documentation from artifacts.eng.qumulo.com ..."
        PYTHONPATH="$USER_SITE:$PYTHONPATH" python3 tools/gen-api.py
    fi

    sweep_toolchain
}

# Regenerate REST API change log
regen_api_change_log() {
    start_in_docs_dir
    check_tqdm || return 1

    echo "Building REST API change log..."
    python3 tools/gen-api-changes.py
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
    docker run --rm --user $(id -u):$(id -g) --name docs-container-build-serve-tailscale -v $(pwd):/src:rw docs-builder && cd _site && sudo tailscale serve $PWD && cd ..
}

# Build the documentation and serve it locally on port 4000 by using Python
build_serve_docs_locally_python() {
    start_in_docs_dir
    echo -e "Building documentation and serving it locally on \e[31m$(hostname):4000\e[0m by using Python..."
    ignore_warnings
    docker run --rm --user $(id -u):$(id -g) --name docs-container-build-serve-python -v $(pwd):/src:rw docs-builder && cd _site && python3 -m http.server 4000 && cd ..
}

# Build the documentation and serve it locally on port 4000 by using Jekyll LiveReload
build_serve_docs_locally_jekyll() {
    start_in_docs_dir
    echo -e "Building documentation and serving it locally on \e[31m$(hostname):4000\e[0m by using Jekyll LiveReload..."
    ignore_warnings
    docker run -ti --rm --user $(id -u):$(id -g) --name docs-container-build-serve-jekyll -v $(pwd):/src:rw -P --network host docs-builder serve
}

# Only serve the documentation locally on port 4000 by using http.server
only_serve_docs_locally_python() {
    start_in_docs_dir
    
    if [[ ! -d "_site" ]]; then
        echo -e "\e[31mThe _site directory doesn't exist. You must build the documentation first.\e[0m"
        return 1
    fi

    echo -e "Serving documentation locally on \e[31m$(hostname):4000\e[0m using Python..."
    echo -e "\e[31m⚠️  Caution: This method of running an HTTP server is insecure.\e[0m"

    cd _site || return 1
    python3 -m http.server 4000
}

# Only serve the documentation locally by using Tailscale
only_serve_docs_locally_tailscale() {
    start_in_docs_dir

    if [[ ! -d "_site" ]]; then
        echo -e "\e[31mThe _site directory doesn't exist. You must build the documentation first.\e[0m"
        return 1
    fi

    echo -e "Serving documentation locally on \e[31m$(hostname).qumulo.ts.net\e[0m using Tailscale..."

    cd _site || return 1
    sudo tailscale serve "$PWD"
}

# Publish release notes to Nexus
publish_release_notes_to_nexus() {
    local aws_bin="/usr/local/aws-cli/v2/current/bin/aws"

    # Check whether AWS CLI v2 binary exists
    if [[ ! -f "$aws_bin" ]]; then
        read -p "AWS CLI v2 isn't installed. Install it? (y/n): " install_aws
        if [[ "$install_aws" == "y" ]]; then
            curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
            unzip awscliv2.zip && \
            sudo ./aws/install
        else
            echo "Can't continue without AWS CLI v2. Exiting..."
            return 1
        fi
    fi

    # Check whether `aws2` alias exists
    local target_rc=""
    if [[ "$SHELL" == *"zsh"* ]]; then
        target_rc="$HOME/.zshrc"
    else
        target_rc="$HOME/.bashrc"
    fi

    if ! grep -q "alias aws2=" "$target_rc" 2>/dev/null; then
        read -p "Add 'aws2' alias to your shell profile? (y/n): " add_alias
        if [[ "$add_alias" == "y" ]]; then
            echo 'alias aws2="/usr/local/aws-cli/v2/current/bin/aws"' >> "$target_rc"
            echo "Added alias 'aws2' to $target_rc."
        fi
    fi

    # Initiate SSO login
    local sso_profile
    read -p "Enter login profile (default: qumulo-public): " sso_profile
    sso_profile="${sso_profile:-qumulo-public}"

    echo "Initiating AWS SSO login for profile '$sso_profile'..."
    "$aws_bin" sso login --profile "$sso_profile" --use-device-code --no-browser

    check_src_repo
    
    local version_number
    while true; do
        read -p "Enter Qumulo Core Version: " version_number
        if [[ $version_number =~ ^[0-9]+\.[0-9]+\.[0-9]+(\.[0-9]+)?$ ]]; then
            break
        else
            echo "Enter a valid version, for example, 9.1.0 or 9.1.0.1"
        fi
    done

    local aws_profile="$sso_profile"
    read -p "Use AWS profile '$sso_profile'? (y/n): " profile_choice
    if [[ "$profile_choice" == "n" ]]; then
        read -p "Enter profile name: " aws_profile
    fi
    
    local dry_run_flag=""
    read -p "Do a dry run? (y/n): " dry_run_choice
    if [[ "$dry_run_choice" == "y" ]]; then
        dry_run_flag="--dry-run"
    fi  
            
    echo "Publishing release notes to Nexus..."
        
    cd ~/src || return 1
            
    # Create a temp file for stderr exception handling
    local cmd_errlog
    cmd_errlog=$(mktemp)
    
    # Force python to flush output unbuffered, merge streams, and stream through tee
    # so everything prints to the screen immediately while capturing to the log.
    PYTHONUNBUFFERED=1 ./release_management/publish.py $dry_run_flag --overwrite --release-notes-only "$version_number" s3 --aws-profile "$aws_profile" 2>&1 | tee "$cmd_errlog"
    local exit_pipeline=${PIPESTATUS[0]}

    # Check the actual python execution exit code
    if [[ $exit_pipeline -ne 0 ]]; then
        if grep -q "botocore.exceptions.ProfileNotFound" "$cmd_errlog"; then
            echo
            echo -e "\033[0;31mError: The config profile ($aws_profile) could not be found.\033[0m"
            echo "Could not find ~/.aws/credentials file."
            echo "1. Create the file."
            echo "2. Navigate to Okta > AWS IAM Identity Center > AWS access portal > AWS accounts > qumulo-public"
            echo "3. Next to Qumulo-Publish-SSO-Publish, click Access keys."
            echo "4. From the Option 2 section, copy the credentials into ~/.aws/credentials and replace the text in square brackets with a memorable profile name."
            echo
        fi

        rm -f "$cmd_errlog"
        cd - >/dev/null || true
        return 1
    fi

    rm -f "$cmd_errlog"
    cd - >/dev/null || true
}

# Check documentation for link, script, and image errors by using HTML Proofer
check_docs_errors() {
    start_in_docs_dir
    echo "Checking documentation for link, script, and image errors..."
    ignore_locale
    docker run --rm -it --user $(id -u):$(id -g) --name docs-container-check -v $(pwd):/src:rw docs-builder check
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
    cd ~/git/vectara-ingest && git checkout local-config && ./run.sh "config/$yaml_file" default && cd -
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
    docker logs -f vingest-qumulo-documentation-portal
}

# Ingest care.qumulo.com into Vectara corpus 4
ingest_care_portal() {
    start_in_docs_dir
    echo "Ingesting care.qumulo.com into Vectara..."
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
    docker logs -f vingest-qumulo-care
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
      ingest_documentation "qumulo-main.yaml"
    fi
    docker logs -f vingest-qumulo-main
}

# Check ingestion status
check_ingestion_status() {
    docker logs -f vingest
}

# Find unused scripts
find_unused_scripts() {
    start_in_docs_dir
 
    # Navigate to the js/ directory relative to the current directory
    cd js || { echo "js directory not found"; return 1; }

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

find_unused_undefined_vars() {
    start_in_docs_dir
    python3 tools/check-vars.py
}

determine_host_upgrade_onprem_release(){
    ~/src/release_management/list_host_upgrades.py
    cd -
} 

determine_lowest_replication_version() {
    ~/src/release_management/determine_lowest_replication_version.py
}

reverse_integrate_all_changes_from_mainline() {
  MAINLINE_BRANCH="mainline"
  git checkout "$MAINLINE_BRANCH"
  branches=$(git branch | grep -Ev "^\*|\b($MAINLINE_BRANCH|gh-pages)\b")

  declare -a failed_branches

  {
    for branch in $branches; do
      branch=$(echo "$branch" | xargs)
      git checkout "$branch"

      if git merge --no-commit --no-ff "$MAINLINE_BRANCH" 2>&1; then
        if ! git diff --check | grep -q .; then
          git commit -m "Reverse-integrating from mainline" 2>&1
          git push 2>&1
        else
          failed_branches+=("$branch")
          git merge --abort
        fi
      else
        failed_branches+=("$branch")
        git merge --abort
      fi
    done
  } 2>&1 | awk '
    BEGIN {
      hold = "";                 # pending blank line (if any)
      last_blank_printed = 0;    # whether we just printed a blank
      suppress_next_blank = 0;   # used after "Already up to date."
    }

    # helper to flush any held blank (if not suppressed)
    function flush_hold() {
      if (hold != "") {
        print hold;
        hold = "";
        last_blank_printed = 1;
      }
    }

    {
      line = $0;

      # If we have a held blank, decide whether to drop it
      if (hold != "") {
        if (line ~ /^nothing to commit, working tree clean$/) {
          # Drop the blank before this specific line
          print line;
          hold = "";
          last_blank_printed = 0;
          next;
        } else {
          # Keep the blank; print it now
          flush_hold();
        }
      }

      # After "Already up to date.", we insert a blank ourselves.
      # If the very next input line is blank, skip that duplicate.
      if (suppress_next_blank) {
        if (line ~ /^[[:space:]]*$/) {
          suppress_next_blank = 0;
          next;  # skip duplicate blank
        }
        suppress_next_blank = 0;
      }

      # Handle explicit blank lines (don’t print yet; may be dropped)
      if (line ~ /^[[:space:]]*$/) {
        hold = "";
        hold = line;
        next;
      }

      # ALWAYS insert exactly one blank line before "Switched to branch ..."
      if (line ~ /^Switched to branch /) {
        print "";
        print line;
        last_blank_printed = 1;
        next;
      }

      # Add one blank after "Already up to date."
      if (line ~ /^Already up to date\.$/) {
        print line;
        print "";
        last_blank_printed = 1;
        suppress_next_blank = 1;  # in case git prints its own blank
        next;
      }

      # Default: print the line
      print line;
      last_blank_printed = 0;
    }

    END {
      # if a blank was held at EOF (rare), print it
      if (hold != "") print hold;
    }
  '

  git checkout "$MAINLINE_BRANCH"

  if [ ${#failed_branches[@]} -ne 0 ]; then
    echo "Couldn't merge the following branches:"
    printf '%s\n\n' "${failed_branches[@]}"
  else
    echo ""
    echo "All branches merged successfully."
  fi
}

# Run environment and dependency checks for both interactive and non-interactive users
check_environment	# Set up environment variables and fix the toolchain if necessary
check_symlinks		# Verify repository structures
install_docker		# Install Docker if necessary
install_noto_emoji	# Install Noto Emoji if necessary

# Evaluate flag execution
if [ "$1" = "--regen-cli" ]; then
    VERSION="${2:-current}"
    regen_cli_docs "$VERSION"
    exit 0
elif [ "$1" = "--regen-api" ]; then
    VERSION="$2"
    regen_api_docs "$VERSION"
    exit 0
elif [ "$1" = "--regen-api-changes" ]; then
    regen_api_change_log
    exit 0
elif [[ "$1" == "--help" || "$1" == "-h" ]]; then
    # ---> CHANGED: Added help flag and clear documentation layout
    echo -e "\033[1;33m🤖 Documentation Portal Tool ('dm') - Command Help\033[0m"
    echo -e "Usage: dm [FLAG] [ARGUMENT]\n"
    echo -e "Available Non-Interactive Flags:"
    echo -e "  -h, --help            Show this help menu and exit."
    echo -e "  --regen-cli [VERSION] Regenerate CLI command guide documentation."
    echo -e "                        Accepts 'current' or specific N.N.N format (for example, 7.1.2)."
    echo -e "                        Defaults to 'current' if no version is given."
    echo -e "  --regen-api [VERSION] Regenerate REST API reference guide documentation."
    echo -e "                        Accepts specific N.N.N format (for example 7.1.2)."
    echo -e "                        Drops into a version prompt if no version is given."
    echo -e "  --regen-api-changes   Regenerate the dynamic REST API changes log guide."
    echo -e ""
    echo -e "Running 'dm' with no flags launches the interactive menu."
    exit 0
    # ------------------------------------------------------------------
fi

# On first wrap, generate the `dm` shell wrapper tool
global_docs_menu

# Interactive menu
while true; do
    echo
    echo -e "\033[1;33m🤖 Hello and welcome to the Documentation Portal Repository!\033[0m"
    echo -e "\033[1;33m   My name is Robert the helpful documentation robot.\033[0m"
    echo -e "\033[1;33m   How can I assist you?\033[0m"
    echo
    echo -e "\033[1;33mPerform Maintenance\033[0m"
    echo -e "1.  📦\tRebuild docs-builder container"
    echo -e "2.  📦\tRebuild docs-builder container while bypassing the cache"
    echo -e "3.  📦\tRebuild vectara-ingest container while bypassing the cache"
    echo -e "4.  💎\tUpdate a specific Ruby gem (useful for Dependabot fixes)"
    echo -e "5.  💎\tRebuild Ruby gems"
    echo -e "6.  🧹\tSweep Toolchain"
    echo -e "7.  🧹\tPrune Docker"
    echo -e "8.  🔄\tRefresh Vectara Ingest repo"
    echo -e "9.  ❌\tFind unused .js scripts"
    echo -e "10. ❌\tFind unused and undefined Jekyll/Liquid variables"
    echo -e "11. 🔀\tReverse-integrate all changes from mainline"
    echo
    echo -e "\033[1;33mRetrieve Information\033[0m"
    echo -e "12. ⬆️\tDetermine whether a Qumulo Core release includes a host upgrade"
    echo -e "13. ⬇️\tDetermine lowest replication version for Qumulo Core release"
    echo -e "14. 🆕\tList CLI documentation with appended content"
    echo
    echo -e "\033[1;33mGenerate Documentation\033[0m"
    echo -e "15. ⚙️\tRegenerate CLI documentation"
    echo -e "16. ⚙️\tRegenerate REST API documentation"
    echo -e "17. ⚙️\tRegenerate REST API change log"    
    echo -e "18. ⚙️\tOnly build HTML documentation"
    echo -e "19. ⚙️\tOnly build PDF documentation"
    echo
    echo -e "\033[1;33mPreview Documentation\033[0m"
    echo -e "20. 🖥️\tOnly serve documentation locally (Tailscale over HTTPS)"
    echo -e "21. 🖥️\tOnly serve documentation locally (Python over HTTP)"
    echo -e "22. 🖥️\tBuild documentation and serve it locally (Tailscale over HTTPS)"
    echo -e "23. 🖥️\tBuild documentation and serve it locally (Python over HTTP)"
    echo -e "24. 🖥️\tBuild documentation and serve it locally (Jekyll with LiveReload over HTTP)"
    echo
    echo -e "\033[1;33mPublish Documentation\033[0m"
    echo -e "25. 📣\tPublish release notes to Nexus" 
    echo
    echo -e "\033[1;33mTest Documentation\033[0m"
    echo -e "26. 📋\tCheck documentation for link, script, and image errors"
    echo -e "27. 📋\tCheck documentation for spelling errors"
    echo
    echo -e "\033[1;33mIndex Documentation\033[0m"
    echo -e "28. 🔍\tIngest docs.qumulo.com into Vectara"
    echo -e "29. 🔍\tIngest care.qumulo.com into Vectara"
    echo -e "30. 🔍\tIngest qumulo.com into Vectara"
    echo
    echo -e "q.  👋\tQuit"
    echo
    read -p $'\033[1;33mWhat would you like to do? \033[0m' choice

    case $choice in
        1) rebuild_container ;;
        2) rebuild_container_bypass_cache ;;
        3) rebuild_vec_container_bypass_cache ;;
        4) update_specific_ruby_gem ;;
        5) rebuild_ruby_gems ;;
        6) sweep_toolchain ;;
        7) prune_docker ;;
        8) refresh_vectara_ingest_repo;;
        9) find_unused_scripts ;;
        10) find_unused_undefined_vars ;;
        11) reverse_integrate_all_changes_from_mainline ;;
        12) determine_host_upgrade_onprem_release ;;
        13) determine_lowest_replication_version ;;
        14) find_modified_cli ;;
        15) regen_cli_docs ;;
        16) regen_api_docs ;;
        17) regen_api_change_log ;;
        18) build_html_docs ;;
        19) build_pdf_docs ;;
        20) only_serve_docs_locally_tailscale ;;
        21) only_serve_docs_locally_python ;;
        22) build_serve_docs_locally_tailscale ;;
        23) build_serve_docs_locally_python ;;
        24) build_serve_docs_locally_jekyll ;;
        25) publish_release_notes_to_nexus ;;
        26) check_docs_errors ;;
        27) check_spelling_errors ;;
        28) ingest_docs_portal ;;
        29) ingest_care_portal ;;
        30) ingest_corp_site ;;
        q) exit ;;
        *) echo "You must enter a valid option." ;;
    esac
done
