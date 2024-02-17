---
title: "Connecting to Grafana to View Visualizations of Qumulo Alerts Data"
summary: "This section explains how to connect to the Qumulo Alerts instance of <a target='_blank' href='https://grafana.com/'>Grafana</a> to view visualizations and information about your Qumulo cluster from prebuilt dashboards."
permalink: /qumulo-alerts-guide/connecting-grafana.html
sidebar: qumulo_alerts_guide_sidebar
---

## To Connect to the Grafana Endpoint
1. In a browser, navigate to the hostname of your running Grafana instance on port 3000. Grafana was started when you executed the script 

   ```
   ./start-docker-qumulo-alerts.sh
   ```

   For example, if your docker instance of Grafana is on IP address 203.0.113.0:

   ```
   http://203.0.113.0:3000
   ```

2. When prompted, enter the following:

   * **Login:** `qumulo`
     
   * **Password:** `Admin123`.

   Grafana displays visualizations and information about your cluster.

3. [Change the default Grafana password](https://grafana.com/docs/grafana/latest/administration/user-management/user-preferences/).
