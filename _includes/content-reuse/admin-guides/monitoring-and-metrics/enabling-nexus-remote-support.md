{% if page.platform contains 'cnq-' %}
{% include important.html content="To let the Qumulo Care Team provide fast support when you need it most, we strongly recommend enabling Nexus Remote Support." %}
{% else %}
{% include important.html content="This support method is currently most relevant to the CNQ platform. Cloud-Based Remote Support is still strongly recommended to provide fast support where available." %}
{% endif %}

## How Nexus Remote Support Works
[Enabling Nexus Remote Support](#enabling-nexus-remote-support) lets the Qumulo Care Team access your Qumulo cluster to assist you with diagnostics or troubleshooting.

When you register your cluster with Nexus, your cluster establishes an encrypted, outgoing connection to Nexus that securely allows the Nexus application to interact with the cluster's API.

Nexus uses asymmetric keys to securely make requests to your cluster's API. During registration, a public key is registered on your cluster while Nexus retains the private key. Your cluster uses the public key to authenticate API requests from Nexus.

### Access Control and RBAC Roles

The level of API access available to the support team through Nexus is controlled by role-based access control (RBAC) roles on the cluster. 

When you register your cluster with Nexus, Qumulo Core automatically creates a role assignment that grants the Qumulo Care Team access through the predefined `Qumulo-Support` role. 
For detailed information about the `Qumulo-Support` role and the complete list of privileges granted during registration, see 
[Managing Role-Based Access Control (RBAC) in Qumulo Core](../authorization-qumulo-core/managing-role-based-access-control-rbac.html#qumulo-support).

{% include note.html content="File-level data access is not included in the default `Qumulo-Support` role." %}

You can customize the privileges available to the support team by configuring and assigning an custom RBAC role with a different set of privileges.

{% include important.html content="The support team can't configure these privileges unless you explicitly grant this permission by using a custom RBAC role." %}


## Prerequisites
Before you can use Nexus Remote Support:

* You must have a Nexus registration key. For more information, see [Generating an Instance Registration Key for Nexus Remote Support](../../qumulo-nexus-configuration-guide/register-nexus-support.html).

* You must enable TCP traffic on port 443 to the following hostname:

  <table>
    <thead>
      <tr>
        <th style="width:40%">Hostname</th>
        <th>Description</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><code>api.nexus.qumulo.com</code></td>
        <td>Nexus monitoring and remote support connectivity</td>
      </tr>
    </tbody>
  </table>


<a id="enabling-nexus-remote-support"></a>
## Enabling Nexus Remote Support
You can enable Nexus Remote Support by using the `qq` CLI.

### To Enable Nexus Remote Support by Using the qq CLI
{% include note.html content="You must generate a [Nexus registration key](../../qumulo-nexus-configuration-guide/register-nexus-support.html) to enable Nexus Remote Support." %}

* To enable Nexus Remote Support, run the `qq set_monitoring_conf --nexus-enabled --nexus-registration-key "<my_key>"` command.

  Replace `<my_key>` with your Nexus registration key.

* To disable Nexus Remote Support, run the `qq set_monitoring_conf --nexus-disabled` command.

## Limits
* Currently, HTTP proxy support is unavailable.

* When the Qumulo REST API is unavailable (for example, if your Qumulo cluster is out of quorum), the Qumulo Care Team can't use Remote Support to help troubleshoot issues with your cluster.
