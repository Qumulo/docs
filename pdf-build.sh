#!/bin/bash

# Exit when you hit an error
set -e

# Display list of containers, count them, and kill them if they exist
echo 'Killing all running containers...'
if [ $(docker ps | grep -c 'docs-container') -gt 0 ]; then
  docker kill docs-container
fi

PS3='Choose a guide:'
options=("Hardware Guide" "Azure Guide" "Administrator Guide" "Qumulo Alerts Guide")
select opt in "${options[@]}"
do
  case $opt in
    "Hardware Guide")
      echo "Building PDF-friendly HTML site..."
      docker run -ti \
        --rm \
        --user $(id -u):$(id -g) \
        --name docs-container \
        -v "$(pwd)":/src:rw \
        -P \
        --detach \
        --network host docs-builder serve \
        --config _config.yml,pdfconfigs/config_hardware_guide_pdf.yml
      break
      ;;
    "Azure Guide")
      echo "Building PDF-friendly HTML site..."
      docker run -ti \
        --rm \
        --user $(id -u):$(id -g) \
        --name docs-container \
        -v "$(pwd)":/src:rw \
        -P \
        --detach \
        --network host docs-builder serve \
        --config _config.yml,pdfconfigs/config_azure_guide_pdf.yml    
      break
      ;;
    "Administrator Guide")
      echo "Building PDF-friendly HTML site..."
      docker run -ti \
        --rm \
        --user $(id -u):$(id -g) \
        --name docs-container \
        -v "$(pwd)":/src:rw \
        -P \
        --detach \
        --network host docs-builder serve \
        --config _config.yml,pdfconfigs/config_administrator_guide_pdf.yml 
      break
      ;;
    "Qumulo Alerts Guide")
      echo "Building PDF-friendly HTML site..."
      docker run -ti \
        --rm \
        --user $(id -u):$(id -g) \
        --name docs-container \
        -v "$(pwd)":/src:rw \
        -P \
        --detach \
        --network host docs-builder serve \
        --config _config.yml,pdfconfigs/config_qumulo_alerts_guide_pdf.yml
      break
      ;;
    *) echo "$REPLY is not valid. Try again.";;
  esac
done

echo "Waiting for port 4000 to become available..."
while ! nc -z localhost 4000; do
  sleep 0.2
done

echo "Building the PDF..."
prince --javascript --input-list=_site/pdfconfigs/prince-list.txt -o pdf/qumulo-certified-hardware-guide.pdf;

echo "Deleting temporary build files..."
cd _site && rm * -rf

echo "The PDF output is in the /pdf directory."

echo "Cleaning up the Docker container..."
docker kill docs-container
