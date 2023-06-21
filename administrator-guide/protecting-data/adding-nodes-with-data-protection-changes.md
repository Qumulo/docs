---
title: "Adding Nodes to a Qumulo Cluster with Data Protection Configuration Changes"
summary: "This section explains how to change your Qumulo cluster’s data protection configuration during node-add operations and how to monitor and reduce the impact of configuration changes on your cluster's workload."
permalink: /administrator-guide/protecting-data/adding-nodes-with-data-protection-changes.html
redirect_from:
  - /administrator-guide/protecting-data/changing-data-protection-configuration.html
  - /administrator-guide/protecting-data/changing-adaptive-data-protection-configuration.html
sidebar: administrator_guide_sidebar
keywords: disk_fault_tolerance_level, disk_failure, node_fault_tolerance_level, node_failure, fault_tolerance, node_add, node-add, cluster_expansion, expand, configuration, change, mean_time_to_data_loss, mtdl, mttdl 
---

## Changing the Configuration of Your Cluster's Data Protection
In Qumulo Core 6.1.0.1 (and higher), as you expand your cluster, it might become necessary to change the configuration its _data protection,_ which specifies the disk fault tolerance and, when applicable, the storage efficiency of your cluster.

{{site.data.alerts.important}}
<ul>
  <li>Although you <em>can</em> also change the node fault tolerance level when you change the data protection configuration (to guarantee the same Mean Time to Data Loss threshold), this isn't mandatory.</li>
  <li>{{site.protectingData.contactQumuloCare}} We can recommend the correct cluster expansion scenario to you.</li>
</ul>
{{site.data.alerts.end}}


## Cluster Expansion Scenarios
The following sections describe two cluster expansion scenarios. Identify the scenario that applies to your cluster expansion plan.

### Adding Nodes with Data Protection Reconfiguration
1. To begin the process, {{site.contactQumuloCare}} to discuss your cluster expansion needs. In addition, Qumulo Care can advise you how to:
   
   * Reduce the impact of data protection reconfiguration on your primary workload by decreasing background resource consumption.

   * Speed up the data protection reconfiguration process during off-peak time periods (with impact on your primary workload) by increasing background resource consumption.

{{site.protectingData.monitorProcess}}

When Qumulo Core completes the reconfiguration of data protection, the **Data Protected** section shows the changed disk fault tolerance and node fault tolerance levels and, during the next rebalancing phase, the restriper begins to provision additional usable capacity.

### Adding Nodes Normally (without Data Protection Reconfiguration)
{{site.protectingData.followAddNodeInstructions}}

{{site.protectingData.checkCapacity}}

{{site.protectingData.monitorProcess}}

When the restriper completes the provisioning of additional usable capacity, the **Data Protected** section shows the same disk fault tolerance and node fault tolerance levels as before the node-add operation.
