#!/bin/bash

# Exit when you hit an error
set -e

# Display list of containers, count them, and kill them if they exist
echo 'Killing all running containers...'
echo ''
if [ $(docker ps | grep -c 'docs-container') -gt 0 ]; then
  docker kill docs-container
fi

PS3='Choose a guide to build:'
options=("Hardware Guide" "Azure Guide" "Administrator Guide" "Qumulo Alerts Guide")
select opt in "${options[@]}"
do
  case $opt in
    "Hardware Guide")
      JEKYLL_CONFIG=config_hardware_guide_pdf.yml
      PRINCE_OUTPUT=qumulo-certified-hardware-guide.pdf
      break
      ;;
    "Azure Guide")
      JEKYLL_CONFIG=config_azure_guide_pdf.yml
      PRINCE_OUTPUT=qumulo-azure-guide.pdf
      break
      ;;
    "Administrator Guide")
      JEKYLL_CONFIG=config_administrator_guide_pdf.yml
      PRINCE_OUTPUT=qumulo-administrator-guide.pdf
      break
      ;;
    "Qumulo Alerts Guide")
      JEKYLL_CONFIG=config_qumulo_alerts_guide_pdf.yml
      PRINCE_OUTPUT=qumulo-alerts-guide.pdf
      break
      ;;
    *) echo "$REPLY is not valid. Try again.";;
  esac
done

echo "Building PDF-friendly HTML site..."
docker run -ti \
        --rm \
        --user $(id -u):$(id -g) \
        --name docs-container \
        -v "$(pwd)":/src:rw \
        -P \
        --detach \
        --network host docs-builder serve \
        --config "_config.yml,pdfconfigs/${JEKYLL_CONFIG}"

echo "Waiting for port 4000 to become available..."
while ! nc -z localhost 4000; do
  sleep 0.2
done

echo "Building the PDF..."
prince --javascript --input-list=_site/pdfconfigs/prince-list.txt -o "pdf/${PRINCE_OUTPUT}"

echo "Deleting temporary build files..."
cd _site && rm * -rf

echo "Cleaning up the Docker container..."
docker kill docs-container

echo "Done. The PDF output is in the /pdf directory."
