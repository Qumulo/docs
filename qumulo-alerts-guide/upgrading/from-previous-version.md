---
title: "Upgrading Qumulo Alerts from a Previous Public Version"
summary: "This section explains how to upgrade Qumulo Alerts from a previous public version to the latest one."
permalink: /qumulo-alerts-guide/upgrading/from-previous-version.html
sidebar: qumulo_alerts_guide_sidebar
---

## To Upgrade Qumulo Alerts to the Latest Public Version

{{site.qumuloalerts.shutdownQA}}

   {% include note.html content="This process might take up to 60 seconds. The `Alerts` Docker container must shut down and then verify that all Qumulo Alerts Docker containers are also shut down correctly." %}

1. In the Qumulo Alerts directory, run the `git pull` command.
  
1. To remove all existing Qumulo Alerts Docker images from your machine, use the `docker system prune -a -f` command.

   {% include note.html content="This release of Qumulo Alerts adds new Docker containers, making it necessary to remove all existing images." %}

1. To restart the Docker containers for Qumulo Alerts, pull new Docker images from the Qumulo Docker repository, and restart all Docker containers, use the `./start-docker-qumulo-alerts.sh` command.
