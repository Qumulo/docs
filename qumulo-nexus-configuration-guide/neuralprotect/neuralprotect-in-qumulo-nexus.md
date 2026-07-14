---
title: "NeuralProtect in Qumulo Nexus"
summary: "This section explains Qumulo NeuralProtect in Qumulo Nexus."
permalink: /qumulo-nexus-configuration-guide/neuralprotect/neuralprotect-in-qumulo-nexus.html
sidebar: qumulo_nexus_configuration_guide_sidebar
---

NeuralProtect is a threat-detection feature integrated into the Qumulo File System that scans client traffic in near-realtime in order to identify and mitigate malware threats and ransomware attacks before your data is lost.

## How NeuralProtect Works
NeuralProtect leverages an industry-leading threat detection engine, integrated into your Qumulo File System, in order to protect your data. 
NeuralProtect uses multiple detection approaches to identify ransomware, malware, suspicious content, and other threat activity.

* Behavioral ransomware detections identify activity that looks like ransomware encryption, including patterns associated with unknown or zero-day ransomware strains.

* Temporal ransomware detections compare how data changes over time to identify ransomware behavior that might be hidden when looking at only a single point in time.

* Deterministic ransomware detections identify ransomware behavior and known ransomware families by using indicators derived from previously analyzed ransomware strains.

* Insider threat detections identify suspicious encryption activity by users or processes that already have valid access to the data. These detections can help identify smaller, targeted attacks that might not have the volume patterns of broad ransomware activity.

* Malware detections identify known malware and suspicious payloads that might indicate an early-stage compromise before ransomware detonates.

NeuralProtect updates regularly to include the latest known signatures and detection logic.

## Protection Defaults and Limits
By default, NeuralProtect enables both quarantine and defensive snapshots.

You can disable quarantine, defensive snapshots, or both in the Nexus UI.

{% capture strongRec %}For best protection, we recommend keeping both quarantine and defensive snapshots enabled and configuring a [snapshot policy](/azure-native-administrator-guide/snapshots/managing-snapshots.html).{% endcapture %}
{% include important.html content=strongRec %}

When quarantine is enabled, NeuralProtect moves detected malware files to the configured quarantine path. The default quarantine path is `/.qumulo_quarantine`.

When defensive snapshots are enabled, NeuralProtect creates snapshots at the root of the file system after a threat detection. A minimum time between defensive snapshots can be configured, and the default is 60 minutes. Defensive snapshots have an expiration time set: snapshots created after encryption detections expire after 7 days, and snapshots created after other threat detections expire after 30 days.

## Notes 
* NeuralProtect is supported only with clusters [connected to Qumulo Nexus](../monitoring-and-metrics/enabling-nexus-remote-support-and-remote-management.html).

* NeuralProtect uses the [audit log](/azure-native-administrator-guide/monitoring-and-metrics/how-audit-logging-works.html) to be notified of write operations. With QFSD 7.9.0 and later, multiple audit destinations are supported, so NeuralProtect can be combined with other uses of the audit function. For earlier QFSD versions, NeuralProtect cannot be combined with other audit log destinations.

* Removing the NeuralProtect's audit log configuration will disable protection.

* In normal operation, the audit log stream to NeuralProtect may drop some events. The number of missed events is extremely small. NeuralProtect periodically runs self-tests to confirm that it is receiving and processing audit events promptly. If NeuralProtect becomes excessively delayed or drops events significantly, it produces an alert. The Qumulo team can help diagnose the issue and restore proper function.

* The NeuralProtect scanning engine runs next to the Qumulo cluster. File data is not sent to the cloud service for scanning nor as a result of detections. To support alerting and support responses, NeuralProtect does send file metadata related to detections to Nexus, including file paths and names.

* For a [Cloud Data Fabric (CDF) configuration](/azure-native-administrator-guide/cloud-data-fabric/how-portal-creation-enables-cloud-data-fabric.html), each cluster requires NeuralProtect to be enabled for all new write activity to be scanned.

* To maintain real-time scanning, extremely large files and archives will have some memory-intensive and compute-intensive scanning steps skipped. 

* Defensive snapshots occur after NeuralProtect detects a threat or encryption. Because a defensive snapshot can occur after data loss has already begun, we recommend [configuring a snapshot policy](/azure-native-administrator-guide/snapshots/managing-snapshots.html) in advance so that you can access a recent version of even the first file attacked.


## Next Steps
* To configure NeuralProtect in Nexus, see [Configuring NeuralProtect](configuring-neuralprotect.html).
