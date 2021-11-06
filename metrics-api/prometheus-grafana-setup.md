<h1>Installing Prometheus</h1>

Install prometheus using the documentation provided on the [Prometheus website](https://prometheus.io/docs/prometheus/latest/installation/).

<h1>Configuring Prometheus</h1>

The configuration for prometheus is kept in `prometheus.yml`. Create this file if it does not already exist, and add any desired configurations for your monitoring setup. Use the following exmaple as a template:

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
      - targets: ['<Hostname>:<Port>']

    metrics_path: '/v2/metrics/endpoints/default/data'

    scheme: https

    # The following is needed in order to bypass our
    # self-signed certificates not being trusted
    tls_config:
      insecure_skip_verify: true
      
    # authorization:
      # credentials: <Bearer token>
```

1. Fill in the following fields in prometheus.yml:

   a. **job_name**: This will be attached to all metrics from this job as a label, so just call it something that will allow you to identify it in Prometheus.

   b. **static_configs**: Fill in the <Hostname> and <Port> fields with the hostname and port that the REST server is running on.

   c. **metrics_path**: The endpoint for Prometheus to pull from.

   d. **scheme**: For our REST APIs, this must be set to https.

   e. **tls_config**: The insecure_skip_verify: true field allows Prometheus to bypass the warning asserted from the self-signed certificates we use.

1. The Metrics API can run with or without authentication. With authentication, Prometheus will need to be provided a bearer token that will expire after 8 hours, at which point a new bearer token will need to be provided. Without authentication, this is not necessary. Decide which option is best for your situation and do the corresponding steps below:

   a. **Authenticated**: Uncomment the two lines containing authorization and credentials. Replace <Bearer token> with a bearer token for a user with PRIVILEGE_METRICS_READ privileges. To get a bearer token for a user:

     i. Login with the user using qq login, you can also use cli/qq --port <port> loginfor the local simnode

     ii. Open ~/.qfsd_cred

     iii. Copy the bearer_token field

   b. **Unauthenticated**: Leave the bottom two lines commented out and disable authentication on the endpoint specified for metrics_path:

      i. Login with the user using qq login, you can also use cli/qq --port <port> loginfor the local simnode.

      ii. Disable authentication using qq_internal --port <port> metrics_set_config -d.
