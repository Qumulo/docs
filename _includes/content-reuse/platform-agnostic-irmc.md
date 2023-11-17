## Step 1: Connecting the Out-of-Band Management (iRMC) Port
The dedicated out-of-band management port allows functionality such as remote display, control, and power. The port uses the Integrated Remote Management Controller (iRMC) protocol. Connect the iRMC port first on the back of your node (the bottom Ethernet port).

{% include important.html content="The list of iRMC accounts contains the user `qumulo_<random>`. This account is critical for Qumulo Core functionality. Don't disable or tamper with it. To administer Qumulo Core, create your own iRMC user account." %}
