### Step 1: Initialize the Replacement Boot Drive
{% capture getInstall %}To get the correct version of the Qumulo Core Installer for the node in your cluster, {{site.contactQumuloCare}}{% endcapture %}
{% include tip.html content=getInstall %}

1. [Create a Qumulo Core USB Drive Installer](../getting-started/creating-usb-drive-installer.html).

1. Power on your node, enter the boot menu, and select your USB drive.

   The Qumulo Core Installer begins to run automatically.
   
1. When prompted, take the following steps:

   1. Select `[x] Perform maintenance`.

   1. Select `[1] Boot drive reset` and then follow the prompts.

   The Qumulo Core Installer initializes the boot drive.

1. When the process is complete, the node is powered down automatically.


### Step 2: Rebuild the Replacement Boot Drive
1. Power on your node and log in to the node by using the `qq` CLI.

1. To get `root` privileges, run the `sudo qsh` command.

1. To stop the Qumulo Networking Services, run the `service qumulo-networking stop` command.

1. To configure the IP address for the node, run the `ip addr add` command and specify the node's IP address. For example:

   ```bash
   ip addr add {{site.exampleIP0}}/CDR dev bond0
   ```

1. Ensure that the node can ping other nodes in the cluster.

1. Run the `rebuild_boot_drive.py` script and specify the IP address of _another node_ in the cluster, the ID of the node whose boot drive has been replaced, and the password of the administrative account of the cluster. For example:

   {% include note.html content="If your password includes special characters such as the parenthesis (`(`) or the asterisk (`*`), use the backslash (`\`) to escape these characters." %}

   
   ```bash
   /opt/qumulo/rebuild_boot_drive.py \
     --address {{site.exampleIP1}} \
     --node-id 2 \
     --username admin \
     --password my\(Special\*Password
   ```

   Follow the prompts.

1. When the process is complete, reboot the node.
