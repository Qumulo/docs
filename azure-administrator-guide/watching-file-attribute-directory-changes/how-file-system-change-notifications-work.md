---
title: "How File System Change Notifications Work in Qumulo Core"
summary: "This section describes how file system change notifications work in Qumulo Core and explains request filtering, recursion, and the three configuration modes for notification requests."
permalink: /azure-administrator-guide/watching-file-attribute-directory-changes/how-file-system-change-notifications-work.html
sidebar: azure_guide_sidebar
keywords: CHANGE_NOTIFY, watch, change, file_change, directory_change, file_system, filtering, recursion, configuration_type, DISABLED_ERROR, DISABLED_IGNORE, ENABLED
varClientOverwhelmed: In case a client can't keep up with the amount of events that the system emits, the cluster stops queuing events and produces an error the next time the client attempts to contact the cluster.
varMeasurablePerformanceImpact: For example, thousands of recursive watches at the file system root can have a measurable performance impact on a write-heavy IOPS workload.
---

{% include content-reuse/admin-guides/watching-file-attribute-directory-changes/how-file-system-change-notifications-work.md %}
