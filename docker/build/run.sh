#!/bin/bash

set -e

# Check if we're inside the container
if [[ -f /.dockerenv ]] || grep -qa docker /proc/1/cgroup; then
    # Running inside the container
    
    # Skip hash checks if we're running a bundle install to update gems
    if [[ "$SKIP_HASH_CHECK" == "true" ]]; then
        if [[ "$1" == "bundle" && "$2" == "install" ]]; then
            echo "Running bundle install to update gems..."
            exec bundle install
            exit 0
        fi
    fi
    
    DOCKERFILE_PATH="docker/build/Dockerfile"
    DOCKERFILE_HASH_FILE="dockerfile.sha256"
    GEMFILE_HASH_FILE="gemfile.sha256"

    DOCKERFILE_CHANGED=false
    GEMFILE_CHANGED=false
    
    DOCKER_EXPECTED_HASH=""
    DOCKER_CURRENT_HASH=""
    GEMFILE_EXPECTED_HASH=""
    GEMFILE_CURRENT_HASH=""

    # Check whether Dockerfile has changed
    if [[ -f $DOCKERFILE_HASH_FILE ]]; then
        DOCKER_CURRENT_HASH=$(sha256sum "$DOCKERFILE_PATH" | cut -d ' ' -f 1)

        if grep -q " " "$DOCKERFILE_HASH_FILE"; then
            # File contains hash and filename
            DOCKER_EXPECTED_HASH=$(cut -d ' ' -f 1 < "$DOCKERFILE_HASH_FILE")
        else
            # File contains only the hash
            DOCKER_EXPECTED_HASH=$(cat "$DOCKERFILE_HASH_FILE")
        fi

        if [[ "$DOCKER_CURRENT_HASH" != "$DOCKER_EXPECTED_HASH" ]]; then
            DOCKERFILE_CHANGED=true
        fi
    else
        DOCKERFILE_CHANGED=true
        echo ""
        echo -e "\033[1;33m⚠️  Important: Couldn't find $DOCKERFILE_HASH_FILE.\033[0m"
        echo ""
        echo "To create the hash file, run the following command:"
        echo -e "\033[1;33msha256sum docker/build/Dockerfile | cut -d ' ' -f 1 > $DOCKERFILE_HASH_FILE\033[0m"
        exit 1
    fi

    # Check whether Gemfile.lock has changed
    if [[ -f "$GEMFILE_HASH_FILE" ]]; then
        GEMFILE_CURRENT_HASH=$(sha256sum Gemfile.lock | cut -d ' ' -f 1)

        if grep -q " " "$GEMFILE_HASH_FILE"; then
            # File contains hash and filename
            GEMFILE_EXPECTED_HASH=$(cut -d ' ' -f 1 < "$GEMFILE_HASH_FILE")
        else
            # File contains only the hash
            GEMFILE_EXPECTED_HASH=$(cat "$GEMFILE_HASH_FILE")
        fi

        if [[ "$GEMFILE_CURRENT_HASH" != "$GEMFILE_EXPECTED_HASH" ]]; then
            GEMFILE_CHANGED=true
        fi
    else
        GEMFILE_CHANGED=true
        echo ""
        echo -e "\033[1;33m⚠️  Important: Couldn't find $GEMFILE_HASH_FILE.\033[0m"
        echo ""
        echo "To create the hash file, run the following command:"
        echo -e "\033[1;33msha256sum Gemfile.lock | cut -d ' ' -f 1 > $GEMFILE_HASH_FILE\033[0m"
        exit 1
    fi

    # Handle the case where both have changed
    if [[ "$DOCKERFILE_CHANGED" == true && "$GEMFILE_CHANGED" == true ]]; then
        echo ""
        echo -e "\033[1;33m⚠️  Important: Both Dockerfile and Gemfile.lock have been modified.\033[0m"
        echo ""
        echo "Dockerfile"
        echo "Expected hash: $DOCKER_EXPECTED_HASH"
        echo "Current hash:  $DOCKER_CURRENT_HASH"
        echo ""
        echo "Gemfile.lock"
        echo "Expected hash: $GEMFILE_EXPECTED_HASH"
        echo "Current hash:  $GEMFILE_CURRENT_HASH"
        echo ""
        echo -e "\033[1;33mThis can happen after upstream updates or when moving between branches with"
        echo -e "different dependency requirements. To ensure that your environment is"
        echo -e "consistent and complete, we recommend rebuilding both files.\033[0m"
        echo ""        
        echo "To rebuild the container and the gems and create the hash files, run the following command:"
        echo -e "\033[1;33mdocker build -f docker/build/Dockerfile -t docs-builder . && \\"
        echo -e "docker run --rm --user \$(id -u):\$(id -g) --volume \$(pwd):/src --workdir /src --entrypoint bundle docs-builder install && \\"
        echo -e "sha256sum docker/build/Dockerfile | cut -d ' ' -f 1 > $DOCKERFILE_HASH_FILE && \\"
        echo -e "sha256sum Gemfile.lock | cut -d ' ' -f 1 > $GEMFILE_HASH_FILE\033[0m"
        exit 1
    fi

    # When inside the container, exit with specific instructions if environment changed
    if [[ "$DOCKERFILE_CHANGED" == true ]]; then
        echo ""
        echo -e "\033[1;33m⚠️  Important: Dockerfile has been modified.\033[0m"
        echo ""
        echo "Expected hash: $DOCKER_EXPECTED_HASH"
        echo "Current hash:  $DOCKER_CURRENT_HASH"
        echo ""
        echo -e "\033[1;33mThis can happen for several reasons, such as updates to base images or"
        echo -e "dependencies, security patches or bug fixes in the container environment,"
        echo -e "changes to build configuration or tools, or updated system libraries or"
        echo -e "runtime environments. To ensure that your environment is consistent and"
        echo -e "complete, we recommend rebuilding the container.\033[0m"
        echo ""        
        echo "To rebuild the container and create the hash file, run the following command:"
        echo -e "\033[1;33mdocker build -f docker/build/Dockerfile -t docs-builder . && sha256sum docker/build/Dockerfile | cut -d ' ' -f 1 > $DOCKERFILE_HASH_FILE\033[0m"
        exit 1
    fi

    if [[ "$GEMFILE_CHANGED" == true ]]; then
        echo ""
        echo -e "\033[1;33m⚠️  Important: Gemfile.lock has been modified.\033[0m"
        echo ""
        echo "Expected hash: $GEMFILE_EXPECTED_HASH"
        echo "Current hash:  $GEMFILE_CURRENT_HASH"
        echo ""
        echo -e "\033[1;33mThis can happen when Ruby gem dependencies have been updated or modified,"
        echo -e "gem version constraints have changed, a different version of Bundler was"
        echo -e "used to generate the lock file, or security updates have been applied to"
        echo -e "dependencies. To ensure that your environment is consistent and complete,"
        echo -e "we recommend rebuilding the gems.\033[0m"
        echo ""        
        echo "To rebuild the gems and create the hash file, run the following command:"
        echo -e "\033[1;33mdocker run --rm --user \$(id -u):\$(id -g) --volume \$(pwd):/src --workdir /src --entrypoint bundle docs-builder install && \\"
        echo -e "sha256sum Gemfile.lock | cut -d ' ' -f 1 > $GEMFILE_HASH_FILE\033[0m"
        exit 1
    fi

    # Build options
    case "${1}" in
        clean)
            echo ""
            echo "Cleaning up HTML output..."
            rm -rf _site ;;
        proof)
            echo ""
            echo "Checking spelling..."
            rm -rf _site
            ruby tools/spellcheck.rb ;;
        check)
            echo ""
            echo "Checking HTML output..."
            bundle exec jekyll build -d _site
            ignore_list=$(grep -v '^\s*$' /src/tools/.ignore-error | tr '\n' ',' | sed 's/,$//')
            if [ -n "$ignore_list" ]; then
                # Use a leading comma, otherwise htmlproofer seems to ignore the first entry
                proofer_args="--ignore-urls \",${ignore_list},\""
                htmlproofer --only-4xx --allow-missing-href=true ${proofer_args} _site
            else
                htmlproofer --only-4xx --allow-missing-href=true _site
            fi
            ;;
        serve)
            echo ""
            echo "Serving on port 4000"
            shift
            if [ -z "${NOLIVERELOAD}" ]; then
                LIVERELOAD="--livereload"
            fi
            exec bundle exec jekyll serve ${LIVERELOAD} -H 0.0.0.0 "$@" ;;
        *)
            bundle exec jekyll build -d _site "$@" ;;
    esac

else
    # Running outside the container
    
    # Start the container immediately
    exec docker run -ti \
        --user "$(id -u):$(id -g)" \
        --env INSIDE_DOCS_CONTAINER=true \
        --entrypoint /bin/bash \
        --volume "$(pwd)":/src \
        --workdir /src \
        docs-builder \
        -c "./docker/build/run.sh $*"
fi
