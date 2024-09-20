The replication process creates a consistent point-in-time copy of data in a directory on a source cluster when Qumulo Core transfers the data to a directory on a target cluster. Because two clusters are required for the replication process, there are specific requirements for version of Qumulo Core that the two clusters must run.

## Replication for Qumulo Core 6.0.0.x (and Higher)
For Qumulo Core 6.0.0.x (and higher), clusters that run different versions can replicate _with all quarterly and non-quarterly versions, up to eight quarters in the future._

The following example shows a replication compatibility matrix for quarterly and non-quarterly version of Qumulo Core.

<table style="border:0;">
<thead>
  <tr>
    <th style="text-align:center;width:12.85%;background:transparent;border-left:0;"></th>
    <th style="text-align:center;width:12.85%;">6.0.0.x (q)</th>
    <th style="text-align:center;width:12.85%;">6.0.1</th>
    <th style="text-align:center;width:12.85%;">6.1.0 (q)</th>
    <th style="text-align:center;width:5%;">&hellip;</th>
    <th style="text-align:center;width:12.85%;">8.0.0 (q)</th>
    <th style="text-align:center;width:12.85%;">8.0.1</th>
    <th style="text-align:center;width:5%;">&hellip;</th>
    <th style="text-align:center;width:12.85%;">10.0.0 (q)</th>
    <th style="text-align:center;width:12.85%;">10.0.1</th>
  </tr>
</thead>
<tbody>
  <tr>
    <th style="text-align:center;">6.0.0.x (q)</th>
    <td style="text-align:center;"><span class="emoji">✅</span></td>
    <td style="text-align:center;"><span class="emoji">✅</span></td>
    <td style="text-align:center;"><span class="emoji">✅</span></td>
    <td style="text-align:center;background-color:#777777;"></td>
    <td style="text-align:center;"><span class="emoji">✅</span></td>
    <td style="text-align:center;"></td>
    <td style="text-align:center;background-color:#777777;"></td>
    <td style="text-align:center;"></td>
    <td style="text-align:center;"></td>
  </tr>
  <tr>
    <th style="text-align:center;">6.0.1</th>
    <td style="text-align:center;"><span class="emoji">✅</span></td>
    <td style="text-align:center;"><span class="emoji">✅</span></td>
    <td style="text-align:center;"><span class="emoji">✅</span></td>
    <td style="text-align:center;background-color:#777777;"></td>
    <td style="text-align:center;"><span class="emoji">✅</span></td>
    <td style="text-align:center;"></td>
    <td style="text-align:center;background-color:#777777;"></td>
    <td style="text-align:center;"></td>
    <td style="text-align:center;"></td>
  </tr>
  <tr>
    <th style="text-align:center;">6.1.0 (q)</th>
    <td style="text-align:center;"><span class="emoji">✅</span></td>
    <td style="text-align:center;"><span class="emoji">✅</span></td>
    <td style="text-align:center;"><span class="emoji">✅</span></td>
    <td style="text-align:center;background-color:#777777;"></td>
    <td style="text-align:center;"><span class="emoji">✅</span></td>
    <td style="text-align:center;"><span class="emoji">✅</span></td>
    <td style="text-align:center;background-color:#777777;"></td>
    <td style="text-align:center;"></td>
    <td style="text-align:center;"></td>
  </tr>
  <tr style="background-color:#777777">
    <th style="text-align:center;">&hellip;</th>
    <td style="text-align:center;"></td>
    <td style="text-align:center;"></td>
    <td style="text-align:center;"></td>
    <td style="text-align:center;"></td>
    <td style="text-align:center;"></td>
    <td style="text-align:center;"></td>
    <td style="text-align:center;background-color:#777777;"></td>
    <td style="text-align:center;"></td>
    <td style="text-align:center;"></td>
  </tr>
  <tr>
    <th style="text-align:center;">8.0.0 (q)</th>
    <td style="text-align:center;"><span class="emoji">✅</span></td>
    <td style="text-align:center;"><span class="emoji">✅</span></td>
    <td style="text-align:center;"><span class="emoji">✅</span></td>
    <td style="text-align:center;background-color:#777777;"></td>
    <td style="text-align:center;"><span class="emoji">✅</span></td>
    <td style="text-align:center;"><span class="emoji">✅</span></td>
    <td style="text-align:center;background-color:#777777;"></td>
    <td style="text-align:center;"><span class="emoji">✅</span></td>
    <td style="text-align:center;"></td>
  </tr>
  <tr>
    <th style="text-align:center;">8.0.1</th>
    <td style="text-align:center;"></td>
    <td style="text-align:center;"></td>
    <td style="text-align:center;"><span class="emoji">✅</span></td>
    <td style="text-align:center;background-color:#777777;"></td>
    <td style="text-align:center;"><span class="emoji">✅</span></td>
    <td style="text-align:center;"><span class="emoji">✅</span></td>
    <td style="text-align:center;background-color:#777777;"></td>
    <td style="text-align:center;"><span class="emoji">✅</span></td>
    <td style="text-align:center;"></td>
  </tr>
  <tr style="background-color:#777777">
    <th style="text-align:center;">&hellip;</th>
    <td style="text-align:center;"></td>
    <td style="text-align:center;"></td>
    <td style="text-align:center;"></td>
    <td style="text-align:center;"></td>
    <td style="text-align:center;"></td>
    <td style="text-align:center;"></td>
    <td style="text-align:center;background-color:#777777;"></td>
    <td style="text-align:center;"></td>
    <td style="text-align:center;"></td>
  </tr>
  <tr>
    <th style="text-align:center;">10.0.0 (q)</th>
    <td style="text-align:center;"></td>
    <td style="text-align:center;"></td>
    <td style="text-align:center;"></td>
    <td style="text-align:center;background-color:#777777;"></td>
    <td style="text-align:center;"><span class="emoji">✅</span></td>
    <td style="text-align:center;"><span class="emoji">✅</span></td>
    <td style="text-align:center;background-color:#777777;"></td>
    <td style="text-align:center;"><span class="emoji">✅</span></td>
    <td style="text-align:center;"><span class="emoji">✅</span></td>
  </tr>
  <tr>
    <th style="text-align:center;">10.0.1</th>
    <td style="text-align:center;"></td>
    <td style="text-align:center;"></td>
    <td style="text-align:center;"></td>
    <td style="text-align:center;background-color:#777777;"></td>
    <td style="text-align:center;"></td>
    <td style="text-align:center;"></td>
    <td style="text-align:center;background-color:#777777;"></td>
    <td style="text-align:center;"><span class="emoji">✅</span></td>
    <td style="text-align:center;"><span class="emoji">✅</span></td>
  </tr>
