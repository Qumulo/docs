---
title: "Integrating Qumulo Core with Varonis"
summary: "This section explains how to integrate Qumulo Core with Varonis by deploying Qumulo Broker."
permalink: /integration-guide/varonis/deploying-qumulo-broker.html
redirect_from:
  - /integration-guide/qumulo-broker/deploying-qumulo-broker.html
  - /integration-guide/varonis-collector/deploying-qumulo-broker.html
sidebar: integration_guide_sidebar
keywords: Varonis, integrate, integration, broker, Qumulo Broker, deploy
---

{{site.varonis.separateMachine}} For more information, see the [Qumulo-Varonis integration architecture diagram](qumulo-broker-with-qumulo-core.html#integration-architecture-diagram).

## Step 1: Prepare for Deploying Qumulo Broker
This section explains how to prepare your Qumulo Broker machine for deployment.

1. Clone the [Qumulo Broker](https://github.com/Qumulo/QumuloBroker) repository from GitHub into the `/opt/qumulo` directory on your Qumulo Broker machine.

1. To configure the system to use the MariaDB database, edit the `/opt/qumulo/QumuloBroker/api/.env` file and specify the values for the `MYSQL_ROOT_PASSWORD` and `MYSQL_PASSWORD` variables.

   {% include important.html content="Leave the `MYSQL_DATABASE` and `MYSQL_USERNAME` variables unchanged." %}
   
<a id="deploy-qumulo-broker"></a>
## Step 2: Deploy the Qumulo Broker API Server
This section explains how to deploy Qumulo Broker on a standalone machine or virtual machine.

1. Navigate to the `/opt/qumulo/QumuloBroker/api/` directory on your Qumulo Broker machine.

1. Ensure that Docker and Docker Compose are installed on your Qumulo Broker machine.
   
   ```bash
   docker version
   docker compose version
   ```
   
1. To start the Docker containers, use the `docker compose up -d` command.

   The command creates the network and containers. The following is example output from the command.
   
   ```
    ⠿ Network api_qumulo-net  Created      0.1s
    ⠿ Container api-db-1      Started      1.2s
    ⠿ Container api-web-1     Started      1.3s
    ⠿ Container api-proxy-1   Started      1.6s
   ```
   
1. To view the status of running containers, use the `docker ps` command.

   In the following example output from the command, the output is formatted for readability.

   ```
   CONTAINER ID   IMAGE          COMMAND                  CREATED         
   1a234567b089   nginx:latest   "/docker-entrypoint.…"   6 seconds ago  
   a1234567bcde   api-web        "app/main.py"            6 seconds ago   
   123ab45678cd   mariadb        "docker-entrypoint.s…"   7 seconds ago   
   
   STATUS         PORTS                                           NAMES
   Up 4 seconds   80/tcp, 0.0.0.0:443->443/tcp, :::443->443/tcp   api-proxy-1
   Up 5 seconds   0.0.0.0:8000->8000/tcp, :::8000->8000/tcp       api-web-1
   Up 5 seconds   0.0.0.0:3306->3306/tcp, :::3306->3306/tcp       api-db-1
   ```
   
1. To view the logs of a specific container, use the `docker logs <container-id>` command.

You can now configure Varonis to communicate with your Qumulo cluster.

<a id="configure-audit-logging"></a>
## Step 3: Configure Qumulo Audit Logging by Using the qq CLI
This section explains how to configure audit logging on your Qumulo cluster.

1. To configure audit logging on your Qumulo cluster, use the `qq audit_set_syslog_config --enable` command, use the `--json` flag to request logging in JSON format, and specify the IP address or hostname and port number for your Qumulo Broker machine. For example:

   ```bash
   qq audit_set_syslog_config \
     --enable \
     --json \
     --server-address {{site.exampleIP1}} \
     --server-port 514
   ```
   
   Qumulo Core enables audit logging for your cluster.
   
1. To confirm the audit logging configuration for your cluster, use the `qq audit_get_syslog_config` command.

   In the following example output from the command, audit logging is enabled in JSON format.
   
   ```json
   {
     "enabled": true,
     "format": "json",
     "local_enabled": false,
     "server_address": "{{site.exampleIP1}}",
     "server_port": 514
   }
   ```
   
1. To confirm the connection between the Qumulo Broker and the rsyslog instance, use the `qq audit_get_syslog_status` command.

   The command returns one of three possible values for the `connection_status` field:

   * `AUDIT_LOG_CONNECTED`: The rsyslog instance is connected to your Qumulo Broker machine and all audit log messages are being transferred correctly.

   * `AUDIT_LOG_DISCONNECTED`: The rsyslog instance is disconnected from your Qumulo Broker. Your Qumulo cluster is configured to buffer all outgoing audit log messages until it fills its buffer. When the rsyslog instance reconnects to your Qumulo Broker the cluster attempts to send all buffered messages.
     
     {{site.data.alerts.caution}}
     <ul>
       <li>When the message buffer fills up, Qumulo Core discards all new messages. To change the buffer size, configure rsyslog parameters.</li>
       <li>If a power outage or cluster reboot occurs while Qumulo Core is waiting to send its messages, all unsent messages are lost.</li>
     </ul>
     {{site.data.alerts.end}}

   * `AUDIT_LOG_DISABLED`: Audit logging has been disabled explicitly for this Qumulo cluster.

<a id="configure-rsyslog-communication"></a>
## Step 4: Configure rsyslog to Communicate with Qumulo Broker
This section explains how to configure rsyslog on the Qumulo Broker machine.

{% include important.html content="Before you restart the rsyslog service to apply a new configuration, you must always [ensure that Qumulo Broker is deployed](#deploy-qumulo-broker)." %}

1. Change the file permission of the Qumulo Broker binary file.

   ```bash
   chmod a+x /opt/qumulo/QumuloBroker/events/Broker
   ```

<a id="rsyslog-with-single-cluster"></a>
### Configuring rsyslog to Communicate with a Single Cluster
Configure the following rsyslog parameters in the `/etc/rsyslog.d/10-qumulo.conf` file.

The following complete, annotated configuration file lets rsyslog on the Qumulo Broker machine communicate with a single Qumulo cluster.

```
# PARSE AND PUBLISH QUMULO AUDIT LOGS

# TCP connection for receiving audit logs
module(load="imtcp")
input(type="imtcp" port="514")

# To let rsyslog use standard input (to pass messages to an external 
# script that parses and performs custom processing on audit log data),
# load the omprog syslog module.
module(load="omprog")

if ($app-name startswith "qumulo") then {
  # If the log show an issue related to audit log operations, uncomment
  # the following line and restart the resyslog service.
  # action(type="omfile" file="/var/log/qumulo_audit.log")
  action(
    # Invoke the omprog module
    type="omprog" 
    name="QumuloLog"
    
    # The full path and any CLI parameters for the external script
    binary="/opt/qumulo/QumuloBroker/events/Broker"
         
    # The queue type to use
    queue.type="LinkedList"

    # The maximum queue size (100,000 messages)
    # Tip: To configure rsyslog to communicate with multiple Qumulo 
    #      clusters, set this value to 200,000.
    queue.size="100000"
            
    # When enabled, the system saves data while shutting down
    queue.saveOnShutdown="on"

    # The maximum number of worker threads that can run in parallel
    # Tip: To configure rsyslog to communicate with multiple Qumulo
    #      clusters, set this value to 16.
    queue.workerThreads="8"

    # The number of messages that a worker thread processes before 
    # rsyslog creates another worker thread. For example, if you set 
    # queue.workerThreads to 200 and there are 201 messages in the 
    # queue, rsyslog creates a second worker thread.
    # Note: The queue.workerThreads parameter limits the maximum 
    #       value of the queue.size parameter.
    queue.workerThreadMinimumMessages="10000"
    
    # The interval after which the system retries the action, 30
    # seconds by default. If multiple retries fail, in order to prevent
    # the excessive resource use, the system extends the interval
    # automatically by using a specific formula.
    # Note: The suspension interval increases as the number of
    #       retries increases.
    action.resumeInterval="10"
            
    # The location where the system stores the output of the
    # publisher script for system troubleshooting.
    output="/var/log/varonis_publisher.log"
  )
  stop
} else
  action(type="omfile" file="/dev/null")
```

<a id="rsyslog-with-multiple-clusters"></a>
### Configuring rsyslog to Communicate with Multiple Clusters
The `queue.size` and `queue.workerThreads` rsyslog parameters in [the `/etc/rsyslog.d/10-qumulo.conf` file](#rsyslog-with-single-cluster) let rsyslog on the Qumulo Broker machine communicate with multiple Qumulo clusters.

* `queue.size`: Set the maximum size of the queue to 200,000 messages

* `queue.workerThreads`: Set the maximum number of worker threads that can run in parallel to 16 threads

{{site.varonis.restartRsyslog}}

{{site.varonis.statusRsyslog}}
