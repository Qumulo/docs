## Step 1: Connecting the Out-of-Band Management (IPMI) Port
The dedicated out-of-band management port allows functionality such as remote display, control, and power. The port uses the Intelligent Platform Management Interface (IPMI) protocol. Connect the IPMI port first on the back of your node (above the USB ports).

{% include important.html content="The list of IPMI accounts contains the user `qumulo_<random>`. This account is critical for Qumulo Core functionality. Don't disable or tamper with it. To administer Qumulo Core, create your own IPMI user account." %}
