#!/bin/bash

if [[ -f /build.sha256 ]]; then
    sha256sum --check /build.sha256 >/dev/null 2>&1
    if [[ $? -ne 0 ]]; then
        echo "#####################################################################"
        echo "#  WARNING! Gemfile dependencies have changed from this container.  #"
        echo "#  Rebuild this container to ensure you are running with the latest #"
        echo "#  dependencies.                                                    #"
        echo "#####################################################################"
        echo "Expected $(</build.sha256)"
        echo "Found $(sha256sum --check /build.sha256)"
        echo
        echo "This likely means that the Gemfile has built differently in your"
        echo "docs-builder container, likely due to dependency updates in the "
        echo "generic parent container".
        echo "You can get a new Gemfile.lock that will work with this command "
        echo "running it from the docs root directory"
        echo '  docker run -ti --user $(id -u):$(id -g) --entrypoint /bin/bash -v $(pwd):/src docs-builder -c "bundle update --bundler; bundle install"'
        echo "This will update the Gemfile.lock in your local repo ready to commit"
        exit 1
    fi
fi

case "${1}" in
    clean)
        echo "Cleaning up HTML output"
        rm _site -rf ;;

    proof)
        echo "Checking spelling"
        rm _site -rf
        ruby tools/spellcheck.rb ;;
    check)
        jekyll build -d _site
        echo "Checking HTML output"
        if [ -f tools/.ignore-error ]; then
            # Use a leading comma, otherwise htmlproofer seems to ignore the first entry
            proofer_args="--ignore-urls \",$(cat /src/tools/.ignore-error | tr '\n' ',')\""
        fi
        htmlproofer --only-4xx --allow-missing-href=true ${proofer_args} _site ;;
    serve)
        echo "Serving on port 4000"
        # Remove the first argument from the command
        shift
        # Pass through any other specified arguments
        if [ -z "${NOLIVERELOAD}" ]; then
            LIVERELOAD="--livereload"
        fi
        jekyll serve ${LIVERELOAD} -H 0.0.0.0 $@ ;;
    *)
        # Pass through any other specified arguments
        #jekyll build -d _site $@ ;;
        bundle exec jekyll build -d _site $@
esac
