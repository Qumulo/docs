---
title: "Connecting to Cloud-Based Monitoring by Using a Custom Proxy"
summary: "This section explains how to connect to Cloud-Based Monitoring by using a custom proxy."
permalink: /administrator-guide/monitoring-and-metrics/connecting-cloud-based-monitoring-custom-proxy.html
keywords: monitoring, Cloud-Based Monitoring, proxy, custom proxy
sidebar: administrator_guide_sidebar
varNoRemoteVPNforCustomProxy: Remote VPN support isn't available when you connect to Cloud-Based Monitoring by using a custom proxy.
---

In Qumulo Core 2.6.4 (and higher), you can connect to Cloud-Based Monitoring by specifying a custom proxy. You can configure the custom proxy in a number of different ways.

## Configuring a Custom Proxy for Cloud-Based Monitoring and S3
The following examples show some common configurations for custom proxies.

{% capture NoRemoteVPN %}{{page.varNoRemoteVPNforCustomProxy}}{% endcapture %}
{% include important.html content=NoRemoteVPN %}

You can use the `qq set_monitoring_conf` command to specify a custom proxy hostname and port _only_ for Cloud-Based Monitoring. For example:

```bash
qq set_monitoring_conf
  --enabled
  --mq-proxy-host mq-proxy.example.com
  --mq-proxy-port 123
```

You can also use the `qq set_monitoring_conf` command to specify a custom proxy hostname and port _only_ for the S3 endpoint where you want Qumulo Core to store core dumps and logs. For example:

```bash
qq set_monitoring_conf
  --enabled
  --s3-proxy-host s3-proxy.example.com
  --s3-proxy-port 456
```

Finally, you can use the `qq set_monitoring_conf` command to specify a custom proxy hostname and port for _both_ Cloud-Based Monitoring and your S3 endpoint. For example:

```bash
qq set_monitoring_conf
  --enabled
  --all-proxy-host mq-s3-proxy.example.com
  --all-proxy-port 789
```
