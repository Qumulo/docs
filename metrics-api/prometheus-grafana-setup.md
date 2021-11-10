<h1>Installing Prometheus</h1>

Install prometheus using the documentation provided on the [Prometheus website](https://prometheus.io/docs/prometheus/latest/installation/). There are several different setups you can use, including installing to a Docker container or using a configuration management system such as Ansible.

<h1>Configuring Prometheus</h1>

The configuration for prometheus is kept in `prometheus.yml`. Create this file if it does not already exist, and add any desired configurations for your monitoring setup. Use the following example as a template:

`prometheus.yml`
```
---
global:
  scrape_interval: 1m

# A scrape configuration containing exactly one endpoint to scrape:
scrape_configs:

  # The job name is added as a label `job=<job_name>`
  # to any timeseries scraped from this config.
  - job_name: 'qumulo'

    static_configs:
      - targets: ['<Hostname>:8000']

    metrics_path: '/v2/metrics/endpoints/default/data'

    scheme: https

    # The following is needed in order to bypass our
    # self-signed certificates not being trusted
    tls_config:
      insecure_skip_verify: true
```

Fill in the \<Hostname\> field with the hostname of your cluster. This would preferably be a DNS record associated with one or more floating IP addresses from the cluster.

**Important Note**: In order to use the metrics API, your cluster must have authentication disabled on the endpoint. Please reach out to your Qumulo Systems Engineer or Success Manager if this has not been done.

<h1>Installing and Configuring Grafana</h1>

Follow the Prometheus documentation for integrating with Grafana found [here](https://prometheus.io/docs/visualization/grafana/) in order to get Grafana up and running with Prometheus. Follow the Grafana documentation for integrating alerts with notification systems found [here](https://grafana.com/docs/grafana/latest/alerting/old-alerting/notifications/) in order to receive notifications when alerts are triggered.

<h1>Examples</h1>

<h2>Create a Throughput Graph with Grafana</h2>

![Example Throughput Graph in Grafana](metrics-api/images/prometheus-grafana-setup-example-throughput-graph.png)

This example with demonstrate how to setup a graph on Grafana to view total read and write throughput across your cluster. These instructions assume that you already have Grafana installed and configured to pull from a Prometheus instance, and will be based on the *Creating a Prometheus graph* section in the [Prometheus documentation](https://prometheus.io/docs/visualization/grafana/).

1. Follow the first two steps of the *Creating a Prometheus graph* section from the documentation linked above to create a new Grafana graph and set it to query your Prometheus instance.
1. For Step 3, enter the following for the query:
  
    `sum by (protocol, io_type) (rate(qumulo_protocol_bytes[1m]))`

    This query will get the throughput rate over a 1 minute period, and sum over the protocol and io_type tags. For more information on writing PromQL queries, see the [Prometheus documentation](https://prometheus.io/docs/prometheus/latest/querying/basics/).

1. For Step 4, you can enter something like `{{protocol}}: {{io_type}}`. This will label each time series shown on the graph by the protocol and the io_type.
1. On the side menu to the left, select the second icon down, *Visualization*. In the *Label* box under *Left Y* in the *Axes* section, enter something like "Throughput (bytes)". This will add a label to the Y-axis on the left side of the graph.
1. On the side menu to the left again, select the next option down, *General*. In the *Title* box, enter something like "Cluster Throughput". This will set the title of the graph itself.
1. You can play around with some of the other visualization settings to adjust the appearance to your liking.
1. Finally, in the top right corner there is a dropdown menu that should say something like "Last 6 hours". For the purposes of this example, you can set it to be something shorter such as 5 or 15 minutes in order to see the graph fill up with data more quickly.
1. Hit the save icon in the top right corner and click *Save*.
1. Click the back arrow at the top left corner to go back to the dashboard page, where you should be able to see the new graph you just made with data starting to come in.

For more information about dashboards, panels, or other visualizations, see their respective sections in the [Grafana documentation](https://grafana.com/docs/grafana/latest/).

<h2>Alert on Offline Node<\h2>

Administrators want to be promptly notified when there is an issue in their cluster preventing one or more nodes from being online. Being in this state risks additional failures taking the entire cluster offline, as well as reduced performance and eventually the inability to write to the cluster. We'll get notified quickly of this state by making a alarm in Grafana.

To make an alarm we'll follow [this guide](https://grafana.com/docs/grafana/latest/alerting/old-alerting/create-alerts/).
1. Start by setting up a graph of `qumulo_quorum_node_is_offline`. You can use the previous example as a guide and replace the query with the following:
    `sum(qumulo_quorum_node_is_offline)`
1. Name the alarm "Node Offline".
1. Evaluate every 1 minute to match the scrape interval.
1. If you would like to not be notified of transient issues, such as a networking blip that temporarily makes a node offline, use *For* to set the amount of time that a node must be offline before being alerted.
1. Set the conditions for the alert to be `avg()` is above 0.95. If you have set *For* to be 5m for example, then the alarm will go off when a node has been offline for 95% of the last 5 minutes.
1. Select a notification channel to receive the alerts and add a message that should come with the alert.
1. Click *Test Alert* to test the alert to make sure it is working.
1. When you are done configuring any other settings, click the save icon in the top right corner to save the alert.

For more information on alerts, see the [Grafana documentation](https://grafana.com/docs/grafana/latest/alerting/old-alerting/).

<h2>Alert on Low Free Space</h2>

Knowing how much free space is left in a cluster is very important, and in many cases it is useful to have an alarm that will alert when free space gets too low. In this example we will create a graph to show free space remaining and set an alarm to alert if it gets too low.

1. Create a new graph as demonstrated in the previous examples.
1. For the query, enter the following:
    `qumulo_free_bytes / qumulo_capacity_bytes * 100`
    This will show the amount of free space left in the cluster as a percentage of the total capacity, so an empty cluster would be 100% free space, and a full cluster would be 0%.
1. Create a new alert. You can call it something like "Free Space Low".
1. Set the conditions for the alert to be `avg()` is below 10. This means that the alarm will go off if the cluster averages below 10% free space over the period of time specified in the *For* field.
1. Enter the notification channel you want alerts to be sent to as well as a message.
1. Finish any other configuration you want to do with the graph or the alert, then click the save icon in the top right corner.

For more information on alerts, see the [Grafana documentation](https://grafana.com/docs/grafana/latest/alerting/old-alerting/).
