---
title: "Configuring NeuralProtect in ANQ"
summary: "This section explains how to enable and configure NeuralProtect on ANQ in Qumulo Nexus."
permalink: /qumulo-nexus-configuration-guide/neuralprotect/configuring-neuralprotect.html
sidebar: qumulo_nexus_configuration_guide_sidebar
---

This section explains how to deploy and configure NeuralProtect for an Azure Native Qumulo (ANQ) deployment from Qumulo Nexus.

## Prerequisites
* The `Threat Detection System Configurer` role in Nexus

  A Nexus user with the `Admin` role can grant this role. For more information, see [Managing User Access in Qumulo Nexus](../authorization/managing-user-access.html#how-user-roles-work-in-qumulo-nexus).

* ANQ Enterprise

* An ANQ cluster to protect and associated with Qumulo Nexus

* For QFSD versions earlier than 7.9.0, the audit log feature is not in use on the cluster

  {% include note.html content="NeuralProtect uses the audit log configuration for threat detection. With QFSD 7.9.0 and later, multiple audit destinations are supported, so NeuralProtect can be combined with other uses of the audit function. For earlier QFSD versions, NeuralProtect can't share the audit log configuration with any other audit log destination. Replacing the audit log configuration disables protection." %}

## To Enable NeuralProtect
1. [Log in to Qumulo Nexus](https://nexus.qumulo.com/login).

1. Go to the ANQ cluster that you want to protect.

1. In the left menu, click **Threat Detection**. If **Threat Detection** is not visible, reach out to the Qumulo Care team for help.

1. Click **Add NeuralProtect**.

1. In the confirmation prompt, click **Yes, Add**.

1. Wait 5 to 10 minutes for the deployment to finish.

1. Click **Go to Dashboard** and confirm that the **NeuralProtect Dashboard** appears and shows that the cluster is protected.

After you enable NeuralProtect, you can return to the Nexus UI at any time to change the protection settings for the cluster.

## To Configure Alert Notifications
Nexus users can subscribe to email alerts for the clusters in their account.

1. Go to **User Settings** > **Alerts**.

1. Enable email alerts.

1. Choose the instances that you want to receive alerts from.

1. In the **Alerts to receive** section, under **Threat Detection**, turn on the NeuralProtect alert types that you want.

## To Configure Exclude and Suppression Behavior
NeuralProtect lets you configure glob path patterns to control how detection behavior applies to specific parts of the file system.

* In **Threat Detection** > **Settings**, use **Exclude Patterns** to enter comma-separated glob patterns. Exclude patterns fully exclude matching paths from NeuralProtect scanning. Events on matching paths don't trigger scanning at all, so you can't use NeuralProtect events to confirm whether an exclude pattern is being matched.

* In **Threat Detection** > **Suppression Rules**, configure suppression rules for paths where you want NeuralProtect to scan but not send alert notifications. Because scanning still occurs, suppression events can show whether suppression rules are being activated.

In general, we recommend using suppression rules instead of exclude patterns. Suppression rules provide more information about detection behavior and help you confirm that a rule is applied correctly.

NeuralProtect scans are not expected to impact other workloads that use the same files. Scans do not take protocol locks or cause contention that would interfere with other applications.

## To Configure Quarantine
When quarantine is enabled, NeuralProtect automatically moves files that contain detected malware to the configured quarantine path.

In **Threat Detection** > **Settings**, you can turn quarantine behavior on or off and configure the **Quarantine path**. The default quarantine path is `/.qumulo_quarantine`.

## To Configure Defensive Snapshots
When defensive snapshots are enabled, NeuralProtect creates snapshots at the root of the file system after a threat detection.

In **Threat Detection** > **Settings**, you can turn defensive snapshots on or off and configure the **Minimum interval between snapshots (minutes)**. NeuralProtect will create defensive snapshots no more frequently than this value (default is 60 minutes).

