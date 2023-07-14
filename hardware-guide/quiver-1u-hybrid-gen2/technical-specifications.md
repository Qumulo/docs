---
title: "Quiver 1U Hybrid Gen2 Technical Specifications"
summary: "This section provides technical specifications for Quiver 1U Hybrid Gen2 node types."
permalink: /hardware-guide/quiver-1u-hybrid-gen2/technical-specifications.html
sidebar: hardware_guide_sidebar
keywords: technical_specifications, tech_specs, specs, specifications, Quiver_1U_Hybrid_Gen2, Quiver, Quiver_1UH, QVRG2-96T, QVRG2-240T, QVRG296T, QVRG2240T
---

{{site.data.alerts.note}}
<ul>
  <li>{% include content-reuse/hybrid-platforms-find-out-ssd-size.md %}</li>
  <li>{{site.noNIC}}</li>
</ul>
{{site.data.alerts.end}}

<table cellspacing="0" cellpadding="0">
  <thead>
    <tr>
      <th></th>
      <th><strong>{{site.q1uhg2Long}} 240 TB (General Purpose)</strong></th>
      <th><strong>{{site.q1uhg2Long}} 240 TB (Active)</strong></th>
      <th><strong>{{site.q1uhg2Long}} 96 TB (General Purpose)</strong></th>
      <th><strong>{{site.q1uhg2Long}} 96 TB (Active)</strong></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><strong>Connectivity Ports (NIC)</strong></td>
      <td colspan="1" style="text-align: center;">2 &#215; 25 GbE (1 &#215; Mellanox ConnectX-4 Lx NIC)<br>or 2 &#215; 25 GbE (1 &#215; Broadcom P225P NIC)</td>
      <td colspan="1" style="text-align: center;">2 &#215; 25 GbE (1 &#215; Mellanox ConnectX-4 Lx NIC)<br>or 2 &#215; 25 GbE (1 &#215; Broadcom P225P NIC)<br>or 2 &#215; 100 GbE (1 &#215; Mellanox ConnectX-5 Lx NIC)<br>or 2 &#215; 100 GbE (1 &#215; Broadcom P2100G NIC)</td>
      <td colspan="1" style="text-align: center;">2 &#215; 25 GbE (1 &#215; Mellanox ConnectX-4 Lx NIC)<br>or 2 &#215; 25 GbE (1 &#215; Broadcom P225P NIC)</td>
      <td colspan="1" style="text-align: center;">2 &#215; 25 GbE (1 &#215; Mellanox ConnectX-4 Lx NIC)<br>or 2 &#215; 25 GbE (1 &#215; Broadcom P225P NIC)<br>or 2 &#215; 100 GbE (1 &#215; Mellanox ConnectX-5 Lx NIC)<br>or 2 &#215; 100 GbE (1 &#215; Broadcom P2100G NIC)</td>
    </tr>
    <tr>
      <td><strong>Management Ports (BMC)</strong></td>
      <td colspan="4" style="text-align: center;">1 &#215; 1 GbE Base-T (RJ45)</td>
    </tr>
    <tr>
      <td><strong>Solid State Storage Media (Cache)</strong></td>
      <td colspan="2" style="text-align: center;">4 &#215; 1.92 TB NVMe<br>or 4 &#215; 3.84 TB NVMe<br>or 4 &#215; 7.68 TB NVMe</td>
      <td colspan="2" style="text-align: center;">4 &#215; 960 GB NVMe<br>or 4 &#215; 1.92 TB NVMe<br>or 4 &#215; 3.84 TB NVMe</td>
    </tr>
    <tr>
      <td><strong>HDD Storage Media</strong></td>
      <td colspan="2" style="text-align: center;">12 &#215; 20 TB</td>
      <td colspan="2" style="text-align: center;">12 &#215; 8 TB</td>
    </tr>    
    <tr>
      <td><strong>Boot Drive</strong></td>
      <td colspan="4" style="text-align: center;">1 &#215; 240 GB M.2 SATA</td>
    </tr>
    <tr>
      <td><strong>CPU</strong></td>
      <td style="text-align: center;">2 &#215; Intel Xeon Bronze 3204 CPU @ 1.90 GHz</td>
      <td style="text-align: center;">2 &#215; Intel Xeon Silver 4210 CPU @ 2.20 GHz</td>
      <td style="text-align: center;">2 &#215; Intel Xeon Bronze 3204 CPU @ 1.90 GHz</td>
      <td style="text-align: center;">2 &#215; Intel Xeon Silver 4210 CPU @ 2.20 GHz</td>
    </tr>
    <tr>
      <td><strong>Memory</strong></td>
      <td style="text-align: center;">64 GB (16 GB &#215; 4)</td>      
      <td style="text-align: center;">96 GB (16 GB &#215; 6)</td>
      <td style="text-align: center;">64 GB (16 GB &#215; 4)</td>      
      <td style="text-align: center;">96 GB (16 GB &#215; 6)</td>
    </tr>
    <tr>
      <td><strong>Power Supply</strong></td>
      <td colspan="4" style="text-align: center;">2 &#215; 700 W Power Supplies</td>
    </tr>
    <tr>
      <td><strong>Dimensions (H &#215; W &#215; D)</strong></td>
      <td colspan="4" style="text-align: center;">1.7" &#215; 17.6" &#215; 34.7" (43.2 mm &#215; 448 mm &#215; 881 mm)</td>
    </tr>
    <tr>
      <td><strong>Weight</strong></td>
      <td colspan="4" style="text-align: center;">66 lbs (30 kg)</td>
    </tr>
    <tr>
      <td><strong>Power Requirements</strong></td>
      <td colspan="4" style="text-align: center;">90&ndash;264 V, 47/63 Hz</td>
    </tr>
    <tr>
      <td><strong>Typical Power Consumption</strong></td>
      <td>1.55 A @ 240 V<br>(3.39 A @ 110 V)</td>
      <td>1.60 A @ 240 V<br>(3.50 A @ 110 V)</td>
      <td>1.55 A @ 240 V<br>(3.39 A @ 110 V)</td>
      <td>1.60 A @ 240 V<br>(3.35 A @ 110 V)</td>
    </tr>
    <tr>
      <td><strong>Typical Thermal Rating</strong></td>
      <td>373 W (VA)<br>(1273 BTU/hr)</td>
      <td>385 W (VA)<br>(1313 BTU/hr)</td>
      <td>373 W (VA)<br>(1273 BTU/hr)</td>
      <td>385 W (VA)<br>(1313 BTU/hr)</td>
    </tr>
    <tr>
      <td><div><strong>Maximum Power Consumption</strong></div></td>
      <td>1.72 A @ 240 V<br>(3.75 A @ 110 V)</td>
      <td>1.84 A @ 240 V<br>(4.01 A @ 110 V)</td>
      <td>1.84 A @ 240 V<br>(4.01 A @ 110 V)</td>
      <td>1.95 A @ 240 V<br>(4.26 A @ 110 V)</td>
    </tr>
    <tr>
      <td><strong>Maximum Thermal Rating</strong></td>
      <td>413 W (VA)<br>(1409 BTU/hr)</td>
      <td>441 W (VA)<br>(1505 BTU/hr)</td>
      <td>441 W (VA)<br>(1505 BTU/hr)</td>
      <td>469 W (VA)<br>(1600 BTU/hr)</td>
    </tr>
    <tr>
      <td><strong>Operating Temperature</strong></td>
      <td colspan="4" style="text-align: center;">41&deg;F&ndash;95&deg;F (5&deg;C&ndash;35&deg;C)</td>
    </tr>
    <tr>
      <td><strong>Non-Operating Temperature</strong></td>
      <td colspan="4" style="text-align: center;">-40&deg;F&ndash;158&deg;F (-40&deg;C&ndash;70&deg;C)</td>
    </tr>
    <tr>
      <td><strong>Operating Relative Humidity</strong></td>
      <td colspan="4" style="text-align: center;">20%&ndash;85% (non-condensing)</td>
    </tr>
    <tr>
      <td><div><strong>Non-Operating Relative Humidity</strong></div></td>
      <td colspan="4" style="text-align: center;">10%&ndash;95% (non-condensing)</td>
    </tr>
  </tbody>
</table>
