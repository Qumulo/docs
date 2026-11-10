1. Review the End User Agreement, click **I agree to the End User Agreement**, and then click **Submit**.

1. In the **1. Set up cluster** section, take the following steps:

   1. Enter a **Cluster name**.

   1. Select the nodes to add to your cluster.

      The total cluster capacity appears at the bottom of the page.

   1. To reorder a node, drag its table row.

      {{site.data.alerts.important}}
      <ul>
        <li>It isn't possible to reorder nodes after creating a cluster.</li>
        <li>We recommend ordering nodes to match their physical arrangement in the server rack. This helps map nodes that appear in the <strong>Node Name</strong> column to rack positions.</li>
        <li>
          To identify a node, take one of the following actions:
          <ul>
            <li>Power on nodes one at a time and watch the nodes that populate the table.</li>
            <li>Compare nodes' MAC addresses to the MAC addresses listed in the table.</li>
          </ul>
        </li>
        <li>If any nodes are missing from the table, check these nodes' networking configuration.</li>
      </ul>
      {{site.data.alerts.end}}

1. In the **2. Confirm cluster protection level** section, confirm your _cluster protection level_ (the number of drive failures Qumulo Core protects the cluster against).

   If the **Customize Protection Level** option appears (depending on your cluster size and node types), you can select two-drive or three-drive protection.

   {{site.data.alerts.important}}
   Choose the cluster protection level carefully:
   <ul>
     <li>After you create the cluster, you can change it only by using Adaptive Data Protection when you <a href="https://docs.qumulo.com/administrator-guide/node-addition-replacement/adding-nodes-adaptive-data-protection.html">add or replace nodes</a>. The data protection reconfiguration process can take days or weeks.</li>
     <li>Choosing to protect more drives decreases cluster capacity.</li>
     <li>To set a node fault tolerance level higher than the default, create your cluster by using the {% include qq.html command="cluster_create" %} command with the <code>--max-node-failures</code> flag.</li>
   </ul>
   {{site.data.alerts.end}}

1. In the **3. Create a password for your admin account** section, enter a password and then click **Create Cluster**.

When the cluster creation process is complete, you can access the Qumulo Core Web UI by entering the IP address of any node in the cluster into a browser.
