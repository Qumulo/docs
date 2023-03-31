#!/bin/bash

# Exit when you hit an error
set -e

# Display list of containers, count them, and kill them if they exist
echo 'Killing all running containers...'
echo ''
if [ $(docker ps | grep -c 'docs-container') -gt 0 ]; then
  docker kill docs-container
fi

# Declaring a future array of actions
# Actions are what the script will do
ACTIONS=()

# Options are what the user will choose
PS3='Choose a guide to build:'

# Prints the options on screen
options=("Hardware Guide" "Azure Guide" "Administrator Guide" "Qumulo Alerts Guide" "All Guides")

select opt in "${options[@]}"

# Matches the option to the action
# Populates the ACTIONS array
do
  case $opt in
    "Hardware Guide")
      ACTIONS+=("Hardware Guide")
      ;;
    "Azure Guide")
      ACTIONS+=("Azure Guide")
      ;;
    "Administrator Guide")
      ACTIONS+=("Administrator Guide")
      ;;
    "Qumulo Alerts Guide")
      ACTIONS+=("Qumulo Alerts Guide")
      ;;
    "All Guides")
      # Perform all of the actions
      ACTIONS+=("Hardware Guide" "Azure Guide" "Administrator Guide" "Qumulo Alerts Guide" )      
      ;;      
    *) echo "$REPLY is not valid. Try again."
    ;;
  esac
done

# Define the build config and output filename for each guide
function build_prince {
  # Match input against the first parameter
  case "$1" in
    "Hardware Guide")
      JEKYLL_CONFIG=config_hardware_guide_pdf.yml
      PRINCE_OUTPUT=qumulo-certified-hardware-guide.pdf
      ;;
    "Azure Guide")
      JEKYLL_CONFIG=config_azure_guide_pdf.yml
      PRINCE_OUTPUT=qumulo-azure-guide.pdf
      ;;
    "Administrator Guide")
      JEKYLL_CONFIG=config_administrator_guide_pdf.yml
      PRINCE_OUTPUT=qumulo-administrator-guide.pdf
      ;;
    "Qumulo Alerts Guide")
      JEKYLL_CONFIG=config_qumulo_alerts_guide_pdf.yml
      PRINCE_OUTPUT=qumulo-alerts-guide.pdf
      ;;
  esac

  echo "Building the PDF..."
  prince --javascript --input-list=_site/pdfconfigs/prince-list.txt -o "pdf/${PRINCE_OUTPUT}"
}

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

# Build the PDF for each item in the array
for i in ${ACTIONS[@]}: do
  build_prince "$i"
done

echo "Deleting temporary build files..."
cd _site && rm * -rf

echo "Cleaning up the Docker container..."
docker kill docs-container

echo "Done. The PDF output is in the /pdf directory."
