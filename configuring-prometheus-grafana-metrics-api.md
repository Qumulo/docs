---
title: Configuring Prometheus and Grafana to use the Qumulo Metrics API
permalink: configuring-prometheus-grafana-metrics-api.html
tags:
  - metrics
  - openmetrics
  - prometheus
  - grafana
sidebar: administrator_guide_sidebar
---

{% include content-reuse/openmetrics-api-introduction.md %}

This section describes how you can configure Prometheus&mdash;an open-source time-series database and collection system&mdash;to connect to the Qumulo API and poll its data at regular intervals. It also describes how you can use Grafana&mdash;an open-source analytics tool&mdash;to create dashboards with graphs and data that you can use to monitor the health of your Qumulo cluster, generate alerts, and improve your capacity statistics.

{% include important.html content="To use the OpenMetrics API, you you must configure your cluster to emit metrics without authentication. If your cluster isn't configured for this, open a request at [Qumulo Care](https://care.qumulo.com/hc/en-us/requests/new)." %}


## Installing and Configuring Prometheus
You can install Prometheus in different ways. The simplest installation requires uploading a file to your server.

1. Download the `.tar.gz` file from the [Prometheus download page](https://prometheus.io/download/#prometheus).

   {% include tip.html content="Choose a non-beta version for the operating system on the server that Prometheus will run on." %}

1. Upload the archive file to your server and extract the file to a directory, for example:

   ```bash
   $ tar xvfz prometheus-*.tar.gz
   ```

1. For information about installing Prometheus, and for installation options, see [Installation](https://prometheus.io/docs/prometheus/latest/installation/) in the Prometheus documentation.

1. To configure Prometheus, edit the `prometheus.yml` file in your directory and replace the configuration in the file with the following template.

   ```yaml
   ---
   global:
   scrape_interval: 1m

   # The scrape configuration with one endpoint to scrape
   scrape_configs:

   # Prometheus adds the job name as the label `job=<job_name>`
   # to any time series scraped from this configuration.
   - job_name: 'qumulo'

      static_configs:
         # The DNS name or IP address in your Qumulo cluster.
         # We recommend using a DNS name that resolves to a
         # floating IP address.
         - targets: ['<Hostname>:8000']

      metrics_path: '/v2/metrics/endpoints/default/data'

      scheme: https

      # The following setting lets us bypass our
      # untrusted, self-signed certificates.
      tls_config:
         insecure_skip_verify: true
   ```

1. To start the Prometheus server, make the `prometheus` file in your directory executable and run it, for example:

   ```bash
   $ chmod +x prometheus
   $ ./prometheus
   ```

1. To access the Prometheus web interface, use a browser to navigate to `<Hostname>:9090`.

1. On the top menu, click **Status > Targets**. 

   The page displays the endpoint for your cluster. After approximately one minute, the **State** changes to **UP**.

Prometheus is running on your server and connected to your cluster.


## Installing and Configuring Grafana

Follow the steps below to install Grafana and configure it to connect to Prometheus.

1. [Install Grafana](https://grafana.com/docs/grafana/latest/installation/) using the instructions in the Grafana documentation.

1. [Create a Prometheus data source](https://prometheus.io/docs/visualization/grafana/#creating-a-prometheus-data-source) using the Grafana Support for Prometheus page in the Prometheus documentation.

1. If you want to use alerts, set up a notification channel using the [Alert Notifications](https://grafana.com/docs/grafana/latest/alerting/old-alerting/notifications/) page in the Grafana documentation.

The following examples show basic graphing and alerting configurations.

### To Create a Throughput Graph
This example explains how you can configure a Grafana graph to show total read and write throughput across your cluster.

1. In Grafana, click **+** and then click **Create Dashboard**.

   If you already have a dashboard, at the top right click **Add Panel**.

1. Click **Add Query** and then select the data source for your cluster from the list next to **Query**.

1. For **Enter a PromQL query**, enter `sum by (protocol, io_type) (rate(qumulo_protocol_bytes[1m]))`.

   This query retrieves the throughput rate over a one-minute period, and the sum across the `protocol` and `io_type` tags. For information about writing PromQL queries, see the [Querying Prometheus](https://prometheus.io/docs/prometheus/latest/querying/basics/) in the Prometheus documentation.

1. To label each time series on the graph by `protocol` and `io_type`, for **Legend** enter `{{protocol}}: {{io_type}}`.

1. On the left menu, click **Visualization** and in the **Axes** section, under **Left Y**, do the following:

   a. Enter a **Label** for the Y-axis of the graph, for example `Throughput`.

   b. To set the scale to show throughput in gigabytes, click **Unit** and select **Data (Metric) > gigabytes**.

1. On the left menu, click **General** and enter a **Title** for the graph, for example `Cluster Throughput`.

1. At the top right, click ![Grafana Save Icon](administrator-guide/images/grafana-save-icon.png) and then click **Save**.

1. At the top left, click ![Grafana Back Arrow](administrator-guide/images/grafana-back-arrow.png).

   On the dashboard page, your graph appears.

   ![Example Throughput Graph](administrator-guide/images/prometheus-grafana-setup-example-throughput-graph.png)

1. (Optional) To see a smaller time scale of your data, at the top right click **Last 6 hours** and set it to a smaller vallue, for example 15 minutes.

For more information about dashboards, panels, and other visualizations, see the [Grafana documentation](https://grafana.com/docs/grafana/latest/).

### To Create an Alert for an Offline Node
An offline node creates risks of additional failures that can cause reduced performance, inability to write to the cluster, or take the entire cluster offline. This example explains how you can receive an alert when a node in a cluster is offline. For more information, see [Create Alerts](https://grafana.com/docs/grafana/latest/alerting/old-alerting/create-alerts/) and [Legacy Grafana Alerts](https://grafana.com/docs/grafana/latest/alerting/old-alerting/) in the Grafana documentation.

1. Configure a graph for the `qumulo_quorum_node_is_offline` metric.

   a. Use the example in the [To Create a Throughput Graph](#to-create-a-throughput-graph) section and replace the query with `qumulo_quorum_node_is_offline`.

   b. For **Legend**, enter `Node {{node_id}}`.

   c. On the left menu, click **Visualization** and, under **Left Y**, enter `0` for **Y-min**.

1. On the left menu, click **Alert** and then click **Create Alert**.

1. For **Name**, enter `Node Offline`.

1. To match the scrape interval, set **Evaluate every** to `1m`.

1. To receive alarms about transient issues (such as networking blips that can temporarily take a node offline), set **For** to `5m`.

   When an event triggers an alarm is initially, the alarm's state is `Pending`. When the alarm has been triggered for five minutes, its state changes to `Alerting` and Grafana sends notifications.

1. To trigger the alarm when any node goes offline for one minute, set the following condition:

   **WHEN** `sum()` **OF** `query (A, 5m, now)` **IS ABOVE** `0`

1. To avoid a scenario in which an alarm might not go off when the OpenMetrics API is unable to output any metrics if your cluster goes offline entirely, set **If no data or all values are null** and **If execution error or timeout** to **SET STATE TO Alerting**.

1. In the **Notifications** section, click the **+** next to **Send to**, and select a notification channel for the alerts to be sent to.

1. In the **Message** box, enter `Node ${node_id} is offline!`.

1. To test the alert, click **Test Alert**.

1. Click ![Grafana Save Icon](administrator-guide/images/grafana-save-icon.png).

### To Create an Alert for a Full Cluster
It is important for an administrator to know how much free space is left on a cluster. This example explains how you can configure a graph to show how full the cluster is and to receive an alert when your cluster is almost full. For more information, see [Create Alerts](https://grafana.com/docs/grafana/latest/alerting/old-alerting/create-alerts/) and [Legacy Grafana Alerts](https://grafana.com/docs/grafana/latest/alerting/old-alerting/) in the Grafana documentation.

1. Configure a graph for used space. Use the example in the [To Create a Throughput Graph](#to-create-a-throughput-graph) section and replace the query with `1 - qumulo_free_bytes / qumulo_capacity_bytes`.
   
   This graph shows the amount of used space on the cluster as a percentage of total capacity. An empty cluster shows 0% used space and a full cluster shows 100%.

1. On the left menu, click **Visualization** and in the **Left Y** section, under **Unit** click **percent (0.0-1.0)**.

1. Set **Y-min** to `0` and **Y-max** to `1`.

1. On the left menu, click **Alert** and then click **Create Alert**.

1. To match the scrape interval, set **Evaluate every** to `1m`.

1. To receive alarms about transient issues (such as networking blips that can temporarily take a node offline), set **For** to `5m`.

   When an event triggers an alarm is initially, the alarm's state is `Pending`. When the alarm has been triggered for five minutes, its state changes to `Alerting` and Grafana sends notifications.

1. To trigger the alarm when you cluster averages less than 10% of free space over the period specified in the **For** field, set the following condition:

   **WHEN** `avg()` **OF** `query (A, 5m, now)` **IS BELOW** `.10`

1. In the **Notifications** section, click the **+** next to **Send to**, and select a notification channel for the alerts to be sent to.

1. In the **Message** box, enter `Cluster is almost full.`.

1. To test the alert, click **Test Alert**.

1. Click ![Grafana Save Icon](administrator-guide/images/grafana-save-icon.png).
