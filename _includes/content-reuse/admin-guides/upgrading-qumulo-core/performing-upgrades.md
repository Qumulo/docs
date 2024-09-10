{{site.data.alerts.important}}
<ul>
  <li>{{page.varContactQumuloCare}}</li>
  <li>{{page.varRollingRebootRefresh}}</li>
{% if page.platform == 'aws' %}<li>{{site.cnqLong}} doesn't differentiate between upgrade modes and all upgrades are <em>instant software upgrades</em> that have a downtime of less than 30 seconds and don't disrupt the operation of the cluster.</li>{% endif %}
</ul>
{{site.data.alerts.end}}

{{site.nexusDownloads}} {{site.loginRequired}}.

{% if page.platform != 'aws' %}
## Understanding the Differences Between Upgrade Modes
For information about which upgrade modes different Qumulo Core releases use, see [Qumulo Core Upgrade Mode Reference](mode-reference.html).

### Instant Software Upgrade
The more common, faster instant software upgrade requires restarting only the container on your nodes and has a downtime of less than 30 seconds without disruption to the operation of the cluster.

Because in Qumulo Core 3.3.2 (and higher), the Qumulo file and data protection systems are separate from the host in charge of running the operating system and the services specific to each hardware or cloud platform, and because these services run in a lightweight container (by using Ubuntu-native [systemd-nspawn](https://www.freedesktop.org/software/systemd/man/systemd-nspawn.html) containerization) in the user space, it is possible to move quickly from one version of Qumulo Core to another by loading a new container and pointing the runtime environment at updated software.
  
{{site.data.alerts.note}}
<ul>
  <li>Under certain conditions, an end-to-end instant software upgrade might take a little longer while Qumulo Core performs background tasks. This doesn't impact user experience.</li>
  <li>Instant software upgrades don't impact existing support for the <code>qq</code> CLI or REST API commands.</li>
  <li>A direct upgrade to Qumulo Core 3.3.3 <em>isn't</em> an instant software upgrade (it only establishes the framework for this functionality). Upgrading from Qumulo Core 3.3.2 to 3.3.3 is the first official, minimally disruptive instant software upgrade. Any subsequent upgrade, regardless of release, is an instant software upgrade unless we specify otherwise.</li>
</ul>
{{site.data.alerts.end}}

### Platform Upgrade
The infrequent, somewhat slower platform upgrade requires either a _complete reboot_ (rebooting all nodes in your cluster at the same time with SMB and NFS client interruption) or&mdash;in Qumulo Core 5.0.3 (and higher)&mdash;a _rolling reboot_ (rebooting the nodes in your cluster one at a time with impact only to SMB clients).

The reboot process differentiates platform upgrades from instant software upgrades, where your nodes maintain the Linux operating system (and certain services that Qumulo Core relies on) during the upgrade process and where the underlying host changes less frequently than the container and the file and data protection systems.

{{site.data.alerts.important}}
<ul>
  <li>{{page.varContactQumuloCare}}</li>
  <li>{{page.varRollingRebootRefresh}}</li>
  <li>Upgrading past a platform upgrade still requires a node reboot, even if you don't install the exact build. For example, if your cloud cluster runs Qumulo Core 4.0.0, installing Qumulo Core 4.1.0 triggers a platform upgrade, because the installation includes all changes contained in Qumulo Core 4.0.6 that is a platform upgrade.</li>
</ul>
{{site.data.alerts.end}}
{% endif %}

## Understanding the Upgrade Phases
Every Qumulo Core upgrade has two phases, _preparation_ and _commit_.

1. **Preparation:** Qumulo Core stages a new image in an alternate boot drive partition while the current image continues to run. This phase is responsible only for the background work (unpacking and writing the platform image and upgrade firmware, and so on). When the preparation phase is complete, we continue to the commit phase.

1. **Commit:** Qumulo Core does one of the following:

   * **Instant Software Upgrade:** Stops the existing container and starts a new one.
   * **Platform Upgrade:** Initiates a reboot and selectively upgrades the operating system image.

{{page.varViewUpgradeStatus}}

{{site.exampleOutput}}

```json
{
  "install_path": "/upgrade/qinstall.qimg",
  "state": "UPGRADE_PREPARING",
  "details": "",
  "error_message": "",
  "error_state": "UPGRADE_ERROR_NO_ERROR",
  "is_blocked": false,
  "blocked_reason": ""
}
```

## Upgrading Your Qumulo Cluster
{{site.data.alerts.important}}
<ul>
  <li>Before beginning the upgrade process, make sure that you have the {% if page.platform != 'aws' %}correct <a href="https://nexus.qumulo.com/downloads?platform=cloud">cloud upgrade image</a>{{site.loginRequired}} or{% endif %} <a href="https://nexus.qumulo.com/downloads?platform=onprem">on-premises upgrade image</a>{{site.loginRequired}}. {% if page.platform == 'aws' %}{{site.cnqShort}} uses the <a href="https://docs.qumulo.com/administrator-guide/getting-started/installing-product-package.html">Qumulo Core Product Package</a> (which doesn't have separate versions for on-premises and cloud platforms) as a deployment artifact. For this reason, you must use the on-premises upgrade image to upgrade a {{site.cnqShort}} cluster.{% endif %}</li>
  <li>To allow certain background processes to run, multiple sequential Qumulo Core upgrades might require a waiting period between specific releases. Before installing multiple Qumulo Core releases within an extended maintenance window, {{site.contactQumuloCare}}.</li>
  <li>When the node to which you are connected reboots, the Qumulo Core Web UI might redirect you to the <strong>Cluster is booting...</strong> page. To view the reboot status, you can connect to a different node or wait until the current node goes online and then click <strong>Support > Software Upgrade</strong>.</li>
  <li>During rolling reboots, the system reboots one or more nodes (depending on the configured protection level) in the cluster in succession. If your cluster is under heavy load due to write or delete operations, this process can take a long time.</li>
</ul>
{{site.data.alerts.end}}

### To Upgrade Your Qumulo Cluster by Using the Qumulo Core Web UI

{{page.varUploadUpgradeFile}}

1. {{site.logIntoWebUI}}

1. **Click Support > Software Upgrade**.

1. On the **Software Upgrade** page, enter the file system path for the upgrade file without the leading slash, for example: `upgrade/qumulo_core_7.1.0.1.qimg`.

1. Click **Upgrade...**

{% if page.platform != 'aws' %}
1. Depending on the [upgrade mode for your release](mode-reference.html), do one of the following:

   * **Instant Software Upgrade:** In the **Ready to upgrade?** dialog box, confirm the current and new versions of Qumulo Core and then click **Start Upgrade**.

     On the **Software Upgrade** page, the upgrade progress is displayed.

   * **Platform Upgrade:** In the **Ready to upgrade?** dialog box, choose one of the following modes and then click **Start Upgrade**.

       * **Complete reboot (with SMB and NFS client interruption):** You can't access your cluster during the reboot process.

       * **Rolling reboot (with SMB client impact):** You can access your cluster during reboot, but SMB connectivity to specific nodes is impacted.
{% else %}
1. Confirm the current and new versions of Qumulo Core and then click **Start Upgrade**.
{% endif %}

   Qumulo Core prepares the upgrade then installs Qumulo software on your cluster.

   When the upgrade is complete, the message **You have successfully upgraded from Qumulo Core x.x.x to y.y.y** is displayed.

### To Upgrade Your Qumulo Cluster by Using the qq CLI

{{site.data.alerts.important}}
<ul>
  <li>For two-phase upgrades, there is no client downtime during the <em>prepare</em> phase, only during the commit phase.</li>
  <li>{{page.varDisableProgressBar}}</li>
  <li>Qumulo Core reboots a number of nodes (depending on the protection level configured on your cluster) in succession. This requires the restriper job to finish before Qumulo Core can continue to the next node in the cluster. If your cluster is under heavy load from write or delete operations, this process can take a long time.</li>
</ul>
{{site.data.alerts.end}}

{{page.varUploadUpgradeFile}}

1. Use SSH to connect to an IP address of a node in your cluster.

1. To become the root user, run the `sudo -s` command.

1. Depending on the current Qumulo Core version on your cluster, do one of the following:

   * **Qumulo Core 5.1.0.1 (and Higher):**

     * **Immediate Upgrade with Rolling Reboot:** Run the [`qq upgrade_cluster`](https://docs.qumulo.com/qq-cli-command-guide/upgrade/upgrade_cluster.html) command. {{page.varUpgrade5101Flags}} For example:

       ```bash
       qq upgrade_cluster \
         --rolling \
         --path /qumulo_upgrade_x.x.x.qimg
       ```

     * **Two-Phase Upgrade with Rolling Reboot:** {{page.varUpgradeTwoPhase}} {{page.varUpgrade5101Flags}} For example:
 
       ```bash
       qq upgrade_cluster prepare \
         --rolling \
         --path /qumulo_upgrade_x.x.x.qimg
       ```

       ```bash
       qq upgrade_cluster commit
       ```

    * **Qumulo Core 5.0.6 (and Lower):**

      * **Immediate Upgrade:** {{page.varUpgrade506}} For example:

        ```bash
        qq upgrade_cluster \
          --path /qumulo_core_x.x.x.qimg
        ```

      * **Two-Phase Upgrade:** {{page.varUpgradeTwoPhase}} Use the `--path` flag to specify the path to the upgrade file. For example:

        ```bash
        qq upgrade_cluster prepare \
          --path /qumulo_core_x.x.x.qimg
        ```

        ```bash
        qq upgrade_cluster commit
        ```

1. {{page.varViewUpgradeStatus}}

   When the CLI progress bar shows that the upgrade is complete, Qumulo Core restarts your cluster.

   {% capture disableProgressBar %}{{page.varDisableProgressBar}}{% endcapture %}
   {% include note.html content=disableProgressBar %}
