#!/bin/bash
set -euo pipefail

# Check if Prince XML is installed
if ! command -v prince &> /dev/null; then
    read -rp "Prince XML 14 not installed. Install it? (y/n): " install_prince
    if [[ "$install_prince" == "y" ]]; then
        wget https://www.princexml.com/download/prince_14.4-1_ubuntu22.04_amd64.deb
        sudo apt install -y gdebi-core

        # On Ubuntu 24.04, handle libtiff5 and patch gdebi
        if lsb_release -a 2>/dev/null | grep -q "24\.04"; then
            wget http://security.ubuntu.com/ubuntu/pool/main/t/tiff/libtiff5_4.3.0-6ubuntu0.10_amd64.deb
            if sudo apt install -y ./libtiff5_4.3.0-6ubuntu0.10_amd64.deb; then
                rm libtiff5_4.3.0-6ubuntu0.10_amd64.deb
            fi
            sudo sed -i -E \
              's|^([[:space:]]*)c = findall\("[^"]*", msg\)\[0\]\.lower\(\)|\1c = findall(r"\\[(\\S)/\\S\\]", msg)[0].lower()|' \
              /usr/bin/gdebi
        fi

        if sudo gdebi prince_14.4-1_ubuntu22.04_amd64.deb; then
            rm prince_14.4-1_ubuntu22.04_amd64.deb
        fi

        sudo mkdir -p /usr/lib/prince
        sudo tee /usr/lib/prince/license.dat >/dev/null <<'EOF'
<license id="1003074">
    <name>Desktop License</name>
    <vendor>YesLogic</vendor>
    <product>Prince</product>
    <version>14</version>
    <end-user>Qumulo</end-user>
    <date>2022-08-03</date>
    <signature>ASK LUCIA FOR THIS LINE</signature>
    <option id="upgrades">20230803</option>
</license>
EOF
    fi
fi

# Exit when you hit an error
set -e

# Display list of containers, count them, and kill them if they exist
echo 'Killing all running containers...'
if [ $(docker ps | grep -c 'docs-container-pdf$') -gt 0 ]; then
  docker kill docs-container-pdf || true 
  docker wait docs-container-pdf || true
fi
echo
echo -e "📄 \033[1;33mBuild PDF documentation\033[0m"

# Declaring a future array of actions
# Actions are what the script will do
ACTIONS=()

# Options are what the user will choose
PS3='What would you like to build? '

# Prints the options on screen
options=("Qumulo-Certified Platinum-Tier Hardware Servicing Guide" "Gold-Tier Hardware Servicing Guide for Qumulo" "Azure Native Qumulo Administrator Guide" "Cloud Native Qumulo on AWS Administrator Guide" "Cloud Native Qumulo on Azure Administrator Guide" "Cloud Native Qumulo on GCP Administrator Guide" "Qumulo On-Premises Administrator Guide" "Qumulo Nexus Configuration Guide" "Qumulo Alerts Administrator Guide" "Qumulo qq CLI Command Guide" "Qumulo REST API Guide" "Qumulo Integration Guide" "All Administrator Guides" "All Hardware Guides" "All Guides" "Exit")
echo

select opt in "${options[@]}"

