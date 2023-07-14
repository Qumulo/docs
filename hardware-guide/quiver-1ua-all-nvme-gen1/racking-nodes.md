---
title: "Racking Your Quiver 1U All-NVMe Gen1 Nodes"
summary: "This section explains how to rack Quiver 1UA Gen1 nodes in a data center."
permalink: /hardware-guide/quiver-1ua-all-nvme-gen1/racking-nodes.html
sidebar: hardware_guide_sidebar
keywords: rack, racking, rails, server_rack, chassis, insert_chassis, Quiver_1U_All-NVMe_Gen1, Quiver, Quiver_1UA
---

<a id="insert-chassis"></a>
## Inserting the Chassis into the Server Rack
{{site.data.alerts.important}}
<ul>
  <li>{{site.twoPeopleOrLift}}</li>
  <li>If you install the {{site.q1uag1}} <a href="technical-specifications.html">245 TB</a> node type, ensure that the node cabling has sufficient slack to allow you to reach the <a href="drive-bay-mapping.html#nvme-drives-in-internal-storage-bays">internal storage bays</a>.</li>
</ul>
{{site.data.alerts.end}}

### To Insert a Chassis without Drives into a Standard Server Rack
For nodes without drives, follow the [Tool-Less Friction Rail Kit Installation Guide](https://dlcdnets.asus.com/pub/ASUS/server/RS520-E9-RS8/Manual/E21630_Tool-less_Friction_Rail_Kit_Installation_Guide_EM_WEB.pdf?model=RS500A-E12-RS12U) in the ASUS documentation.

### To Insert a Chassis with Internal Drives into a Deep Server Rack
For nodes with drives in [internal storage bays](drive-bay-mapping.html#nvme-drives-in-internal-storage-bays), you can purchase the optional [1.2m Half Extension Ball Bearing Type Rail Kit](https://dlcdnets.asus.com/pub/ASUS/server/RS500A-E11/manual/1.2m_Half_Extension_Ball_bearing_Type_Rail_Kit_Instruction_13SV000IAM0901.pdf?model=RS500A-E12-RS12U) together with the Cable Management Arm. These two items replace the Tool-Less Friction Rail Kit.

{% include note.html content="To permit access to the internal storage bays, leave clearance at the top of the chassis." %}

<a id="remove-chassis"></a>
## Removing the Chassis from the Server Rack
Perform the steps for inserting the chassis in reverse order.
