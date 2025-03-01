{% if page.platform != 'goldTier' %}## Step 1: Connecting the Out-of-Band Management (IPMI) Port{% elsif page.platform == 'goldTier' %}## How the IPMI Port Works{% endif %}

The dedicated out-of-band management port allows functionality such as remote display, control, and power. {% if page.platform != 'goldTier' %}The port uses the Intelligent Platform Management Interface (IPMI) protocol.{% endif %}

The IPMI port is located on the back of your node.{% if page.platform == 'goldTier' %} For more information, see the documentation from your hardware vendor.{% endif %}

{{site.ipmiLoginRequired}}

{% include note.html content="The IPMI username and password are unrelated to your Qumulo administrative credentials." %}
