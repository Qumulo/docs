---
title: "Performing Instant Software Upgrades and Platform Upgrades"
summary: "This section explains the difference between Instant Software Upgrades and Platform Upgrades. For more information, see <a href='https://care.qumulo.com/hc/en-us/articles/115008107468'>Performing Qumulo Core Upgrades by Using the qq CLI</a> on Qumulo Care."
permalink: /administrator-guide/upgrading-qumulo-core/instant-software-platform.html
redirect_from:
  - /administrator-guide/upgrades/instant-software-platform.html
sidebar: administrator_guide_sidebar
keywords: update, upgrade, instant, instant software upgrade, platform, platform upgrade
varContactQumuloCare: If you perform multiple upgrades back to back, you might encounter one or more platform upgrades in one of the incremental releases; you must install these upgrades before you continue. Before performing back to back upgrades, contact <a href="https://care.qumulo.com/hc/en-us/articles/115008409408">Qumulo Care</a> for guidance.
varRollingRebootRefresh: If you don’t see a rolling reboot option for a platform upgrade, refresh the page in your browser.
---


{{site.data.alerts.important}}
<ul>
  <li>{{page.varContactQumuloCare}}</li>
  <li>{{page.varRollingRebootRefresh}}</li>
</ul>
{{site.data.alerts.end}}


## Understanding the Differences Between Upgrade Modes
For information about which upgrade modes different Qumulo Core releases use, see [Qumulo Core Upgrade Mode Reference](mode-reference.md).

* **Instant Software Upgrade:** The more common, faster instant software upgrade requires restarting only the container on your nodes and has a downtime of less than 30 seconds.

  Because in Qumulo Core 3.3.2 (and higher), the Qumulo file and data protection systems are separate from the host in charge of running the operating system and the services specific to each hardware or cloud platform, and because these services run in a lightweight container (by using Ubuntu-native [systemd-nspawn](https://www.freedesktop.org/software/systemd/man/systemd-nspawn.html) containerization) in the user space, it is possible to move quickly from one version of Qumulo Core to another by loading a new container and pointing the runtime environment at updated software.
  
  {{site.data.alerts.note}}
  <ul>
    <li>Under certain conditions, an end-to-end instant software upgrade might take a little longer while Qumulo Core performs background tasks. This doesn't impact user experience.</li>
    <li>Instant software upgrades don't impact existing support for the <code>qq</code> CLI or REST API commands.</li>
    <li>A direct upgrade to Qumulo Core 3.3.3 <em>isn't</em> an instant software upgrade (it only establishes the framework for this functionality). Upgrading from Qumulo Core 3.3.2 to 3.3.3 is the first official, minimally disruptive instant software upgrade. Any subsequent upgrade, regardless of release, is an instant software upgrade unless we specify otherwise.</li>
  </ul>
  {{site.data.alerts.end}}

* **Platform Upgrade:** The infrequent, somewhat slower platform upgrade requires either a _complete reboot_ (rebooting all nodes in your cluster at the same time) or&mdash;in Qumulo Core 5.0.3 (and higher)&mdash;a _rolling reboot_ (rebooting the nodes in your cluster one at a time).

  In contrast with instant software upgrades, your nodes maintain the Linux operating system, and certain services that Qumulo Core relies on, through most upgrades because the underlying host changes less frequently than the container and the file and data protection systems.

  {{site.data.alerts.important}}
  <ul>
    <li>{{page.varContactQumuloCare}}</li>
    <li>{{page.varRollingRebootRefresh}}</li>
    <li>Upgrading past a platform upgrade still requires a node reboot, even if you don't install the exact build. For example, if your cloud cluster runs Qumulo Core 4.0.0, installing Qumulo Core 4.1.0 triggers a platform upgrade, because the installation includes all changes contained in Qumulo Core 4.0.6 that is a platform upgrade.</li>
  </ul>
  {{site.data.alerts.end}}

## Understanding the Upgrade Phases

Every Qumulo Core upgrade has two phases, _preparation_ and _commit_.

1. **Preparation:** Qumulo Core stages a new image in an alternate boot drive partition while the current image continues to run. This phase is responsible only for the background work (unpacking and writing the platform image and upgrade firmware, and so on). When the preparation phase is complete, we continue to the commit phase.

1. **Commit:** Qumulo Core does one of the following:

   * **Instant Software Upgrade:** Stops the existing container and starts a new one.
   * **Platform Upgrade:** Initiates a reboot and selectively upgrades the operating system image.

To determine what phase an upgrade is in, use the `qq upgrade_status` command while your cluster is performing and upgrade. For more information, see [Performing Qumulo Core Upgrades by Using the qq CLI](https://care.qumulo.com/hc/en-us/articles/115008107468) on Qumulo Care.

The following is example output from the command.

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
