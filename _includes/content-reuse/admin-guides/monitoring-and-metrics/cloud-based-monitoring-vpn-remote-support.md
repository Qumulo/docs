{% if page.platform == 'on-prem' %}
{% include important.html content="To let the Qumulo Care Team provide fast support when you need it most, we strongly recommend enabling both Cloud-Based Monitoring and VPN Remote Support." %}
{% endif %}


## How Cloud-Based Monitoring Works
Cloud-Based Monitoring (which includes Nexus Monitoring functionality) sends telemetry data to Qumulo to allow the Qumulo Care Team to monitor your Qumulo cluster proactively. {{site.tlsEncrypt}}

{% include important.html content="Cloud-Based Monitoring and Nexus Monitoring _don't_ collect file names, path names, client IP addresses, or account credentials." %}

We use a proprietary application that aggregates diagnostic cluster data and alerts the Qumulo Care Team if an issue arises. Depending on the issue severity and cluster state, a member of the Qumulo Care Team reaches out. For more information, see:

* [Qumulo Care Response Times](https://docs.qumulo.com/contacting-qumulo-care-team.html#qumulo-care-response-times)

* [Ways to Get Help](https://docs.qumulo.com/contacting-qumulo-care-team.html#ways-to-get-help)


{% if page.platform == 'on-prem' %}
## How VPN Remote Support Works
VPN Remote Support lets the Qumulo Care Team access your Qumulo cluster solely to assist you with running a software update, performing diagnostics, or troubleshooting your cluster. {{site.tlsEncrypt}}

When you install VPN keys in the `/etc/openvpn` directory, an authorized member of the Qumulo Care Team uses SSH to connect to the `ep1.qumulo.com` server and then uses SSH through a secure VPN connection to connect to your cluster (normally, this VPN connection is closed).

By default, the VPN tunnel remains open for four hours to allow members of the Qumulo Care Team to run remote debugging commands on your cluster. You can configure the connection period and enable or disable VPN Remote Support at any time.

{{site.data.alerts.note}}
<ul>
  <li>Currently, Qumulo Core doesn't support VPN connections with IPv6.</li>
  <li>The VPN tunnel isn't required to upload logs to <code>monitor.qumulo.com</code> or to a secure Amazon S3 bucket or to send diagnostic data to a private Amazon EC2 instance for analysis.</li>
</ul>
{{site.data.alerts.end}}
{% endif %}


## What Data Gets Sent to Qumulo
Cloud-Based Monitoring {% if page.platform == 'on-prem'%}and VPN Remote Support let{% else %}lets{% endif %} your cluster send the following detailed diagnostic data to Qumulo through an encrypted connection.

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


{% unless page.platform == 'anq' %}
## Prerequisites
Before you can use Cloud-Based Monitoring{% if page.platform == 'on-prem'%} and VPN Remote Support:{% elsif page.platform contains 'cnq-' %}, you must enable the following destination hostnames for TCP on port 443:{% endif %}
{% if page.platform == 'on-prem' %}
* A member of the Qumulo Care Team must install VPN keys on your Qumulo cluster

* You must enable TCP traffic on port 443 for the following hostnames:
{% endif %}
  <table>
    <thead>
      <tr>
        <th style="width:40%">Hostname</th>
        <th>Description</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><code>api.missionq.qumulo.com</code></td>
        <td>Cloud-Based Monitoring connectivity</td>
      </tr>  
      <tr>
        <td><code>monitor.qumulo.com</code></td>
        <td>Cloud-Based Monitoring log uploads</td>
      </tr>
      <tr>
        <td><code>api.nexus.qumulo.com</code></td>
        <td>Nexus Monitoring connectivity</td>
      </tr>
{% if page.platform == 'on-prem' %}
      <tr>
        <td><code>ep1.qumulo.com</code></td>
        <td>
          <p>VPN Remote Support</p>
          {% include important.html content="If your organization has an intrusion detection device or a firewall that performs SSL or HTTPS deep-packet inspection, you must add an exception to the IP address that resolves to `ep1.qumulo.com`. To identify this IP address, log in to a node in your Qumulo cluster and run the `nslookup ep1.qumulo.com` command." %}
        </td>
      </tr>
      <tr>
        <td><code>missionq-dumps.s3.amazonaws.com</code></td>
        <td>Proxy Forwarding networking configuration</td>
      </tr>
{% endif %}
    </tbody>
  </table>

## Enabling Cloud-Based Monitoring {#enabling-cloud-based-monitoring}
{% if page.platform contains == 'cnq-' %}Cloud-Based Monitoring is enabled for you by default. If you have disabled Cloud-Based Monitoring, you can enable it{% else %}You can enable Cloud-Based Monitoring{% endif %} by using the Qumulo Core Web UI or the `qq` CLI.

### To Enable Cloud-Based Monitoring by Using the Qumulo Core Web UI

1. {{site.logIntoWebUI}}

1. Click **Support > Qumulo Care**.

1. On the **Qumulo Care** page:

   1. In the **Cloud-Based Monitoring** section, click **Edit**.

   1. Click **Yes, I want Qumulo Cloud-Based Monitoring** and then click **Save**.

{{site.monitoring.cloudBasedMonitoringEnabled}}

### To Enable Cloud-Based Monitoring by Using the qq CLI
Run the {% include qq.html command="set_monitoring_conf" %} command with the `--enabled` flag.

{{site.data.alerts.tip}}
<ul>
  <li>To disable Cloud-Based Monitoring, run the {% include qq.html command="set_monitoring_conf" %} command with the <code>--disabled</code> flag.</li>
  <li>To check the status of Cloud-Based Monitoring, run the {% include qq.html command="monitoring_status_get" %} command.</li>
</ul>
{{site.data.alerts.end}}

{% if page.platform == 'on-prem' %}
## Enabling VPN Remote Support {#enabling-remote-support}
You can enable Remote Support by using the Qumulo Core Web UI or the `qq` CLI.

### To Enable VPN Remote Support by Using the Qumulo Core Web UI

1. {{site.logIntoWebUI}}

1. Click **Support > Qumulo Care**.

1. On the **Qumulo Care** page:

   1. In the **Remote Support** section, click **Edit**.
   
   1. Under **Do you want to enable Qumulo Remote Support?**, click **Yes** and then click **Save**.
   
{{site.monitoring.cloudBasedMonitoringEnabled}}

### To Enable VPN Remote Support by Using the qq CLI
Run the {% include qq.html command="set_monitoring_conf" %} command with the `--vpn-enabled` flag.

{{site.data.alerts.tip}}
<ul>
  <li>To disable VPN Remote Support, run the {% include qq.html command="set_monitoring_conf" %} command with the <code>--vpn-disabled</code> flag.</li>
  <li>To check the status of VPN Remote Support, run the {% include qq.html command="monitoring_status_get" %} command.</li>
</ul>
{{site.data.alerts.end}}
{% endif %}
{% endunless %}