</tbody>
</table>

{{page.varExample}} quarterly (future) 8.0.0 version.

<blockquote> 6.0.0.x (q) <span class="thick-arrow-left">&#10148;</span> 6.1.0 (q) <span class="thick-arrow-left">&#10148;</span> &hellip; <span class="thick-arrow-left">&#10148;</span> 7.2.0.2 (q) <span class="thick-arrow-left">&#10148;</span> 7.3.0 (q) <span class="thick-arrow-left">&#10148;</span><span class="highlight-version"> 8.0.0 (q) </span><span class="thick-arrow-right">&#10148;</span>  8.1.0 (q) <span class="thick-arrow-right">&#10148;</span> 8.2.0 (q) <span class="thick-arrow-right">&#10148;</span> &hellip; <span class="thick-arrow-right">&#10148;</span> 9.3.0 (q) <span class="thick-arrow-right">&#10148;</span> 10.0.0 (q) </blockquote>

{{page.varExample}} non-quarterly (future) 8.0.1 version.

<blockquote> 6.1.0 (q) <span class="thick-arrow-left">&#10148;</span> 6.1.0 (q) <span class="thick-arrow-left">&#10148;</span> &hellip; <span class="thick-arrow-left">&#10148;</span> 7.2.0.2 (q) <span class="thick-arrow-left">&#10148;</span> 7.3.0 (q) <span class="thick-arrow-left">&#10148;</span><span class="highlight-version"> 8.0.1 </span><span class="thick-arrow-right">&#10148;</span>  8.1.0 (q) <span class="thick-arrow-right">&#10148;</span>  8.2.0 (q) <span class="thick-arrow-right">&#10148;</span> &hellip; <span class="thick-arrow-right">&#10148;</span> 9.3.0 (q) <span class="thick-arrow-right">&#10148;</span> 10.0.0 (q) </blockquote>

{% include note.html content="This schema doesn't impact replication compatibility for versions lower than 6.0.0 that are still only compatible with a maximum of two quarterly versions." %}

