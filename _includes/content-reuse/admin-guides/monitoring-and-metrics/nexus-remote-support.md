{% if page.platform contains 'cnq-' %}
{% include important.html content="To let the Qumulo Care team provide fast support when you need it most, we strongly recommend enabling Nexus Remote Support." %}
{% else %}
{% include important.html content="This support method is currently most relevant to the CNQ platform. Cloud-Based Remote Support is still strongly recommended to provide fast support where available." %}
{% endif %}

## How Nexus Remote Support Works
[Enabling Nexus Remote Support](#enabling-nexus-remote-support) lets the Qumulo Care team access your Qumulo cluster to assist you with diagnostics or troubleshooting.

When you register your cluster with Nexus, your cluster establishes an encrypted, outgoing connection to Nexus that securely allows the Nexus application to interact with the cluster's API.

### Access Control and RBAC Roles

The level of API access available to the support team through Nexus is controlled by role-based access control (RBAC) roles on the cluster. A default role called `Qumulo-Support` is preconfigured on your cluster. This role provides:

* Read access to most cluster configuration endpoints

* Essential troubleshooting privileges, including:

  * Reboot operations

  * Internal debug operations

  * Querying identity services

{% include important.html content="File-level data access is not included in the default `Qumulo-Support` role." %}

You can customize the privileges available to the support team by configuring and assigning a custom RBAC role with a different privilege profile. 
The support team is unable to configure privileges for you unless you explicitly grant them that privilege through a custom RBAC role.


## Limitations

The following are known limitations with this feature. These limitations will be addressed as the feature is developed further.

* HTTP proxy support is not currently available. 

* The Qumulo Care team doesn't have access through this system to help troubleshoot when the Qumulo API is unavailable (for example, when cluster quorum is down). 



## Prerequisites
Before you can use Nexus Remote Support:

* You must have a Nexus registration key. <!--TODO: Add instructions or link for how/where to obtain the Nexus registration key-->

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

{% include note.html content="You must generate a Nexus registration key to enable Nexus Remote Support." %}

* To enable Nexus Remote Support, run the `qq set_monitoring_conf --nexus-enabled --nexus-registration-key "<my_key>"` command.

  Replace `<my_key>` with your Nexus registration key.

* To disable Nexus Remote Support, run the `qq set_monitoring_conf --nexus-disabled` command.

