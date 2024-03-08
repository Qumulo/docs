---
title: "Adding Nodes with Adaptive Data Protection to a Qumulo Cluster"
summary: "This section explains how to configure Adaptive Data Protection for your Qumulo cluster during node-add operations."
permalink: /administrator-guide/node-addition-replacement/adding-nodes-adaptive-data-protection.html
redirect_from:
  - /administrator-guide/protecting-data/adding-nodes-with-data-protection-changes.html
  - /administrator-guide/protecting-data/changing-data-protection-configuration.html
  - /administrator-guide/protecting-data/changing-adaptive-data-protection-configuration.html
sidebar: administrator_guide_sidebar
---

* {{site.adp.before612AddOnly}}

  {{site.adp.before612Description}} {{site.contactQumuloCare}}.

* {{site.adp.after612AddReplace}}


{% capture waitForADP %}Your cluster's usable capacity doesn't increase until the data protection reconfiguration is complete. Because data protection reconfiguration is a long process (that can take days or weeks), we don't recommend beginning this process when your cluster is nearly running out of usable capacity. In this scenario, {{site.contactQumuloCare}}.{% endcapture %}
{% include note.html content=waitForADP %}


## To Add a Node with Adaptive Data Protection to a Qumulo Cluster
A cluster's data protection configuration includes the stripe configuration (for example, `10.8`) and the node fault tolerance level.

{% capture noReorder %}Ensure that your configuration and node order are correct. Unless you add more nodes, {{site.cannotReorderNodes}}{% endcapture %}
{% include important.html content=noReorder %}

1. To select the new data protection configuration for your nodes, {{site.contactQumuloCare}}.
   
{{site.rackNewNodes}}

{{site.determineUUIDs}}

{{site.noteDownUUIDs}}

1. To add your nodes to the cluster, use the `qq add_nodes` command and specify the node UUIDs (their ordering in the command determines their ordering in the cluster), the configuration type, and the node fault tolerance level.

   In the following example, we change the stripe configuration to 10.8 and the node fault tolerance level to 2 nodes.

   ```bash
   qq add_nodes \
     --node-uuids {{site.exampleUUID41}} \
       {{site.exampleUUID42}} \
     --target-stripe-config 10 8 \
     --target-max-node-failures 2
   ```
   
   {{site.commandOutput}}

   ```
   Current cluster:
       Usable capacity: 600 TB
       Node fault tolerance level: 1 node
   With the selected node-add operation and data protection reconfiguration:
       Usable capacity: 800 TB
       Node fault tolerance level: 2 nodes
   ```

1. To confirm the configuration with the selected node-add and data protection configuration operations, enter `yes`.

{% include content-reuse/monitoring-data-protection-reconfiguration-process.md %}