## Replication for Qumulo Core 5.0.1 to 6.0.0
From Qumulo Core 5.0.1 to 5.3.4, clusters that run different versions can replicate _between the current version and up to two previous or future quarterly versions._

{{page.varExample}} quarterly 5.1.0 version.

<blockquote>4.3.0 (q) <span class="thick-arrow-left">&#10148;</span> 5.0.0 (q) <span class="thick-arrow-left">&#10148;</span><span class="highlight-version"> 5.1.0 (q) </span><span class="thick-arrow-right">&#10148;</span> 5.2.0 (q) <span class="thick-arrow-right">&#10148;</span> 5.3.0 (q)</blockquote>

{{page.varExample}} non-quarterly 5.1.1 version

<blockquote>5.0.0 (q) <span class="thick-arrow-left">&#10148;</span> 5.1.0 (q) <span class="thick-arrow-left">&#10148;</span><span class="highlight-version"> 5.1.1 </span><span class="thick-arrow-right">&#10148;</span> 5.2.0 (q) <span class="thick-arrow-right">&#10148;</span> 5.3.0 (q)</blockquote>

{{site.data.alerts.note}}
<ul>
  <li>From version 5.0.1, Qumulo Core blocks replication between unsupported versions. For example, version 5.0.1 can't replicate with versions before 4.3.0 or after 5.2.0.</li>
  <li>In this scenario, version 5.2.0 is a hard limit. Versions 5.2.1 (and higher) can't replicate with versions 5.0.1 (or lower).</li>
</ul>
{{site.data.alerts.end}}

## Replication for Qumulo Core 2.11.0 to 5.0.0
From Qumulo Core 2.11.0 to 5.0.0, clusters that run different versions can replicate _between at least two consecutive quarterly versions_. For example:

<table style="border:0;">
<thead>
  <tr>
    <th style="background:transparent;width:25%;border-left:0;"></th>
    <th style="text-align:center;width:25%;">4.1.5</th>
    <th style="text-align:center;width:25%;">4.2.0 (q)</th>
    <th style="text-align:center;width:25%;">4.2.1</th>
  </tr>
</thead>
<tbody>
  <tr>
    <th>4.1.5</th>
    <td style="text-align:center;"><span class="emoji"><span class="emoji">✅</span></span></td>
    <td style="text-align:center;"><span class="emoji"><span class="emoji">✅</span></span></td>
    <td></td>
  </tr>
  <tr>
    <th>4.2.0 (q)</th>
    <td style="text-align:center;"><span class="emoji"><span class="emoji">✅</span></span></td>
    <td style="text-align:center;"><span class="emoji"><span class="emoji">✅</span></span></td>
    <td style="text-align:center;"><span class="emoji"><span class="emoji">✅</span></span></td>
  </tr>
  <tr>
    <th>4.2.1</th>
    <td></td>
    <td style="text-align:center;"><span class="emoji"><span class="emoji">✅</span></span></td>
    <td style="text-align:center;"><span class="emoji"><span class="emoji">✅</span></span></td>
  </tr>
</tbody>
</table>

{% if page.platform == 'on-prem' or page.platform == 'aws' %}
## Upgrade Recommendations
Because the target directory of an existing replication relationship is read-only to all client access, use the following recommendations to upgrade a cluster whose file system root directory is the target of a replication relationship.

{% include note.html content="Regardless of version, upgrading Qumulo Core while a replication job is running interrupts the job in progress. When both clusters return to states in which replication is possible, the replication job resumes." %}

### If the Source Cluster is Available
To avoid having to resynchronize your clusters after you reconnect the replication relationship, we recommend the following steps.

1. Copy the upgrade image to a directory on the source cluster. (It isn't possible to copy it to the read-only target cluster).

1. Wait for the upgrade image to replicate to the target cluster.

1. Continue with the normal upgrade process.

### If the Source Cluster is Unavailable or Another Issue Exists
{% include important.html content="The following steps interrupt the replication process." %}

On clusters that run Qumulo Core 2.12.5 (and lower), this process requires additional time to resynchronize the clusters by running a full-tree scan after you reconnect the replication relationship.

1. To temporarily make the target relationship writable for the duration of the upgrade, use the **Make Target Writable** action in the Qumulo Core Web UI.
   
1. Wait for the upgrade to complete.
   
1. Use the **Reconnect Relationship** action in the Qumulo Core Web UI.
{% endif %}
