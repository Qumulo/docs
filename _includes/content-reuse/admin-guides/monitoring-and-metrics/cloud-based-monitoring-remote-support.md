{% if page.platform == 'on-prem' %}
{% include important.html content="To let the Qumulo Care team provide fast support when you need it most, we strongly recommend enabling both Cloud-Based Monitoring and Remote Support." %}
{% endif %}


## How Cloud-Based Monitoring Works
[Enabling Cloud-Based Monitoring](#enabling-cloud-based-monitoring) lets the Qumulo Care team monitor your Qumulo cluster proactively.

{% include important.html content="Cloud-Based Monitoring _doesn't_ collect file names, path names, client IP addresses, or account credentials." %}

We use a proprietary application that aggregates diagnostic cluster data and alerts the Qumulo Care team if an issue arises. Depending on the issue severity and cluster state, a member of the Qumulo Care team reaches out. For more information, see:

* [Qumulo Care Response Times](https://docs.qumulo.com/contacting-qumulo-care-team.html#qumulo-care-response-times)

* [Ways to Get Help](https://docs.qumulo.com/contacting-qumulo-care-team.html#ways-to-get-help)


## How Remote Support Works
[Enabling Remote Support](#enabling-remote-support) lets the Qumulo Care team access your Qumulo cluster solely to assist you with a software update or perform diagnostics or troubleshooting on your cluster from the command line.

When you install VPN keys in the `/etc/openvpn` directory, an authorized member of the Qumulo Care team uses SSH to connect to the `ep1.qumulo.com` server and then uses SSH through a secure VPN connection to connect to your cluster (normally, this VPN connection is closed).

By default, the VPN tunnel remains open for four hours to allow members of the Qumulo Care team to perform operations such as uploading logs to `monitor.qumulo.com` or to a secured Amazon S3 bucket and sending diagnostic data to a private Amazon EC2 instance for analysis.

{% include note.html content="Currently, Qumulo Core doesn't support VPN connections with IPv6." %}

You can configure the connection period and enable or disable Remote Support at any time.


## What Data Gets Sent to Qumulo

Cloud-Based Monitoring and Remote Support let your cluster send the following detailed diagnostic data to Qumulo through an encrypted connection.

* Cluster name

* Number of nodes in cluster

* Hardware and software incidents

  * Drives

    * CRC errors

    * S.M.A.R.T. status alerts

    * Capacity triggers
  
  * Nodes

    * PSU failure

    * Fan failure

    * Recused node

    * Offline node

    * Unreachable cluster

  * Qumulo Core

    * New process core dump

* Configuration data (such as users, groups, SMB shares, and NFS exports)

* Logs, stack traces, and code dumps


## Prerequisites
Before you can use Cloud-Based Monitoring and Remote Support:

* A member of the Qumulo Care Team must install VPN keys on your Qumulo cluster

* You must enable the following destination hostnames for TCP on port 443

  <table>
    <thead>
      <tr>
        <th width="40%">Hostname</th>
        <th>Description</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><code>api.nexus.qumulo.com</code></td>
        <td>Nexus monitoring</td>
      </tr>  
      <tr>
        <td><code>ep1.qumulo.com</code></td>
        <td>
          <p>Remote Support</p>
          {% include important.html content="If your organization has an intrusion detection device or a firewall that performs SSL or HTTPS deep-packet inspection, you must add an exception to the IP address that resolves to `ep1.qumulo.com`. To identify this IP address, log in to your Qumulo cluster and run the `nslookup ep1.qumulo.com` command." %}
        </td>
      </tr>
      <tr>
        <td><code>api.missionq.qumulo.com</code></td>
        <td>Cloud-Based Monitoring connectivity</td>
      </tr>  
      <tr>
        <td><code>missionq-dumps.s3.amazonaws.com</code></td>
        <td>Proxy forwarding</td>
      </tr>
      <tr>
        <td><code>monitor.qumulo.com</code></td>
        <td>Cloud-Based Monitoring log uploads</td>
      </tr>
    </tbody>
  </table>

<a id="enabling-cloud-based-monitoring"></a>
## Enabling Cloud-Based Monitoring
{% if page.platform == 'aws' %}Cloud-Based Monitoring is enabled for you by default. If you have disabled Cloud-Based Monitoring, you can enable it{% else %}You can enable Cloud-Based Monitoring{% endif %} by using the Qumulo Core Web UI or `qq` CLI.

### To Enable Cloud-Based Monitoring by Using the Qumulo Core Web UI

1. {{site.logIntoWebUI}}

1. Click **Support > Qumulo Care**.

1. On the **Qumulo Care** page:

   1. In the **Cloud-Based Monitoring** section, click **Edit**.

   1. Click **Yes, I want Qumulo Cloud-Based Monitoring** and then click **Save**.

{{site.monitoring.cloudBasedMonitoringEnabled}}

### To Enable Cloud-Based Monitoring by Using the qq CLI

* To enable Cloud-Based Monitoring, run the `qq set_monitoring_conf --enabled` command.

* To disable Cloud-Based Monitoring, run the `qq set_monitoring_conf --disabled` command.

* To check the status of Cloud-Based Monitoring, run the `qq monitoring_conf` command.


<a id="enabling-remote-support"></a>
## Enabling Remote Support
{% if page.platform == 'aws' %}Remote Support is enabled for you by default. If you have disabled Remote Support, you can enable{% else %}You can enable Remote Support{% endif %} by using the Qumulo Core Web UI or `qq` CLI.

### To Enable Remote Support by Using the Qumulo Core Web UI

1. {{site.logIntoWebUI}}

1. Click **Support > Qumulo Care**.

1. On the **Qumulo Care** page:

   1. In the **Remote Support** section, click **Edit**.
   
   1. Under **Do you want to enable Qumulo Remote Support?**, click **Yes** and then click **Save**.
   
{{site.monitoring.cloudBasedMonitoringEnabled}}

### To Enable Remote Support by Using the qq CLI

* To enable Remote Support, run the `qq set_monitoring_conf --vpn-enabled` command.

* To disable Remote Support, run the `qq set_monitoring_conf --vpn-disabled` command.

* To check the status of Remote Support, run the `qq set_monitoring_conf` command.
