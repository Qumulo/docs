---
title: "Connecting to Grafana to View Visualizations of Qumulo Alerts Data"
summary: "This section explains how to connect to the Qumulo Alerts instance of <a target='_blank' href='https://grafana.com/'>Grafana</a> to view visualizations and information about your Qumulo cluster from prebuilt dashboards."
permalink: /qumulo-alerts-guide/connecting-grafana.html
sidebar: qumulo_alerts_guide_sidebar
---

## To Connect to the Grafana Endpoint
1. In a browser, navigate to the hostname of your running Grafana instance on port 3000. For example:

   ```
   http://{{site.exampleIP0}}:3000
   ```

   {% include tip.html content="Running the `./start-docker-qumulo-alerts.sh` script starts Grafana." %}

2. When prompted, enter the default credentials:

   1. For **Login**, enter `qumulo`.
     
   1. For **Password**, enter `Admin123`.

   Grafana displays visualizations and information about your cluster.

3. [Change the default Grafana password](https://grafana.com/docs/grafana/latest/administration/user-management/user-preferences/).
