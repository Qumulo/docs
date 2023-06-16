---
title: "Racking Your Quiver 1U All-NVMe Gen1 Nodes"
summary: "This section explains how to rack Quiver 1UA Gen1 nodes in a data center."
permalink: /hardware-guide/quiver-1ua-all-nvme-gen1/racking-nodes.html
sidebar: hardware_guide_sidebar
keywords: rack, racking, rails, server_rack, chassis, insert_chassis, Quiver_1U_All-NVMe_Gen1
---

## To Install the Rails in the Server Rack
Follow the [Tool-Less Friction Rail Kit Installation Guide](https://dlcdnets.asus.com/pub/ASUS/server/RS520-E9-RS8/Manual/E21630_Tool-less_Friction_Rail_Kit_Installation_Guide_EM_WEB.pdf?model=RS500A-E12-RS12U) in the ASUS documentation.


<a id="insert-chassis"></a>
## To Insert the Chassis into the Server Rack
{% capture content_tag %}{{site.twoPeopleOrLift}}{% endcapture %}
{% include important.html content=content_tag %}

* By default, this node type comes with the [1m Half Extension Ball Bearing Type Rail Kit](https://dlcdnets.asus.com/pub/ASUS/server/RS500A-E11/manual/1m_Half_Extension_Ball_bearing_Type_Rail_Kit_Instruction_13SV000IAM0611.pdf?model=RS500A-E12-RS12U).

* For data centers that have deeper racks and use the cable management arm, see [1.2m Half Extension Ball Bearing Type Rail Kit Instructions](https://dlcdnets.asus.com/pub/ASUS/server/RS500A-E11/manual/1.2m_Half_Extension_Ball_bearing_Type_Rail_Kit_Instruction_13SV000IAM0901.pdf?model=RS500A-E12-RS12U) in the ASUS documentation.

* For 245 TB nodes that need to extend fully to access the 4 NVMe drives in [internal storage bays](drive-bay-mapping.html#internal-storage-bays), see [1U Height Full Extension Ball Bearing Type Rail Kit Instructions](https://dlcdnets.asus.com/pub/ASUS/server/RS500A-E11/manual/1U_Height_Full_Extension_Ball_bearing_Type_Rail_Kit_Instruction.pdf?model=RS500A-E12-RS12U) in the ASUS documentation.


<a id="remove-chassis"></a>
## To Remove the Chassis from the Server Rack
Perform the steps for inserting the chassis in reverse order.
