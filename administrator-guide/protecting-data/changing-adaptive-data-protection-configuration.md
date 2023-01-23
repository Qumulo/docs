---
title: "Changing the Adaptive Data Protection Configuration for Your Qumulo Cluster During Node-Add Operations"
summary: "This section explains how to change your Qumulo cluster’s adaptive data protection configuration during node-add operations and how to monitor and reduce the impact of this reconfiguration on your cluster's workload."
permalink: /administrator-guide/protecting-data/changing-adaptive-data-protection-configuration.html
sidebar: administrator_guide_sidebar
keywords: disk-fault-tolerance level, disk failure, node-fault-tolerance level, node failure, fault tolerance, node add, node-add, cluster expansion, expand, reconfiguration, mean time to data loss, mtdl, mttdl 
---

## Reconfiguring Your Cluster's Adaptive Data Protection
In Qumulo Core 5.3.4 (and higher), as you expand your cluster, you might need to reconfigure its data protection to change the disk- or node-fault-tolerance level (to guarantee the same Mean Time to Data Loss threshold) and, when possible, to take advantage of higher storage efficiency.

{% capture contactUs %}{{site.protectingData.contactQumuloCare}} We can recommend the correct cluster expansion scenario to you.{% endcapture %}
{% include important.html content=contactUs %}


## Cluster Expansion Scenarios
The following sections describe two cluster expansion scenarios. Identify the scenario that applies to your cluster expansion plan.

### Adding Nodes without Adaptive Data Protection Reconfiguration
{{site.protectingData.followAddNodeInstructions}}

{{site.protectingData.checkCapacity}}

{{site.protectingData.monitorProcess}}

When the restriper completes the provisioning of additional usable capacity, the **Data Protected** section shows the same disk-fault-tolerance and node-fault-tolerance levels as before the node-add operation.

### Adding Nodes with Adaptive Data Protection Reconfiguration
1. Contact Qumulo Care for help with one of the following strategies.
   
   * Reduce the impact of data protection reconfiguration on your primary workload by decreasing background resource consumption.

   * Speed up the data protection reconfiguration process during off-peak time periods (with impact on your primary workload) by increasing background resource consumption.

{{site.protectingData.monitorProcess}}

When Qumulo Core completes the reconfiguration of data protection, the **Data Protected** section shows the changed disk-fault-tolerance and node-fault-tolerance levels and, during the next rebalancing phase, the restriper begins to provision additional usable capacity.
