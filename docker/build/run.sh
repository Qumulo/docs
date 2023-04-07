#!/bin/bash

case "${1}" in
    clean)
        echo "Cleaning up HTML output"
        rm _site -rf ;;
    check)
        jekyll build -d _site
        echo "Checking HTML output"
        if [ -f .ignore-error ]; then
            # Use a leading comma, otherwise htmlproofer seems to ignore the first entry
            proofer_args="--url-ignore \",$(cat .ignore-error | tr '\n' ',')\""
        fi
        htmlproofer ${proofer_args} _site ;;
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
        jekyll build -d _site $@ ;;
esac
