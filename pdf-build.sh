#!/bin/bash

# Exit when you hit an error
set -e

# Display list of containers, count them, and kill them if they exist
echo 'Killing all running containers...'
echo ''
if [ $(docker ps | grep -c 'docs-container$') -gt 0 ]; then
  docker kill docs-container || true
fi

# Declaring a future array of actions
# Actions are what the script will do
ACTIONS=()

# Options are what the user will choose
PS3='Choose a guide to build:'

# Prints the options on screen
options=("Hardware Guide" "Azure Guide" "Administrator Guide" "Qumulo Alerts Guide" "Integration Guide" "All Guides")

select opt in "${options[@]}"

# Matches the option to the action
# Populates the ACTIONS array
do
  case $opt in
    "Hardware Guide")
      ACTIONS+=("Hardware_Guide")
      break
      ;;
    "Azure Guide")
      ACTIONS+=("Azure_Guide")
      break
      ;;
    "Administrator Guide")
      ACTIONS+=("Administrator_Guide")
      break
      ;;
    "Qumulo Alerts Guide")
      ACTIONS+=("Qumulo_Alerts_Guide")
      break
      ;;
    "Integration Guide")
      ACTIONS+=("Integration_Guide")
      break
      ;;
    "All Guides")
      # Perform all of the actions
      ACTIONS+=("Hardware_Guide" "Azure_Guide" "Administrator_Guide" "Qumulo_Alerts_Guide" "Integration_Guide")
      break
      ;;      
    *) echo "$REPLY is not valid. Try again."
    ;;
  esac
done

# Define the build config and output filename for each guide
build_prince () {
  # Match input against the first parameter
  case "$1" in
    "Hardware_Guide")
      JEKYLL_CONFIG=config_hardware_guide_pdf.yml
      PRINCE_OUTPUT=qumulo-certified-hardware-guide.pdf
      ;;
    "Azure_Guide")
      JEKYLL_CONFIG=config_azure_guide_pdf.yml
      PRINCE_OUTPUT=qumulo-azure-guide.pdf
      ;;
    "Administrator_Guide")
      JEKYLL_CONFIG=config_administrator_guide_pdf.yml
      PRINCE_OUTPUT=qumulo-administrator-guide.pdf
      ;;
    "Qumulo_Alerts_Guide")
      JEKYLL_CONFIG=config_qumulo_alerts_guide_pdf.yml
      PRINCE_OUTPUT=qumulo-alerts-guide.pdf
      ;;
    "Integration_Guide")
      JEKYLL_CONFIG=config_integration_guide_pdf.yml
      PRINCE_OUTPUT=qumulo-integration-guide.pdf
      ;;
  esac

  echo "Building PDF-friendly HTML site..."
  docker run -ti \
    --rm \
    --user $(id -u):$(id -g) \
    --name docs-container \
    -v "$(pwd)":/src:rw \
    -P \
    --detach \
    --env NOLIVERELOAD=1 \
    --network host \
    docs-builder \
    serve \
    --config "_config.yml,pdfconfigs/${JEKYLL_CONFIG}"

  # -F: sets the field delimiter to colon 
  port=$(grep '^port:' "pdfconfigs/${JEKYLL_CONFIG}" | awk -F: '{print $2;}')

  echo "Waiting for port$port to become available..."
  while ! nc -z localhost $port; do
    sleep 0.2
  done

  echo "Building the PDF..."
  prince --javascript --input-list=_site/pdfconfigs/prince-list.txt -o "pdf/${PRINCE_OUTPUT}"

echo "Cleaning up the Docker container..."
docker kill docs-container

}

# Build the PDF for each item in the array
for i in ${ACTIONS[@]}
do
  build_prince "$i"
done

echo "Deleting temporary build files..."
cd _site && rm * -rf

echo "Done. The PDF output is in the /pdf directory."
