{% if page.platform contains 'cnq-' %}
  {% include important.html content="To let the Qumulo Care Team provide fast support when you need it most, we strongly recommend enabling Nexus Remote Support." %}
{% elsif page.platform == 'on-prem' %}
  {% include note.html content="To let the Qumulo Care Team provide you with the best support experience, we recommend enabling Nexus Remote Support for on-premises clusters in addition to VPN Remote Support." %}
{% endif %}


## How Nexus Remote Support Works
Nexus Remote Support lets the Qumulo Care Team access your Qumulo cluster solely to assist you with running a software update, performing diagnostics, or troubleshooting your cluster. {{site.tlsEncrypt}}

When you register your Qumulo cluster with Nexus, the system creates a public-private key pair (your cluster holds the public key and Nexus holds the private key). Qumulo Core uses the public key to establish an encrypted outgoing connection that authenticates REST API operations from Nexus securely.

{{site.nexus.rbacWhenYouReg}} This RBAC role determines the level of REST API access that Nexus gives to the Qumulo Care Team. For more information, see [the Qumulo-Support section in Managing Role-Based Access Control (RBAC) for Users and Groups](../authorization-qumulo-core/managing-role-based-access-control-rbac.html#qumulo-support).

{{site.data.alerts.note}}
<ul>
  <li>When the Qumulo REST API is unavailable (for example, if your Qumulo cluster is out of quorum), the Qumulo Care Team can't use Nexus Remote Support to troubleshoot issues with your cluster. In this type of scenario, {{site.contactQumuloCare}} for assistance.</li>
  <li>Nexus Remote isn't compatible with HTTP proxies.</li>
</ul>
{{site.data.alerts.end}}

## Prerequisites
Before you can use Nexus Remote Support:

* [Create a registration key](https://docs.qumulo.com/qumulo-nexus-configuration-guide/creating-registration-key-nexus-remote-support.html)

* Enable TCP traffic on port 443 for the `api.nexus.qumulo.com` hostname to allow Nexus Monitoring and Nexus Remote Support connectivity


## To Enable Nexus Remote Support by Using the qq CLI
Run the {% include qq.html command="set_monitoring_conf" %} with the `--nexus-enabled` flag and specify your registration key. For example:

```bash
qq set_monitoring_conf \
  --nexus-enabled
  --nexus-registration-key "1A2B3CDEF4"
```

{% capture disableNRS %}To disable Nexus Remote Support, run the {% include qq.html command="set_monitoring_conf" %} command with the `--nexus-disabled` flag.{% endcapture %}
{% include tip.html content=disableNRS %}
