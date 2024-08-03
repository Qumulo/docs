---
title: "Front and Internal Drive Bays on HPE Alletra 4140 Nodes"
summary: "This section describes the locations of front drive bays and the internal NVMe boot drive in HPE Alletra 4140 nodes."
permalink: /hardware-guide/hpe-alletra-4140/front-internal-drives.html
sidebar: hardware_guide_sidebar
---

There are 2 large form factor (LFF) drive drawers at the front of the {{site.all4140}} node, populated according to your node type.


## 1600TB Nodes
In [1600TB nodes](technical-specifications.md), the first 92 of the total 98 drive bays are populated:

* Bays 1&ndash;49 in drive drawer 1

* Bays 50&ndash;92 in drive drawer 2

For more information, see [35-Bay Drive Drawer 1 and 2 Numbering](https://support.hpe.com/hpesc/public/docDisplay?docId=sd00003805en_us&page=GUID-CDBBC56B-6F77-4637-BE62-391B833C6FAF.html) in the HPE Alletra Storage Server 4140 Setup and Installation Guide. 


## 1200TB Nodes
In [1200TB Nodes](technical-specifications.md), the first 62 of the total 70 drive bays are populated:

* Bays 1&ndash;35 in drive drawer 1

* Bays 36&ndash;70 in drive drawer 2

For more information, see [49-Bay Drive Drawer 1 and 2 Numbering](https://support.hpe.com/hpesc/public/docDisplay?docId=sd00003805en_us&page=GUID-CDBBC56B-6F77-4637-BE62-391B833C6FAF.html) in the HPE Alletra Storage Server 4140 Setup and Installation Guide.


## NVMe Boot Drive
The NVMe boot drive is located inside the HPE NS204i-u Hot Plug Boot Optimized Storage Device.

{{site.data.alerts.important}}
<ul>
  <li>For help with locating the NS204i-u device and with replacement procedures, <a href="https://www.hpe.com/us/en/contact-hpe.html">contact HPE support</a>.</li>
  <li>Before you remove the boot drive, {{site.contactQumuloCare}} for additional instructions.</li>
</ul>
{{site.data.alerts.end}}

For more information, see the following HPE documentation:

* [Installing the Drives onto HPE NS204i-u Boot Device](https://support.hpe.com/hpesc/public/docDisplay?docId=sd00003806en_us&page=GUID-B12BB08D-14E1-42BC-9E83-055AF47C0566.html)

* [Removing and Replacing the M.2 Boot Device](https://support.hpe.com/hpesc/public/docDisplay?docId=sd00003806en_us&docLocale=en_US&page=GUID-F7B91A13-8AAC-4D4A-8967-FDAD49FF979A.html)

  {% include note.html content="The instructions for installing the HPE NS204i-u Boot Device and M.2 Boot Device are similar." %}
