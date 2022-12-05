---
title: "How Qumulo Alerts Works with Qumulo Core"
summary: "This section explains how Qumulo Alerts monitors alarms and alerts for a Qumulo Core Cluster."
permalink: /qumulo-alerts-guide/getting-started-qumulo-alerts/qumulo-alerts-with-qumulo-core.html
sidebar: qumulo_alerts_guide_sidebar
keywords: Qumulo Alerts, alert, alarm, monitor, cluster, hardware alarm, software alarm, producer, consumer, plugin, plug-in, Exchange
---

## How Qumulo Alerts Works
Qumulo Alerts is a Docker-based system that comprises multiple containers. The main container uses a series of _plugins_ to collect _hardware alarms_ and _software alerts_ from Qumulo Core clusters.

In Qumulo Alerts, _producers_ are Docker containers that take data from various sources, pass it through _the Exchange_, a processing queue, and finally give it to _consumers_, defined users or user groups. Aside from processing data, the Exchange facilitates the transfers between the producers and consumers.

{% include image.html alt="Qumulo Alerts Architecture Diagram" file="qumulo-alerts-architecture.png" %}

Both producers and consumers use plugins that help process alarms and alerts from a Qumulo Core cluster. A _plugin_ is a mechanism that processes a single function, such as fan failure, disk failure, or node failure. Plugins help with granular control over the information that Qumulo Alerts collects and processes.

## Known Limitations of Qumulo Alerts
This section lists the currenly known limitations for Qumulo Alerts.

* **Floating IP Addresses or Network Load Balancing (NLB):** To prevent overloading any node in a Qumulo cluster, Qumulo Alerts plugins connect to all nodes in the cluster by using floating IP addresses or an NLB.

  {% include important.html content="Qumulo Alerts can't function if neither IP addresses or NLBs are configured." %}

* **Error Logging:** Qumulo Alerts generates a large number of error messages that can help you debug issues. However, currently, all logging remains within the Docker container and is therefore not accessible easily. For help with debugging issues, contact [Qumulo Care](https://care.qumulo.com/hc/en-us/articles/115008409408).

* **Connectivity to the Cluster:** If Qumulo Alerts loses connectivity to your Qumulo cluster for more than 10 minutes, you can start a new Qumulo Alerts session or contact [Qumulo Care](https://care.qumulo.com/hc/en-us/articles/115008409408) for help with debugging your running session. This scenario might occur when there is a VPN that requires re-authentication.

  {% include important.html content="When you terminate your Qumulo Alerts session and start a new one, all logging data from the session running in the Docker container is discarded." %}

* **JSON-Based Configuration:** Currently, to configure Qumulo Alerts, an administrator must edit multiple JSON files.
