---
title: "Supermicro A+ ASG-1014S-ACR12N4H Technical Specifications"
summary: "This section provides technical specifications for Supermicro A+ ASG-1014S-ACR12N4H nodes."
permalink: hardware-guide/supermicro-a-plus-asg-1014s-acr12n4h/technical-specifications.html
redirect_from:
  - hardware/supermicro-a-plus-asg-1014s-acr12n4h/technical-specifications.html
sidebar: hardware_guide_sidebar
keywords: technical specifications, tech specs, specs, specifications, Supermicro 1014S, ACR12N4H
---

This section provides technical specifications for {{site.sm1014s}} nodes.

{{site.data.alerts.note}}
{% include content-reuse/hybrid-platforms-find-out-ssd-size.md %}
{{site.data.alerts.end}}

<table cellspacing="0" cellpadding="0">
  <thead>
    <tr>
      <th></th>
      <th><strong>{{site.sm1014s}} 240 TB (General Purpose)</strong></th>
      <th><strong>{{site.sm1014s}} 216 TB (General Purpose)</strong></th>
      <th><strong>{{site.sm1014s}} 240 TB (Active)</strong></th>
      <th><strong>{{site.sm1014s}} 216 TB (Active)</strong></th>
      <th><strong>{{site.sm1014s}} 96 TB (Active)</strong></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><strong>Connectivity Ports (NIC)</strong></td>
      <td colspan="2" style="text-align: center;">2 &#215; 25 GbE (1 &#215; Mellanox ConnectX-4 Lx NIC)<br>or 2 &#215; 25 GbE (1 &#215; SMC AOC-S25G-b2S NIC)</td>
      <td colspan="3" style="text-align: center;">2 &#215; 100 GbE (1 &#215; Mellanox ConnectX-6 NIC)<br>or 2 &#215; 100 GbE (1 &#215; SMC AOC-S100G-b2C NIC)</td>    
    </tr>
    <tr>
      <td><strong>Management Ports (BMC)</strong></td>
      <td colspan="5" style="text-align: center;">1 &#215; 1 GbE Base-T (RJ45)</td>
    </tr>
    <tr>
      <td><strong>Solid State Storage Media (Cache)</strong></td>
      <td colspan="4" style="text-align: center;">4 &#215; 1.92 TB NVMe<br>or 4 &#215; 3.84 TB NVMe<br>or 4 &#215; 7.68 TB NVMe</td>
      <td>4 &#215; 960 GB NVMe<br>or 4 &#215; 1.92 TB NVMe<br>or 4 &#215; 3.84 TB NVMe</td>
    </tr>
    <tr>
      <td><strong>HDD Storage Media</strong></td>
      <td>12 &#215; 20 TB</td>
      <td>12 &#215; 18 TB</td>
      <td>12 &#215; 20 TB</td>
      <td>12 &#215; 18 TB</td>
      <td>12 &#215; 8 TB</td>
    </tr>    
    <tr>
      <td><strong>Boot Drive</strong></td>
      <td colspan="5" style="text-align: center;">1 &#215; 960 GB M.2 NVMe</td>
    </tr>
    <tr>
      <td><strong>CPU</strong></td>
      <td colspan="5" style="text-align: center;">AMD EPYC 7232P 8-Core Processor</td>
    </tr>
    <tr>
      <td><strong>Memory</strong></td>
      <td colspan="5" style="text-align: center;">96 GB (6 GB &#215; 16)</td>
    </tr>
    <tr>
      <td><strong>Power Supply</strong></td>
      <td colspan="5" style="text-align: center;">2 &#215; 750 W Power Supplies</td>
    </tr>
    <tr>
      <td><strong>Dimensions (H &#215; W &#215; D)</strong></td>
      <td colspan="5" style="text-align: center;">1.7" &#215; 17.6" &#215; 37" (43 mm &#215; 447 mm &#215; 940 mm)</td>
    </tr>
    <tr>
      <td><strong>Weight</strong></td>
      <td colspan="5" style="text-align: center;">39.5 lbs (17.5 kg)</td>
    </tr>
    <tr>
      <td><strong>Power Requirements</strong></td>
      <td colspan="5" style="text-align: center;">100&ndash;240 V, 50/60Hz</td>
    </tr>
    <tr>
      <td><strong>Typical Power Consumption</strong></td>
      <td colspan="2" style="text-align: center;">1.10 A @ 240 V<br>(2.39 A @ 110 V)</td>
      <td colspan="2" style="text-align: center;">1.18 A @ 240 V<br>(2.56 A @ 110 V)</td>
      <td>1.25 A @ 240 V<br>(2.74 A @ 110 V)</td>
    </tr>
    <tr>
      <td><strong>Typical Thermal Rating</strong></td>
      <td colspan="2" style="text-align: center;">263 W (VA)<br>(897 BTU/hr)</td>
      <td colspan="2" style="text-align: center;">282 W (VA)<br>(962 BTU/hr)</td>
      <td>301 W (VA)<br>(1,028 BTU/hr)</td>
    </tr>
    <tr>
      <td><div><strong>Maximum Power Consumption</strong></div></td>
      <td colspan="2" style="text-align: center;">1.20 A @ 240 V<br>(2.62 A @ 110 V)</td>
      <td colspan="2" style="text-align: center;">1.32 A @ 240 V<br>(2.88 A @ 110 V)</td>
      <td>1.36 A @ 240 V<br>(2.97 A @ 110 V)</td>
    </tr>
    <tr>
      <td><strong>Maximum Thermal Rating</strong></td>
      <td colspan="2" style="text-align: center;">288 W (VA)<br>(982 BTU/hr)</td>
      <td colspan="2" style="text-align: center;">317 W (VA)<br>(1,081 BTU/hr)</td>
      <td>327 W (VA)<br>(1,116 BTU/hr)</td>
    </tr>
    <tr>
      <td><strong>Operating Temperature</strong></td>
      <td colspan="5" style="text-align: center;">50&deg;F&ndash;95&deg;F (10&deg;C&ndash;35&deg;C)</td>
    </tr>
    <tr>
      <td><strong>Non-Operating Temperature</strong></td>
      <td colspan="5" style="text-align: center;">-40&deg;F&ndash;140&deg;F (-40&deg;C&ndash;60&deg;C)</td>
    </tr>
    <tr>
      <td><strong>Operating Relative Humidity</strong></td>
      <td colspan="5" style="text-align: center;">8%&ndash;90% (non-condensing)</td>
    </tr>
    <tr>
      <td><div><strong>Non-Operating Relative Humidity</strong></div></td>
      <td colspan="5" style="text-align: center;">5%&ndash;95% (non-condensing)</td>
    </tr>
  </tbody>
</table>
