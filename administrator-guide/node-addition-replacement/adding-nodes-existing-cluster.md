---
title: "Adding Nodes to an Existing Qumulo Cluster"
summary: "This section explains how to add new HPE, Supermicro, or Quiver nodes to an existing cluster."
permalink: /administrator-guide/node-addition-replacement/adding-nodes-existing-cluster.html
sidebar: administrator_guide_sidebar
keywords: node_add, node-add, cluster_expansion, expand
---

After you connect and power on your new nodes, Qumulo Core discovers any unconfigured nodes automatically and prompts you to add nodes in the Web UI.

If Qumulo Core doesn't discover any unconfigured nodes, it displays the message **No unconfigured nodes found**. If you expect to see nodes, {{site.contactQumuloCare}}.

{{site.data.alerts.note}}
<ul>
  <li>Qumulo Core requires a short time to update the total available storage.</li>
  <li>Existing nodes retain their numbering.</li>
</ul>
{{site.data.alerts.end}}


## Prerequisites
* **Sufficient Static IP Addresses:** The number of static IP addresses must be equal to or greater than the number of nodes in your cluster. For more information, see [IP Failover with Qumulo Core](https://care.qumulo.com/hc/en-us/articles/115007075107) on Qumulo Care.

* **Same Qumulo Core Version on All Nodes:** For information about upgrading Qumulo Core, see [Performing a Clean Installation of Qumulo Core](https://care.qumulo.com/hc/en-us/articles/360011477954) and [Performing Qumulo Core Upgrades by Using the Web UI](https://care.qumulo.com/hc/en-us/articles/115007247168) on Qumulo Care.


## Step 1: Resolve Drive Compatibility Issues
{% include important.html content="If the version of Qumulo Core on your existing nodes predates the Qumulo-certified drives that you received with your new nodes, you can't install a lower version of Qumulo Core on your new node and Qumulo Core displays the message **Installation failed**. Use the cluster logs to identify any incompatible drives." %}

To receive support for new, Qumulo-certified drives, do one of the following:

* Upgrade your existing cluster to the latest version of Qumulo Core and then install the same version of Qumulo Core on your new node. For more information, see [Performing Qumulo Core Upgrades by Using the Web UI](https://care.qumulo.com/hc/en-us/articles/115007247168) on Qumulo Care.
  
* Update the Supported Drive List on your new node. For more information, {{site.contactQumuloCare}}.


## Step 2: Add Your New Nodes to an Existing Qumulo Cluster
1.  Log in to the Web UI.

1.  Click **Cluster &gt; Add Nodes**.

1.  On the **Add Nodes** page, select unconfigured nodes to add to your cluster.

1.  Click **Add Selected Nodes to Cluster**.
   
1.  In the **Add &lt;N&gt; nodes to cluster &lt;name&gt;?** dialog box, click **Yes**.

    If you add one or more node model types, a message reminds you about Qumulo Core adding a new model type to your cluster.

Qumulo Core configures your new nodes and adds them to your cluster.

On the **Cluster** page, the Web UI shows the banner **Successfully added &lt;N&gt; nodes to the cluster** and the total available storage.
