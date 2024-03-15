Depending on the configuration of your Qumulo cluster, you can grant full access, read-only access, deny specific hosts, or deny all access. It is also possible to configure a Qumulo cluster to prevent shares which a client can't access from being enumerated.

{% include important.html content="Because host restrictions interact with user or group share permissions and file permissions on the basis of _least privilege_, in order for Qumulo Core to grant a privilege for a particular file, the file's permissions, the share's user permissions, and the share's host permissions must _all_ permit the privilege." %}

Host restrictions apply in the order in which you write them, from top to bottom. For example, if you deny a privilege to a host at the beginning of the permission list, and a later entry allows the same privilege to the same host, Qumulo Core doesn't grant the privilege.

## How SMB Host Restriction Precedence Works
When you create or modify an SMB share, you can use one of the following SMB host restrictions, listed here in order of precedence.

{{site.data.alerts.important}}
<ul>
  <li>If you don't specify any of the following restrictions, the SMB share gives all hosts full control</li>
  <li>If you specify one of the following restrictions, the SMB share denies access to any hosts that you don't specify.</li>
  <li>If you specify multiple addresses or ranges, separate them by using <em>spaces</em>.</li>
</ul>
{{site.data.alerts.end}}

1. **Deny All Access**
   
1. **Deny Specific Hosts:** IP address ranges to which Qumulo Core denies access to this share, regardless of other permissions

1. **Permit Read-Only Access:** IP address ranges to which Qumulo Core permits only read-only access

1. **Full Access:** IP address ranges to which Qumulo Core permits full access

   {% include important.html content="The file's permissions and the share's user permissions must also grant full access." %}

<a id="hiding-an-smb-share"></a>
## Managing SMB Host Restrictions by Using the qq CLI
For information about viewing, modifying, and removing host restrictions and hiding SMB shares from unauthorized hosts by using the `qq` CLI, see the following sections in the {{site.guides.cli}}:

* {% include qq.html command="smb_add_share" %}

* {% include qq.html command="smb_list_share" %}

* {% include qq.html command="smb_mod_share" %}

* {% include qq.html command="smb_modify_settings" %}

  {% include tip.html content="To hide an SMB share in the Web UI, append `$` to its name. To access the share, you must use the fully qualified domain name (FQDN). For example: `\\storage.example.com\MyShare$`." %}
