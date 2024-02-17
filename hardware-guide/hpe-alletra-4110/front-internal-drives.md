---
title: "Front and Internal Drive Bays on HPE Alletra 4110 Nodes"
summary: "This section shows the locations of front drive bays in HPE Alletra 4110 nodes."
permalink: /hardware-guide/hpe-alletra-4110/front-internal-drives.html
sidebar: hardware_guide_sidebar
---

There are 20 drive bay at the front of the {{site.all4110}} node, populated according to your node type.


## 307TB and 153TB Nodes
In [307TB and 153TB nodes](technical-specifications.md), all drive bays are populated.

{% capture alt_tag %}The front drives in the {{site.all4110}} node (307TB and 153TB).{% endcapture %}
{% include image.html alt=alt_tag file="hpe-alletra-4110-front-drive-bays-307tb-153tb.png" url="/hardware-guide/hpe-alletra-4110/images/hpe-alletra-4110-front-drive-bays-307tb-153tb.png" %}


## 38TB Nodes
In [38TB Nodes](technical-specifications.md), some drive bays are empty.

{% include note.html content="In the following diagram, empty drive bays appear in gray." %}

{% capture alt_tag %}The front drives in the {{site.all4110}} node (38TB).{% endcapture %}
{% include image.html alt=alt_tag file="hpe-alletra-4110-front-drive-bays-38tb.png" url="/hardware-guide/hpe-alletra-4110/images/hpe-alletra-4110-front-drive-bays-38tb.png" %}


## NVMe Boot Drive
The NVMe boot drive is located inside the HPE NS204i-u Hot Plug Boot Optimized Storage Device.

{{site.data.alerts.important}}
<ul>
  <li>For help with locating the NS204i-u device and with replacement procedures, <a href="https://www.hpe.com/us/en/contact-hpe.html">contact HPE support</a>.</li>
  <li>Before you remove the boot drive, {{site.contactQumuloCare}} for additional instructions.</li>
</ul>
{{site.data.alerts.end}}

For more information, see the following HPE documentation:

* [Installing the Drives onto HPE NS204i-u Boot Device](https://support.hpe.com/hpesc/public/docDisplay?docId=sd00001830en_us&page=GUID-BB337DF6-B98B-43A7-A609-28CE4AFCEAD6.html)

* [Removing and Replacing the M.2 Boot Device](https://support.hpe.com/hpesc/public/docDisplay?docId=sd00002471en_us&page=GUID-2E7D27B3-9665-4615-87A4-4256C3E8373D.html)

  {% include note.html content="The instructions for installing the HPE NS2014i-u Boot Device and M.2 Boot Device are similar." %}
