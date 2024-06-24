---
title: "Upgrading Grafana in the Qumulo Alerts Docker Container"
summary: "This section explains how to upgrade Grafana in a Qumulo Alerts Docker container from a machine running Ubuntu 22.04."
permalink: /qumulo-alerts-guide/upgrading/grafana-in-docker-container.html
sidebar: qumulo_alerts_guide_sidebar
---


## Prerequisites
To perform these instructions, ensure that you have `root` privileges and that Docker is installed.

{% include note.html content="If you experience any issues during the upgrade process, you can diagnose potential issues by running the `docker logs` command and specifying the ID of the Grafana container." %}

## To Upgrade Grafana in the Qumulo Alerts Docker Container

1. To switch to the `root` user, run the `sudo -s` command.

1. Navigate to the `/opt/qumulo/QumuloAlerts` directory that contains the Qumulo Alerts Docker configuration files.

1. To update the Grafana configuration, ensure that the following line in the `docker-compose.yml` file specifies version `10.4.2`:

   ```
   image: grafana/grafana-oss:${GRAFANA_VERSION:-10.4.2}
   ```

1. To stop all running Qumulo Alerts Docker containers, run the `stop-docker-qumulo-alerts.sh` script.

1. To remove the previous Grafana Docker image:

   1. Run the `docker image ls` command to list all existing image IDs.

   1. Run the `docker rmi` command and specify the ID of the image. For example:

      ```bash
      docker rmi grafana/grafana:10.2.0
      ```

1. To restart Qumulo Alerts with the new configuration, run the `start-docker-qumulo-alerts.sh` script.

1. The verify the Qumulo Alerts Docker container's status, you can run the `docker ps -a` command or access Grafana by using its configured endpoint and port. For example:

   ```
   http://127.0.0.1:3000
   ```
