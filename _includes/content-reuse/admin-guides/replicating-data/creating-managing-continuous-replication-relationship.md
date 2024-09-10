## How Continuous Replication Works

{% if page.platform == 'on-prem' or page.platform == 'aws' %}
{% include important.html content="Qumulo Core supports replication between different versions only if either the source or target cluster is running Qumulo Core 2.12.0 (or higher). For more information, see [Replication Version Requirements and Upgrade Recommendations](../upgrading-qumulo-core/replication-version-requirements-upgrade-recommendations.html)." %}
{% else %}
{% include important.html content="Qumulo Core supports replication between different versions only if either the source or target cluster is running Qumulo Core 2.12.0 (or higher). For more information, see [Replication Version Requirements](../getting-started/replication-version-requirements.html)" %}
{% endif %}

Continuous replication takes a snapshot of the data in a directory on the _source cluster_ and transfers it to a directory on the _target cluster_. While continuous replication runs, Qumulo Core scans modified files for any changed regions and transfer only these changes to the target cluster. 

Continuous replication uses snapshots to generate a consistent point-in-time copy of the source directory on the target cluster. To ensure that a directory contains only the most recent snapshot, Qumulo Core deletes previous snapshots automatically. Administrators can view the snapshots used for replication and any other policy-based snapshots.


## Prerequisites
The following privileges are required for continuous replication.

{{site.data.alerts.note}}
<ul>
  <li>We don't recommend granting the following privileges to specific users because they grant administrative access to your cluster.</li>
  <li>
    <p>The following privileges grant user access to Qumulo Core functionality beyond replication relationship management:</p>
    <ul>
      <li><code>PRIVILEGE_REPLICATION_SOURCE_WRITE</code>: Grants the permission to access any data on a cluster, regardless of file or directory permissions</li>
      <li><code>PRIVILEGE_REPLICATION_TARGET_WRITE</code>: Grants the permission to authorize replication relationships to any target directory on a cluster</li>
    </ul>
  </li>
</ul>
{{site.data.alerts.end}}

* Creating a replication relationship
  * `SOURCE_WRITE`: For the user on the source cluster to initiate the creation of the relationship
  * `TARGET_WRITE`: For the user on the target cluster to authorize the relationship
* Viewing the replication relationship status
  * `PRIVILEGE_REPLICATION_SOURCE_READ`
  * `PRIVILEGE_REPLICATION_TARGET_READ`


<a id="create-replication-relationship"></a>
## To Create a Replication Relationship
{% include important.html content="A replication job doesn't begin until you authorize the relationship on the target cluster." %}

1. Log in to the Qumulo Core Web UI on the source cluster.

1. Click **Cluster > Replication**.

1. On the right side of the **Replication Relationships** page, click **Create Relationship**.

1. On the **Create Replication Relationship** page:

   1. For **Source Directory Path**, enter the existing directory from which to replicate data.

   1. For **Target Directory Path**, enter the existing directory to which to replicate data.

   1. For **Target Address**, enter one of the IP addresses from a node on the target cluster.

      {% include tip.html content="We recommend using a floating IP address." %}

   1. For **Port Number**, click **Default (3712)** or enter a custom port.

      {% include note.html content="Your organization's firewall might require a custom port." %}
      
1. Click **Add Blackout Window** and then select the days of the week and time when replication suspends.

1. (Optional) To add another blackout window, click **Add Blackout Window**.

   {% include note.html content="You can add up to ten blackout windows. For more information, see [Replication: Blackout Windows](https://care.qumulo.com/hc/en-us/articles/360019101513) on Qumulo Care." %}
   
