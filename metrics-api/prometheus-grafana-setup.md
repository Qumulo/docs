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

<h1>Installing and Configuring Grafana</h1>

Follow the Prometheus documentation for integrating with Grafana found [here](https://prometheus.io/docs/visualization/grafana/) in order to get Grafana up and running with Prometheus.

<h1>Examples</h1>

<h2>Creating a Throughput Graph with Grafana</h2>

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
