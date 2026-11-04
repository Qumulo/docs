When your Qumulo cluster is [joined to AD](kerberos-prerequisites-joining-cluster-active-directory.html), you must configure the [NFSv4.1 server](../nfs/nfsv4.1-enabling-using.html) and NFSv4.1 security settings.

## To Configure Security Settings by Using the qq CLI
Qumulo provides configuration for the permitted NFSv4.1 authentication flavors in the `qq` CLI or directly through the Qumulo REST API.

1. Run the {% include qq.html command="nfs_get_settings" %} command to get the current settings.

   {{site.exampleOutput}}

   ```bash
   qq nfs_get_settings
   ```

   {{ site.exampleOutput }}

   ```json
   {
     "auth_sys_enabled": true,
     "krb5_enabled": true,
     "krb5p_enabled": true,
     "krbi_enabled": true,
     "v4_enabled": false
   }
   ```

   This is the default configuration:
   * NFSv4.1 is disabled by default.
   * `AUTH_SYS`, `AUTH_KRB5`, `AUTH_KRB5P`, and `AUTH_KRB5I` are enabled by default (however, Qumulo Core doesn't support Kerberos configuration on NFSv3).

1. To harden security, configure your cluster to use only Kerberos by disabling `AUTH_SYS` (without changing `AUTH_KRB5`). For example:

   {% include important.html content="Because it uses authentication based on a simple UID and GID passed over the wire in plain text, RPC `AUTH_SYS` is inherently insecure. In a trusted environment, `AUTH_SYS` might be sufficient for enforcing basic permissions and preventing good-faith actors from making mistakes. In all other cases, you must treat `AUTH_SYS` as if it provides _no security whatsoever_." %}

   ```bash
   qq nfs_modify_settings --disable-auth-sys
   ```

   {{ site.exampleOutput }}

   ```json
   {
     "v4_enabled": false,
     "auth_sys_enabled": false,
     "auth_krb5_enabled": true,
     "auth_krb5p_enabled": true,
     "auth_krb5i_enabled": true
   }
   ```
1. (Optional) You can also use the following flags with the {% include qq.html command="nfs_modify_settings" %} command.

    <table>
      <thead>
        <tr>
          <th>Command</th>
          <th>Description</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td><code>--enable-auth-sys</code></td>
          <td>Enables <code>AUTH_SYS</code> without changing <code>AUTH_KRB5</code></td>
        </tr>
        <tr>
          <td><code>--enable-krb5</code></td>
          <td>Enables <code>AUTH_KRB5</code> without changing <code>AUTH_SYS</code></td>
        </tr>
        <tr>
          <td><code>--enable-krb5p</code></td>
          <td>Enables <code>AUTH_KRB5P</code> without changing <code>AUTH_SYS</code></td>
        </tr>
        <tr>
          <td><code>--enable-krb5i</code></td>
          <td>Enables <code>AUTH_KRB5I</code> without changing <code>AUTH_SYS</code></td>
        </tr>
        <tr>
          <td><code>--enable-v4</code></td>
          <td>Enables NFSv4.1</td>
        </tr>
        <tr>
          <td><code>--disable-v4</code></td>
          <td>Disables NFSv4.1</td>
        </tr>
        <tr>
          <td><code>--disable-krb5</code></td>
          <td>Disables <code>AUTH_KRB5</code> without changing <code>AUTH_SYS</code></td>
        </tr>
        <tr>
          <td><code>--disable-krb5p</code></td>
          <td>Disables <code>AUTH_KRB5P</code> without changing <code>AUTH_SYS</code></td>
        </tr>
        <tr>
          <td><code>--disable-krb5i</code></td>
          <td>Disables <code>AUTH_KRB5I</code> without changing <code>AUTH_SYS</code></td>
        </tr>
      </tbody>
    </table>

{{site.data.alerts.note}}
<ul>
  <li>Security configuration options apply to <em>all</em> versions of NFS (NFSv3 and NFSv4.1). Thus, disabling <code>AUTH_SYS</code> also disables NFSv3, because <code>AUTH_SYS</code> is the only <a href="../kerberos/kerberos-with-qumulo-core.html#choosing-a-kerberos-security-flavor">Kerberos security flavor</a> that NFSv3 supports by design.</li>
  <li>In a secure environment, where Kerberos is required, <code>AUTH_SYS</code> NFSv3 connections aren't allowed.</li>
  <li>These configuration options apply cluster-wide to all NFS exports and files.</li>
</ul>
{{site.data.alerts.end}}


## Configuring Export Configuration
You can use [NFSv4.1 exports](../nfs/nfsv4.1-enabling-using.html) to configure access to the Qumulo file system.

The user-mapping portion of the export configuration has no effect on Kerberos configuration. Specifying `root` or `any` user mapping for a particular export applies only to `AUTH_SYS` mounts that access this export.

Otherwise, exports and IP address restrictions (that you specify in exports) behave identically for all [Kerberos security flavors](../kerberos/kerberos-with-qumulo-core.html#choosing-a-kerberos-security-flavor): `AUTH_SYS`, `AUTH_KRB5`, `AUTH_KRB5P`, and `AUTH_KRB5I`.
