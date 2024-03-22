---
title: "Replacing Nodes in a Qumulo Cluster by Performing a Transparent Platform Refresh"
summary: "This section explains how to replace nodes that have reached retirement or end of life by performing a two-stage transparent platform refresh on clusters that run Qumulo Core 6.1.0.3 (and higher)."
permalink: /administrator-guide/node-addition-replacement/replacing-nodes-transparent-platform-refresh.html
redirect_from:
  - /administrator-guide/protecting-data/replacing-nodes-by-performing-transparent-platform-refresh.html
sidebar: administrator_guide_sidebar
---

{{site.data.alerts.note}}
<ul>
  <li>Qumulo Core doesn't support replacing nodes in clusters with more than 100 nodes.</li>
  <li>In Qumulo Core 6.1.2.2 (and higher), you can use the <code>qq</code> CLI to replace nodes. To replace nodes on a lower version of Qumulo Core, {{site.contactQumuloCare}}.</li>
</ul>
{{site.data.alerts.end}}


## How Transparent Platform Refresh Works
Transparent platform refresh comprises two stages. For help with your node replacement plan, {{site.contactQumuloCare}}.

### Stage 1: Register a Node Replacement Plan
In this stage, you [register a node replacement plan](#register-node-replacement-plan) with your cluster. The plan includes information about the nodes to replace and the data protection configuration.

In following example, we use a four-node cluster and:

* Replace nodes 1-4 with five new nodes in a single step

* Change the data protection configuration to the `8.6` stripe configuration with 1-node fault tolerance

### Stage 2: Execute the Node Replacement Plan Steps
In this stage, you [execute the node replacement plan's steps](#execute-node-replacement-plan-steps) and Qumulo Core performs data protection reconfiguration.

{% include note.html content="It isn't possible to add nodes or begin another node replacement step while a node replacement step is already in progress." %}

There are two node replacement plan types:

* **Single-Step Node Replacement:** Qumulo Core adds all new nodes and removes all nodes marked for replacement in a single step. Use this approach when the node replacement speed is a priority.

* **Multi-Step Node Replacement:** Each step of the plan adds some the new nodes and removes some nodes marked for replacement. Use this approach when rack space or switch port capacity in your data center is limited.

### Cluster Properties During Node Replacement
* When a replacement step begins, Qumulo Core distributes floating IP addresses among the nodes in the [combined cluster](#combined-cluster). After Qumulo Core removes nodes marked for replacement, it redistributes any client connections that use floating IP addresses among the nodes that remain in the cluster.

* <a id="combined-cluster"></a>

  While a node replacement step is in progress, both new nodes and nodes marked for replacement appear on the **Cluster** page of the Qumulo Core Web UI and clients can connect to any of the nodes in the _combined cluster_ while the step is in progress.

* When a node replacement step is complete, the reassignment of static IP addresses differs between versions of Qumulo Core:

  * In Qumulo Core 6.3.0.1 (and higher), the static IP addresses assigned to nodes remain unchanged and Qumulo Core removes only the static IP addresses for nodes removed from the cluster.
 
  * In Qumulo Core versions lower than 6.3.0.1, Qumulo Core reassigns static IP addresses to different nodes. To view the reassigned IP addresses in the Qumulo Core Web UI, click **Cluster > Network Configuration.**

* When Qumulo Core adds nodes to a cluster, it assigns node IDs sequentially, without reusing or changing IDs.

  For example, if you have a four-node cluster with node IDs 1-4, and you replace node IDs 2 and 3 with two new nodes, after node replacement the cluster contains node IDs 1, 4, 5, and 6. If you add another node, it has the ID 7.

* A cluster's usable capacity doesn't increase until:

  * Any data protection reconfiguration is complete
    
  * The last step of the node replacement plan is in progress
 
  For example, if you replace nodes in a single step without data protection reconfiguration, usable capacity increases as soon as Qumulo Core begins the step.


## Prerequisites
Ensure that the number of static and floating IP addresses is equal to or greater than the number of nodes in the [combined cluster](#combined-cluster).

<a id="register-node-replacement-plan"></a>
## Step 1: Register a Node Replacement Plan by Using the qq CLI
1. Run the `qq replace_nodes register_plan` command and the `--nodes-to-be-replaced` flag to specify the nodes to replace and the `--target-stripe-config` flag to specify the stripe configuration. For example:

   ```bash
   qq replace_nodes register_plan \
     --nodes-to-be-replaced 1 2 3 4 \
     --target-stripe-config 8 6
   ```

   Qumulo Core stores the node replacement plan on your cluster.

   {{site.data.alerts.note}}
   <ul>
     <li>If your plan includes data protection reconfiguration, Qumulo Core records only the stripe configuration. You specify the node fault tolerance when you execute the plan steps.</li>
     <li>If your plan doesn't include data protection reconfiguration, you can omit the <code>--target-stripe-config</code> flag.</li>
     <li>To replace all nodes in the cluster, use the <code>--replace-all</code> flag instead of the <code>--nodes-to-be-replaced</code> flag.</li>
   </ul>
   {{site.data.alerts.end}}

{{site.rackNewNodes}}

{{site.determineUUIDs}}

{{site.noteDownUUIDs}}


<a id="execute-node-replacement-plan-steps"></a>
## Step 2: Execute the Node Replacement Plan Steps by Using the qq CLI
1. Run the `qq replace_nodes add_nodes_and_replace` command to initiate each step, the `--nodes-being-replaced` flag to specify the nodes to replace, and the `--node-uuids` flag to specify the nodes to add during the current step.

   {% capture noReorder %}Qumulo Core adds nodes to the cluster in the order in which you list their UUIDs after the `--node-uuids` flag. When you begin the node replacement step, {{site.cannotReorderNodes}}{% endcapture %}
   {% include important.html content=noReorder %}

   If your plan includes data protection reconfiguration, use the `--reconfigure-data-protection` and `--target-max-node-failures` flags to initiate the reconfiguration during the current step. For example:

   ```bash
   qq replace_nodes add_nodes_and_replace \
     --nodes-being-replaced 1 2 3 4 \
     --node-uuids {{site.exampleUUID41}} {{site.exampleUUID42}} \
     --reconfigure-data-protection \
     --target-max-node-failures 1
   ```

   {{site.exampleOutput}}

   ```
   Current cluster:
       Usable capacity: 200 TB
       Node fault tolerance level: 1 node
   With the selected node replacement step:
       Usable capacity: 220 TB
       Node fault tolerance level: 1 node
   ```
   
   {% include note.html content="To replace all nodes in the cluster, use the `--replace-all` flag instead of the `--nodes-being-replaced` flag." %}

1. To confirm the reconfiguration with the selected node-replace and data protection configuration operations, enter `yes`.

   For more information, see [Monitoring the Data Protection Reconfiguration Process](#monitoring-data-protection-reconfiguration).

1. Wait for the node replacement step to complete.

   After each node replacement step, Qumulo Core begins to migrate data from existing nodes in the background.
   
   {% include note.html content="This is a long process (that can take days or weeks). When the data migration is complete, Qumulo Core removes the nodes marked for replacement from the cluster. These nodes no longer appear on the **Cluster** page of the Qumulo Core Web UI." %}

1. Unrack the removed nodes from your data center.

1. Initiate the next node replacement step.


## Viewing, Editing, and Canceling the Node Replacement Plan

* To view the current node replacement plan, run the {% include qq.html command="replace_nodes" %} command with the `get_plan` subcommand.

  If a node replacement step is in progress, the command shows the list of nodes in process of being replaced during the current step.

* To edit the node replacement plan after you register it with your cluster, run the {% include qq.html command="replace_nodes" %} with the `register_plan` subcommand and [a new node replacement plan](#register-node-replacement-plan).

* To cancel the current node replacement plan, run the {% include qq.html command="replace_nodes" %} command with the `cancel_plan` subcommand.

  {% include important.html content="Canceling a node replacement plan after executing one or more steps might make it impossible to reregister and complete the plan." %}


<a id="monitoring-data-protection-reconfiguration"></a>
{% include content-reuse/monitoring-data-protection-reconfiguration-process.md %}
