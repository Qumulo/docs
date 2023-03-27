---
title: "Restoring the Default Values for Cloud-Based and Nexus Monitoring"
summary: "This section explains how to set the default values for Cloud-Based Monitoring and Nexus Monitoring."
permalink: /administrator-guide/monitoring-and-metrics/restoring-default-values-cloud-based-nexus-monitoring.html
keywords: monitoring, Cloud-Based Monitoring, Nexus, proxy, default
sidebar: administrator_guide_sidebar
---

When you no longer [connect to Cloud-Based Monitoring by using a custom proxy](connecting-cloud-based-monitoring-s3-custom-proxy.html), you can use the `qq` CLI to restore the default values for Cloud-Based and Nexus Monitoring.

## To Restore the Default Values for Cloud-Based and Nexus Monitoring by Using the qq CLI

1. Connect to your cluster by using SSH. For example:

   ```bash
   ssh admin@{{site.exampleIP0}}
   ```

1. Log in to Qumulo Core by using the administrative account. For example:

   ```bash
   qq login -u admin -p mypassword
   ```

1. To restore the default values for Cloud-Based and Nexus Monitoring, use the `qq set_monitoring_conf` command.

   In the following example, we:
   
   * Enable Cloud-Based Monitoring (MQ)
   
   * Enable Nexus monitoring

   * Disable HTTPS for the S3 proxy

   * Set the hostname and port for Cloud-Based Monitoring

   * Disable the proxy for Cloud-Based Monitoring (by setting it to `0`)

   * Set the monitoring polling interval to 60 seconds

   * Set the hostname and port for the S3 proxy
   
   * Specify the custom VPN for your organization, `example.qumulo.com`

   ```bash
   qq set_monitoring_conf
     --enabled
     --nexus-enabled
     --s3-proxy-disable-https
     --mq-host missionq.qumulo.com
     --mq-port 443
     --mq-proxy-port 0
     --period 60
     --s3-proxy-host monitor.qumulo.com
     --s3-proxy-port 443
     --vpn-host example.qumulo.com
   ```
 
 1. To confirm that Cloud-Based Monitoring is working correctly, log in to the Qumulo Core Web UI and then click **Support**.
 
    {{site.monitoring.cloudBasedMonitoringEnabled}}