1. To replicate files by using locally-owned NFS IDs, under **Map Local User/Group IDs to Associated NFS IDs**, click Enabled.

   For more information, see [Replication: NFS ID Mapping](https://care.qumulo.com/hc/en-us/articles/360026146494) on Qumulo Care.

1. Under **Enable Replication**, click **Enabled**.

1. Click **Save Relationship**.


## To Authorize a Replication Relationship
{% include note.html content="If your cluster is currently in a blackout window or if continuous replication for the replication relationship is disabled, replication doesn't begin. For more information, see [Replication: Blackout Windows](https://care.qumulo.com/hc/en-us/articles/360019101513) on Qumulo Care." %}

1. Log in to the Qumulo Core Web UI on the target cluster.

   A notification banner informing you of a new relationship authorization request appears.

1. On the banner, click **See details**.

1. On the **Replication Relationships** page, click **Accept**.


## To View the Status of a Replication Relationship

1. Log in to the Qumulo Core Web UI on the source cluster.

1. Click **Cluster > Replication**.

   The **Replication Relationships** page shows a list of source and target clusters. The following table explains the icons that appear between the **Source** and **Target** columns.

   <table>
     <tr>
       <th>Icon</th>
       <th>Description</th>
     </tr>
     <tr>
       <td class="replication-icon"><figure><img class="docimage" src="{% if site.baseurl != "/" %}{{ site.baseurl }}{% endif %}/images/shared-images/admin-guides/replication-running.png" alt="Replication is Running"></figure></td>
       <td>The replication is running or is ready to run.</td>
     </tr>
     <tr>
       <td class="replication-icon"><figure><img class="docimage" src="{% if site.baseurl != "/" %}{{ site.baseurl }}{% endif %}/images/shared-images/admin-guides/replication-awaiting-authorization.png" alt="Replication is Awaiting Authorization"></figure></td>
       <td>The replication is awaiting authorization from the target cluster's administrator.</td>
     </tr>
     <tr>
       <td class="replication-icon"><figure><img class="docimage" src="{% if site.baseurl != "/" %}{{ site.baseurl }}{% endif %}/images/shared-images/admin-guides/replication-relationship-disconnected.png" alt="Replication Relationship is Disconnected"></figure></td>
       <td>The replication relationship is disconnected and the target directory is writable.</td>
     </tr>
     <tr>
       <td class="replication-icon"><figure><img class="docimage" src="{% if site.baseurl != "/" %}{{ site.baseurl }}{% endif %}/images/shared-images/admin-guides/replication-relationship-in-blackout-window.png" alt="Replication Relationship is in a Blackout Window"></figure></td>
       <td>The replication relationship is in a blackout window.</td>
     </tr>
     <tr>
       <td class="replication-icon"><figure><img class="docimage" src="{% if site.baseurl != "/" %}{{ site.baseurl }}{% endif %}/images/shared-images/admin-guides/continuous-replication-disabled.png" alt="Continuous Replication Disabled"></figure></td>       
       <td>Continuous replication is disabled.</td>
     </tr>
     <tr>
       <td class="replication-icon"><figure><img class="docimage" src="{% if site.baseurl != "/" %}{{ site.baseurl }}{% endif %}/images/shared-images/admin-guides/target-directory-reverting-to-last-recovery-point.png" alt="Target Directory is Reverting to the Last Recovery Point"></figure></td>
       <td>The target directory is reverting to the last recovery point before becoming writable.</td>
     </tr>
     <tr>
       <td class="replication-icon"><figure><img class="docimage" src="{% if site.baseurl != "/" %}{{ site.baseurl }}{% endif %}/images/shared-images/admin-guides/replication-job-incomplete.png" alt="Replication Job is Incomplete"></figure></td>          
       <td>The replication job is incomplete and will retry soon.</td>
     </tr>
   </table>

   A progress bar in the **Status** column indicates the replication process.

   {% include note.html content="The replication process percentage considers the number of files to be replicated _and_ the amount of data to be transferred." %}

1. To review the throughput, run time, and data statistics for the replication job in progress, click **Details**.


## To Modify a Replication Relationship
{% include note.html content="It isn't possible to edit the source and target directory paths. To make these changes, you must create a new replication relationship." %}

1. {{site.logIntoWebUI}}

1. Click **Cluster > Replication**.

1. On the **Replication Relationships** page, next to the relationship to modify, click {% include shared_inline_image.html alt="Vertical Ellipsis" file="shared-images/admin-guides/vertical-ellipsis.png" %} **> Edit Relationship...**

1. Make changes to your replication relationship (for more information, see [To Create a Replication Relationship](#create-replication-relationship)) and then click **Save Relationship**.


## To Delete a Replication Relationship

1. {{site.logIntoWebUI}}

1. Click **Cluster > Replication**.

1. On the **Replication Relationships** page, next to the relationship to delete, click {% include shared_inline_image.html alt="Vertical Ellipsis" file="shared-images/admin-guides/vertical-ellipsis.png" %} **> Delete Relationship...**

1. In the **Delete relationship** dialog box, review the source and target clusters and then click **Yes, Delete**.


## Known Continuous Replication Limitations in Qumulo Core
<ul>
  <li><strong>Continuous Replication:</strong> Depending on applications in use while a replication job runs, continuous replication increases the load on the cluster and can cause latency delays.</li>
  <li><strong>Local Users and Groups:</strong> Continuous replication doesn't support replicating local user or group information and fails when it encounters a file associated with local users or groups.</li>
  <li><strong>Target Directory Permissions</strong> When you create a replication relationship, Qumulo Core updates these permissions from read-write to read-only. When you delete the relationship, the permissions revert to read-write automatically.</li>
{% if page.platform == 'on-prem' or page.platform == 'aws' %}
  <li><strong>Root Directory:</strong> Including this directory makes the entire target cluster read-only and might prohibit administrative functions such as upgrades. For more information, see <a href="../upgrading-qumulo-core/replication-version-requirements-upgrade-recommendations.html">Replication Version Requirements and Upgrade Recommendations</a></li>
  <li><strong>Upgrades During Replication:</strong> Before you perform any Qumulo Core upgrades, you must wait until the replication job is complete. Upgrading Qumulo Core while a replication job is in progress causes the job to fail. When both clusters return to a state where replication is possible (the versions are the same), continuous replication can continue.</li>
{% endif %}
</ul>
