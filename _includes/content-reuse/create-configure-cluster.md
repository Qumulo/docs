1. Review the **End User Agreement**, click **I agree to the End User Agreement**, and then click **Submit**.

1. Name your cluster.

1. On the **1. Set up cluster** page, select the nodes to add to your cluster.

   As you select nodes, the installer updates the total capacity of your cluster at the bottom of the page.

   {% include note.html content="If any nodes are missing, confirm that they are powered on and connected to the same network." %}

1. Confirm that the individual nodes have the expected capacity.

1. On the **2. Confirm cluster protection level** page, Qumulo Core selects the recommended 2, 3, or 4-drive protection level based on your cluster size and node type.

1. If the **Customize Protection Level** option appears, you can increase your system resilience by selecting 3- or 4-drive protection.

   {{site.data.alerts.important}}
   <ul>
     <li>For information about how changing the drive protection level works in different versions of Qumulo Core, see <a href="/administrator-guide/protecting-data/adding-nodes-with-data-protection-changes.html">Adding Nodes to a Qumulo Cluster with Data Protection Configuration Changes</a>.</li>
     <li>Using 3- or 4-drive protection reduces the total capacity of your cluster.</li>
   </ul>
   {{site.data.alerts.end}}

1. Enter a password for the administrative account and click **Create Cluster**.

1. To access the Qumulo Core Web UI, connect to any node by entering its IP address into a browser. For more information, see [Qumulo Core Web UI Browser Compatibility](https://care.qumulo.com/hc/en-us/articles/115013902267) on Qumulo Care.

For more information about configuring your cluster configuration and getting started with Qumulo Core, see [Qumulo Installation FAQ](https://care.qumulo.com/hc/en-us/articles/115008010087) on Qumulo Care.
