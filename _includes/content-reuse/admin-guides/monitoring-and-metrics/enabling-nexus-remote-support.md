{% if page.platform contains 'cnq-' %}
  {% include important.html content="To let the Qumulo Care Team provide fast support when you need it most, we strongly recommend enabling Nexus Remote Support." %}
{% elsif page.platform == 'on-prem' %}
  {% include note.html content="To let the Qumulo Care Team provide you with the best support experience, we recommend enabling Nexus Remote Support for on-premises clusters in addition to VPN Remote Support." %}
{% endif %}


## How Nexus Remote Support Works
Nexus Remote Support lets the Qumulo Care Team access your Qumulo cluster solely to assist you with running a software update, performing diagnostics, or troubleshooting your cluster. {{site.tlsEncrypt}}

When you register your Qumulo cluster with Nexus, the system creates a public-private key pair (your cluster holds the public key and Nexus holds the private key). Qumulo Core uses the public key to establish an encrypted outgoing connection that authenticates REST API operations from Nexus securely.

{{site.data.alerts.note}}
<ul>
  <li>When the Qumulo REST API is unavailable (for example, if your Qumulo cluster is out of quorum), the Qumulo Care Team can't use Nexus Remote Support to troubleshoot issues with your cluster. In this type of scenario, {{site.contactQumuloCare}} for assistance.</li>
  <li>Nexus Remote isn't compatible with HTTP proxies.</li>
</ul>
{{site.data.alerts.end}}


## Enabling Nexus Remote Support
To enable Nexus Remote Support for your Qumulo cluster, you must [create a registration key in Nexus and then register the key by using the `qq` CLI](https://docs.qumulo.com/qumulo-nexus-configuration-guide/enabling-nexus-remote-support.html).
