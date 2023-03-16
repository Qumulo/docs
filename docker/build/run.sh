#!/bin/bash

case "${1}" in
    check)
        echo "Checking HTML output";
        htmlproofer _site ;;
    serve)
        echo "Serving on port 4000" ;
        jekyll serve --livereload -H 0.0.0.0 ;;
    *)
        jekyll build -d _site ;;
esac
