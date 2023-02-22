---
title: "Replacing Nodes in a Qumulo Cluster by Performing a Transparent Platform Refresh"
summary: "This section explains how to replace the nodes that have reached their retirement or end of life in your Qumulo cluster and how to migrate your cluster to a different license class by performing a transparent platform refresh."
permalink: /administrator-guide/protecting-data/replacing-nodes-by-performing-transparent-platform-refresh.html
sidebar: administrator_guide_sidebar
keywords: cluster, expand, expansion, remove, dispose, get rid of, retirement, end of life, EOL, migrate, migration, license, class, transparent, platform, refresh
---

In Qumulo Core 6.0.0.1 (and higher), you can replace old nodes in your cluster with new nodes to remove nodes that have reached their retirement or end of life or to take advantage of newer hardware.

{{site.data.alerts.important}}
<ul>
  <li>To perform this procedure, you must {{site.contactQumuloCare}}.</li>
  <li>Qumulo Core doesn't support replacing nodes in clusters with more than 100 nodes.</li>
</ul>
{{site.data.alerts.end}}

The node replacement process has two stages:

1. The Qumulo Care team specifies the overall node replacement plan, in scenarios such as the following.

   * We want to replace nodes 2 and 3 in the cluster.
   
   * We want to replace all nodes in the cluster and move the nodes to a higher-performance license class.

1. The Qumulo Care team executes the node replacement steps.

   * **Multi-Step Plan:** This plan type is appropriate when rack space or switch port capacity is limited. Each step adds some of the new nodes to the cluster and removes some of the nodes marked for replacement.
   
   * **Single-Step Plan:** This plan type is appropriate when the speed of node replacement is a priority. A single step adds new nodes to the cluster and removes nodes marked for replacement.

For information about expanding your cluster, see [Adding Nodes to a Qumulo Cluster with Data Protection Configuration Changes](adding-nodes-with-data-protection-changes.md).


## Migrating a Cluster to a Different License Class
In Qumulo Core 6.0.0.1 (and higher), you can migrate your entire cluster to a different license class to accommodate your performance needs. For example, you can migrate your Qumulo cluster from hybrid to all-NVMe nodes.

{% include important.html content="Because it isn't possible to have nodes with differenct license classes in the same cluster, you must migrate all nodes in your cluster to the same license class." %}

As with other node replacements, you can break the migration down into multiple smaller steps.
