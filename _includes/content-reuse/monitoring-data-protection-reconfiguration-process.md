## Monitoring the Data Protection Reconfiguration Process
To view the progress of the three stages of the data protection reconfiguration process, log in to the Qumulo Core Web UI and click **Cluster**.

1. Qumulo Core begins to move data to new nodes in the cluster and the Qumulo Core Web UI displays the message **Rebalancing for data protection reconfiguration**.
   
1. Qumulo Core reencodes all data on your cluster and the Qumulo Core Web UI displays the message **Reconfiguring data protection**.

   {% include note.html content="In certain scenarios, this stage might appear to pause while the system performs preparatory work on the cluster." %}

   When this stage is complete, your data is protected according to the cluster's new configuration and the system begins to use the new drive and node fault tolerance levels.

1. Qumulo Core adds new capacity to your cluster and the Qumulo Core Web UI displays the message **Rebalancing**.

   If you initiated the reconfiguration process as part of a node replacement step, the system migrates data from the existing nodes in the cluster.

### Cluster Availability During the Reconfiguration Process
Your cluster remains available throughout the data protection reconfiguration process.

* You can upgrade Qumulo Core.

* Your cluster maintains the ability to recover from node and drive failure automatically.

  During the reconfiguration process, drive and node fault tolerance levels remain at the minimums that the existing and new configurations specify. For example, if your existing cluster has 2-node and 2-drive fault tolerance, and you initiate reconfiguration where the new configuration has 1-node and 3-drive fault tolerance, your cluster has 1-node and 2-drive fault tolerance during the reconfiguration process.

{{site.data.alerts.note}}
<ul>
  <li>To avoid impact to front-end workloads, Qumulo Core slows down the reconfiguration process automatically.</li>
  <li>When Qumulo Core finds missing nodes or drives, it pauses the reconfiguration process. When you replace or bring the nodes or drives online, the reconfiguration process continues.</li>
  <li>It isn't possible to add or replace nodes during the reconfiguration process.</li>
</ul>
{{site.data.alerts.end}}
