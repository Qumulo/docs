---
title: "Racking Your Quiver 1U Hybrid Gen2 Nodes"
summary: "This section explains how to rack Quiver 1UH Gen 2 nodes in a data center."
permalink: /hardware-guide/quiver-1u-hybrid-gen2/racking-nodes.html
sidebar: hardware_guide_sidebar
keywords: rack, racking, rails, server_rack, chassis, insert_chassis, Quiver_1U_Hybrid_Gen2
---

## To Install the Rails in the Server Rack
{% include important.html content="For square server rack holes, you must attach the square stud fully inside the square hole on the rack rail." %}

1. Adjust the chassis rails to the length of your server rack.

1. Line up each chassis rail with your server rack rail and push the clip on the rail in while sliding the studs into the mounting holes on the rack rail, until the studs click into place and the clip latches over the rack. This process is the same for the front and back of your rack.

   {% capture alt_tag_snap_rail %}Snap the {{site.q1uhg2Long}} Node Rail into the Rack{% endcapture %}
   {% include image.html alt=alt_tag_snap_rail file="quiver-1u-hybrid-gen2-rail-snap-into-rack.png" %}

<a id="insert-chassis"></a>
## To Insert the Chassis into the Server Rack
{% capture content_tag %}{{site.twoPeopleOrLift}}{% endcapture %}
{% include important.html content=content_tag %}

1. Place the chassis onto the rails and slide it into the server rack.

   {% capture content_tag_doNotWarp %}{{site.doNotWarpChassis}}{% endcapture %}
   {% include caution.html content=content_tag_doNotWarp %}

1. Attach the chassis to the rack by using one screw on each side on the front of the chassis.

   {% capture alt_tag_insert_chassis %}Insert the {{site.q1uhg2Long}} Node Chassis into the Rack{% endcapture %}
   {% include image.html alt=alt_tag_insert_chassis file="quiver-1u-hybrid-gen2-insert-chassis-into-rack.png" %}

1. Attach the two stoppers marked **L** (left) and **R** (right) by using #10-32 &times; 13" screws on the back of the chassis.

<a id="remove-chassis"></a>
## To Remove the Chassis from the Server Rack
Perform the steps for inserting the chassis in reverse order.
