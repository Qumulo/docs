## Step 2: Connecting the {{include.ethernetSpeed}} Ports
After you connect the {{include.bmcType}} port, connect your {{include.ethernetSpeed}} ports{{include.portCompatibility}}. There are two {{include.ethernetSpeed}} ports on the back of your node. {{site.unifyNetDefine}}

{% capture ethDiff %}{{site.hardware.ethDiff}}{% endcapture %}
{% include note.html content=ethDiff %}
