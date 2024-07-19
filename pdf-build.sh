#!/bin/bash

# Check if Prince XML is installed
if ! command -v prince &> /dev/null; then
    echo "To generate PDF files, you must install Prince XML: https://www.princexml.com/download/"
    exit 1
fi

# Exit when you hit an error
set -e

# Display list of containers, count them, and kill them if they exist
echo 'Killing all running containers...'
if [ $(docker ps | grep -c 'docs-container$') -gt 0 ]; then
  docker kill docs-container || true 
  docker wait docs-container || true
fi
echo
echo -e "📄 \033[1;33mBuild PDF documentation\033[0m"

# Declaring a future array of actions
# Actions are what the script will do
ACTIONS=()

# Options are what the user will choose
PS3='What would you like to build? '

# Prints the options on screen
options=("Qumulo-Certified Hardware Servicing Guide" "Azure Native Qumulo Administrator Guide" "Qumulo On-Premises Administrator Guide" "Qumulo Alerts Guide" "Qumulo qq CLI Command Guide" "Qumulo REST API Guide" "Qumulo Integration Guide" "All Administrator Guides" "All Guides" "Exit")
echo

select opt in "${options[@]}"

# Matches the option to the action
# Populates the ACTIONS array
do
  case $opt in
    "Qumulo-Certified Hardware Servicing Guide")
      ACTIONS+=("Hardware_Guide")
      break
      ;;
    "Azure Native Qumulo Administrator Guide")
      ACTIONS+=("Azure_Guide")
      break
      ;;
    "Qumulo On-Premises Administrator Guide")
      ACTIONS+=("Administrator_Guide")
      break
      ;;
    "Qumulo Alerts Guide")
      ACTIONS+=("Qumulo_Alerts_Guide")
      break
      ;;
    "Qumulo qq CLI Command Guide")
      ACTIONS+=("Qumulo_qq_CLI_Command_Guide")
      break
      ;;
    "Qumulo REST API Guide")
      ACTIONS+=("Qumulo_REST_API_Guide")
      break
      ;;
    "Qumulo Integration Guide")
      ACTIONS+=("Integration_Guide")
      break
      ;;
    "All Administrator Guides")
      ACTIONS+=("Azure_Guide" "Administrator_Guide")
      break
      ;;
    "All Guides")
      ACTIONS+=("Hardware_Guide" "Azure_Guide" "Administrator_Guide" "Qumulo_Alerts_Guide" "Qumulo_qq_CLI_Command_Guide" "Integration_Guide")
      break
      ;;
    "Exit")
      exit 0
      ;;
    *) echo "You must enter a valid option."
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
    "Qumulo_qq_CLI_Command_Guide")
      JEKYLL_CONFIG=config_qq_cli_command_guide_pdf.yml
      PRINCE_OUTPUT=qumulo-qq-cli-command-guide.pdf
      ;;
    "Qumulo_REST_API_Guide")
      JEKYLL_CONFIG=config_qumulo_rest_api_guide_pdf.yml
      PRINCE_OUTPUT=qumulo-rest-api-guide.pdf
      ;;
    "Integration_Guide")
      JEKYLL_CONFIG=config_integration_guide_pdf.yml
      PRINCE_OUTPUT=qumulo-integration-guide.pdf
      ;;
  esac

  echo ""
  echo "Building PDF-friendly HTML site..."
  echo -e "\033[1;33mNote: You can ignore any warnings about setting the locale.\033[0m"
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
if [ $(docker ps | grep -c 'docs-container$') -gt 0 ]; then
  docker kill docs-container || true
  docker wait docs-container || true
fi
}

# Build the PDF for each item in the array
for i in ${ACTIONS[@]}
do
  build_prince "$i"
done

#echo "Deleting temporary build files..."
#cd _site && rm * -rf

echo "Done. The PDF output is in the /pdf directory."
