---
title: "Racking Your Supermicro A+ WIO 1114S-WN10RT Nodes"
summary: "This section describes how to use the outside and inside rails of Supermicro 1114S nodes and how to rack nodes in a data center."
permalink: /hardware-guide/supermicro-a-plus-wio-1114s-wn10rt/racking-nodes.html
redirect_from:
  - /hardware/supermicro-a-plus-wio-1114s-wn10rt/racking-nodes.html
sidebar: hardware_guide_sidebar
---

## To Attach the Outer and Inner Rails
{{site.data.alerts.note}}
<ul>
  <li>Because the left and right rails of your nodes are identical, the words <strong>FRONT</strong> and <strong>BACK</strong> might appear upside down.</li>
  <li>Each <em>outer rail</em> comes as two connected pieces and attaches to your server rack.</li>
  <li>Each <em>inner rail</em> comes as two separate pieces and attaches to the node chassis.</li>
</ul>
{{site.data.alerts.end}}

1. Adjust the outer rails to the length of your server rack.

1. Line up the edge of the outer rail between the rack unit (RU) markers, insert the tabs on the edge of the rail into the mounting holes, and push the rail into the rack until the quick-release clicks into place. This process is the same for the front and back of your rack.

   {% include image.html alt="Snap the Outer Rail into the Rack" file="supermicro-1114s-outer-rail-snap-into-rack.png" %}

1. Snap the inner rails to the chassis and secure them by using two screws on each side, near the middle of the chassis.

   {% include note.html content="First attach the front inner rails, then the back inner rails." %}

   {% include image.html alt="Attach the Inner Rail to the Chassis by Using Screws" file="supermicro-1114s-inner-rail-attach-to-chassis-with-screws.png" %}


## To Insert the Chassis
1. Align the outer and inner rails and insert the chassis into the server rack.

1. Attach the chassis to the rack by using one screw on each side, on the front of the chassis.


## To Remove the Chassis
1. Disconnect any cables from the chassis. 

1. Remove one screw from each side of the front of the chassis.

1. Pull the chassis out from the server rack partially. When the first set of black snaps appears, pinch the long piece of the snap towards the short one (up on one side, down on the other).

   {% include image.html alt="Pinch the Black Latch on Both Sides" file="supermicro-1114s-remove-chassis-pinch-black-latch-on-both-sides.png" %}

1. Continue to pull the chassis from the server rack. When the second set of black snaps appears, pinch the long piece of each snap towards the short one (up on one side, down on the other) and remove the chassis completely.
