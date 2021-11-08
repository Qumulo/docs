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
