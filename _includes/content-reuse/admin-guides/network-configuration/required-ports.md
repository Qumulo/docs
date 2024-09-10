{% if page.platform == 'on-prem' or page.platform == 'aws' %}
{{site.data.alerts.note}}
<ul>
  <li>Communication <em>between</em> nodes in a cluster must be possible on any port.</li>
  <li>{{page.varADauth}}</li>
</ul>
{{site.data.alerts.end}}
{% else %}
{{site.data.alerts.note}}{{page.varADauth}}{{site.data.alerts.end}}
{% endif %}

## Networking Ports for Inbound Connections

<table>
  <thead>
    <tr>
      <th>Port</th>
      <th>Protocols</th>
      <th>Use</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>21</td>
      <td>TCP</td>
      <td>FTP</td>
    </tr>
{% if page.platform == 'on-prem' or page.platform == 'aws' %}
    <tr>
      <td>22</td>
      <td>TCP</td>
      <td>SSH</td>
    </tr>
{% endif %}    
    <tr>
      <td>80</td>
      <td>TCP</td>
      <td>HTTP (Web UI)</td>
    </tr>
    <tr>
      <td>111</td>
      <td>TCP<br>UDP</td>
      <td>
        <code>rpcbind</code> or <code>portmapper</code> for NFSv3
      </td>
    </tr>
    <tr>
      <td>443</td>
      <td>TCP</td>
      <td>HTTPS (Web UI)</td>
    </tr>
    <tr>
      <td>445</td>
      <td>TCP</td>
      <td>SMB</td>
    </tr>
    <tr>
      <td>2049</td>
      <td>TCP<br>UDP</td>
      <td>
        <p>NFS or MOUNT</p>
        <p>
          {% include note.html content="Qumulo Core supports UDP for the MOUNT protocol for older clients. However, any NFS clients&mdash;that specify the TCP mount option or transfer data over NFS after mounting&mdash;don't use UDP." %}
        </p>
      </td>
    </tr>
    <tr>
      <td>3712</td>
      <td>TCP</td>
      <td>Replication</td>
    </tr>
    <tr>
      <td>8000</td>
      <td>TCP</td>
      <td>REST API</td>
    </tr>
    <tr>
      <td>9000</td>
      <td>TCP</td>
      <td>S3 API, if you <a href="../s3-api/configuring-using-s3-api.html">enable the S3 API for your Qumulo cluster</a></td>
    </tr>
    <tr>
      <td>32768-60999</td>
      <td>TCP</td>
      <td>FTP Passive Mode</td>
    </tr>
  </tbody>
</table>

## Networking Ports for Outbound Connections

{% if page.platform == 'on-prem' %}
{{site.data.alerts.note}}
For cluster formation and inter-node communication Qumulo Core requires unblocked IPv6 traffic in the local subnet&mdash;for more information, see <a href="../network-configuration/configuring-ipv6.html">Configuring IPv6 in Qumulo Core</a>.
{{site.data.alerts.end}}
{% else %}
{{site.data.alerts.note}}
For cluster formation and inter-node communication, Qumulo Core requires unblocked IPv4 traffic in the local subnet.
{{site.data.alerts.end}}
{% endif %}

<table>
  <thead>
    <tr>
      <th>Port</th>
      <th>Protocols</th>
      <th>Use</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>53</td>
      <td>UDP</td>
      <td>DNS</td>
    </tr>
    <tr>
      <td>88</td>
      <td>TCP</td>
      <td>Kerberos</td>
    </tr>
    <tr>
      <td>111</td>
      <td>TCP</td>
      <td>
        <p>
          <code>rpcbind</code> or <code>portmapper</code> for NSM and NLM
        </p>
        <p>
          {% include note.html content="Depending on the client <code>portmapper</code> configuration, Qumulo Core might require additional ports." %}
        </p>
      </td>
    </tr>
    <tr>
      <td>123</td>
      <td>UDP</td>
      <td>Synchronization of product and network time, for authentication and timestamping of artifacts such as audit logs, by using the Network Time Protocol (NTP).</td>
    </tr>
    <tr>
      <td>135</td>
      <td>TCP</td>
      <td>DCERPC or Netlogon (Domain Controller Binding)</td>
    </tr>
    <tr>
      <td>389,<br>636</td>
      <td>TCP</td>
      <td>LDAP to Active Directory or to a standalone LDAP server (by default)</td>
    </tr>
    <tr>
      <td>443</td>
      <td>TCP</td>
      <td>Qumulo Shift for Amazon S3 (by default)</td>
    </tr>
    <tr>
      <td>514</td>
      <td>TCP</td>
      <td>Audit with <code>Rsyslog</code> (by default)</td>
    </tr>
    <tr>
      <td>3712</td>
      <td>TCP</td>
      <td>Replication (by default)</td>
    </tr>
  </tbody>
</table>
