---
title: "Performance Characteristics and Default Service Limits of Azure Native Qumulo v2"
summary: "This section describes the performance characteristics and default service limits of Azure Native Qumulo (ANQ) v2."
permalink: /azure-administrator-guide/getting-started/performance-characteristics-default-limits-azure-native-qumulo.html
sidebar: azure_guide_sidebar
keywords: cloud, azure, native, ANQ, ANQ_v2, performance_characteristics, performance, characteristics, limits, default_limit, service_limit
---

{{site.azure.qumuloOnAzureShort}} v2 introduces a file system architecture that offers improved performance and flexibility for file systems of any size. For this reason, we eliminated the concept of _total available capacity._ You pay only for the data you store and, separately, for the throughput you use.

{{site.data.alerts.note}}
<ul>
  <li>We describe the performance of your {{site.azure.qumuloOnAzureShort}} v2 instance in terms of throughput (bytes per second), IOPS, and operation latency.</li>
  <li>Because {{site.azure.qumuloOnAzureShort}} v2 is a distributed file system, it is very effective for servicing multi-stream workloads with multiple clients or threads. The throughput and IOPS for single-stream and low-concurrency workloads might be lower than the performance characteristics listed in this section.</li>
</ul>
{{site.data.alerts.end}}

## Throughput Performance
{{site.azure.qumuloOnAzureShort}} v2 instances can perform at above 100 Gbps with high-concurrency, multi-stream workloads. However, when you provision an {{site.azure.qumuloOnAzureShort}} v2 instance, Qumulo sets a default service limit of about 4 GBps. If you have a workload that needs higher sustained or peak throughput peak, {{site.azure.emailAzure}} to raise this service limit. 

{% include note.html content="The default service limit isn't a hard cap. In certain scenarios, it might be possible to reach a throughput higher than 4 GBps with default configuration." %}

## IOPS Performance
By default, {{site.azure.qumuloOnAzureShort}} v2 is optimized for high-throughput (rather than high-IOPS) workloads. 

For workloads with IOPS sensitivity, {{site.azure.emailAzure}} for a technical consultation.
