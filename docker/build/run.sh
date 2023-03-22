#!/bin/bash

case "${1}" in
    clean)
        echo "Cleaning up HTML output"
        rm _site -rf ;;
    check)
        jekyll build -d _site
        echo "Checking HTML output"
        htmlproofer _site ;;
    serve)
        echo "Serving on port 4000"
        jekyll serve --livereload -H 0.0.0.0 ;;
    *)
        jekyll build -d _site ;;
esac