# Matches the option to the action
# Populates the ACTIONS array
do
  case $opt in
    "Qumulo-Certified Platinum-Tier Hardware Servicing Guide")
      ACTIONS+=("Platinum_Tier_Hardware_Guide")
      break
      ;;
    "Gold-Tier Hardware Servicing Guide for Qumulo")
      ACTIONS+=("Gold_Tier_Hardware_Guide")
      break
      ;;
    "Azure Native Qumulo Administrator Guide")
      ACTIONS+=("ANQ_Guide")
      break
      ;;
    "Cloud Native Qumulo on AWS Administrator Guide")
      ACTIONS+=("CNQ_AWS_Guide")
      break
      ;;
    "Cloud Native Qumulo on Azure Administrator Guide")
      ACTIONS+=("CNQ_Azure_Guide")
      break
      ;;
    "Cloud Native Qumulo on GCP Administrator Guide")
      ACTIONS+=("CNQ_GCP_Guide")
      break
      ;;
    "Qumulo On-Premises Administrator Guide")
      ACTIONS+=("Administrator_Guide")
      break
      ;;
    "Qumulo Nexus Configuration Guide")
      ACTIONS+=("Qumulo_Nexus_Guide")
      break
      ;;
    "Qumulo Alerts Administrator Guide")
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
      ACTIONS+=("ANQ_Guide" "CNQ_AWS_Guide" "CNQ_Azure_Guide" "CNQ_GCP_Guide" "Administrator_Guide")
      break
      ;;
    "All Hardware Guides")
      ACTIONS+=("Platinum_Tier_Hardware_Guide" "Gold_Tier_Hardware_Guide")
      break
      ;;
    "All Guides")
      ACTIONS+=("Platinum_Tier_Hardware_Guide" "Gold_Tier_Hardware_Guide" "ANQ_Guide" "CNQ_AWS_Guide" "CNQ_Azure_Guide" "CNQ_GCP_Guide" "Administrator_Guide" "Qumulo_Alerts_Guide" "Qumulo_qq_CLI_Command_Guide" "Integration_Guide")
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
    "Platinum_Tier_Hardware_Guide")
      JEKYLL_CONFIG=config_platinum_tier_hardware_guide_pdf.yml
      PRINCE_OUTPUT=qumulo-certified-platinum-tier-hardware-guide.pdf
      ;;
    "Gold_Tier_Hardware_Guide")
      JEKYLL_CONFIG=config_gold_tier_hardware_guide_pdf.yml
      PRINCE_OUTPUT=gold-tier-hardware-guide-for-qumulo.pdf
      ;;
    "ANQ_Guide")
      JEKYLL_CONFIG=config_azure_native_guide_pdf.yml
      PRINCE_OUTPUT=azure-native-qumulo-administrator-guide.pdf
      ;;
    "CNQ_AWS_Guide")
      JEKYLL_CONFIG=config_cloud_native_aws_guide_pdf.yml
      PRINCE_OUTPUT=cloud-native-qumulo-on-aws-administrator-guide.pdf
      ;;
    "CNQ_Azure_Guide")
      JEKYLL_CONFIG=config_cloud_native_azure_guide_pdf.yml
      PRINCE_OUTPUT=cloud-native-qumulo-on-azure-administrator-guide.pdf
      ;;
    "CNQ_GCP_Guide")
      JEKYLL_CONFIG=config_cloud_native_gcp_guide_pdf.yml
      PRINCE_OUTPUT=cloud-native-qumulo-on-gcp-administrator-guide.pdf
      ;;
    "Administrator_Guide")
      JEKYLL_CONFIG=config_administrator_guide_pdf.yml
      PRINCE_OUTPUT=qumulo-administrator-guide.pdf
      ;;
    "Qumulo_Nexus_Guide")
      JEKYLL_CONFIG=config_qumulo_nexus_configuration_guide_pdf.yml
      PRINCE_OUTPUT=qumulo-nexus-configuration-guide.pdf
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
      JEKYLL_CONFIG=config_rest_api_guide_pdf.yml
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
  CONTAINER_ID=$(docker run \
    --rm \
    --user $(id -u):$(id -g) \
    --name docs-container-pdf \
    -v "$(pwd)":/src:rw \
    -P \
    --detach \
    --env NOLIVERELOAD=1 \
    --network host \
    docs-builder \
    serve \
    --config "_config.yml,pdfconfigs/${JEKYLL_CONFIG}")

  # Check if the container started successfully
  if [ -z "$CONTAINER_ID" ]; then
    echo "[ERROR] Couldn't start container."
    exit 1
  fi

  # Start streaming logs in the background
  docker logs -f "$CONTAINER_ID" &
  LOG_PID=$!  # Capture process ID of log streaming

  # Wait for Jekyll server to be ready by checking the port
  port=$(grep '^port:' "pdfconfigs/${JEKYLL_CONFIG}" | awk -F: '{print $2;}')

  echo "Waiting for port $port to become available..."
  while ! nc -z localhost "$port"; do
    sleep 0.2
  done

  # Kill the log streaming process after server is ready
  kill "$LOG_PID" 2>/dev/null || true

  echo "Building the PDF..."
  prince --javascript --input-list=_site/pdfconfigs/prince-list.txt -o "pdf/${PRINCE_OUTPUT}"

echo "Cleaning up the Docker container..."
if [ $(docker ps | grep -c 'docs-container-pdf$') -gt 0 ]; then
  docker kill docs-container-pdf || true
  docker wait docs-container-pdf || true
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
