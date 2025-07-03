To confirm the settings for your cluster from the Qumulo Core Web UI, click **Sharing > SMB Shares > SMB Settings**. By default, Qumulo Core supports AES-128-GCM and AES-128-CCM encryption, sets cluster-level SMB encryption to **None** and share-level encryption to **Unencrypted**.

For all clusters created by using Qumulo Core 3.1.5 (and higher), [Qumulo Core enables at-rest encryption automatically](/administrator-guide/encryption-data-security/managing-encryption-at-rest.html).

{{site.data.alerts.note}}
<ul>
  <li>{{page.varClientDecision}}</li>
  <li>It isn't necessary to use signing as a share-level protection mechanism if you set <strong>Require Encryption</strong> for a specific SMB share or if you configure cluster-level SMB encryption.</li>
</ul>
{{site.data.alerts.end}}


## How Cluster-Level and Share-Level Encryption Settings Interact in Qumulo Core
The following table explains the possible levels of encryption of clusters and shares and the relationships between them.

<table>
  <thead>
    <tr>
      <th style="width:33%;">
        <strong>Cluster Encryption Level</strong>
      </th>
      <th style="width:33%;">
        <strong>Unencrypted Share</strong>
      </th>
      <th style="width:33%;">
        <strong>Encrypted Share</strong>
      </th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>No Encryption</td>
      <td>Clients can send unencrypted or encrypted packets</td>
      <td>
        <ul>
          <li>Clients must send encrypted packets</li>
          <li>Unencrypted clients are disconnected</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td>Prefer Encryption</td>
      <td>Client can send unencrypted or encrypted packets.</td>
      <td>
        <ul>
          <li>Clients must send encrypted packets</li>
          <li>Unencrypted clients are disconnected</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td>Require Encryption</td>
      <td>
        <ul>
          <li>Clients must send encrypted packets</li>
          <li>Unencrypted clients are disconnected</li>
        </ul>
      </td>
      <td>
        <ul>
          <li>Clients must send encrypted packets</li>
          <li>Unencrypted clients are disconnected</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>


## Configuring Cluster-Level and Share-Level Encryption
This section explains how to configure cluster-level encryption in Qumulo Core by using the Qumulo Core Web UI and `qq` CLI and how to configure share-level encryption by using the `qq` CLI.

### To Configure Cluster-Level Encryption by Using the Qumulo Core Web UI

1. {{site.logIntoWebUI}}

1. Click **Cluster > SMB Settings**.

1. On the **SMB Settings** page, select an encryption level.

   The Qumulo Core Web UI shows any unencrypted shares on your cluster.

1. Click **Configure SMB**.

### To Configure Cluster-Level and Share-Level Encryption by Using the qq CLI

For information about configuring cluster-level and share-level encryption by using the `qq` CLI, see the following sections in the {{site.guides.cli}}.

* **Cluster-Level Encryption:** {% include qq.html command="smb_modify_settings" %}

* **Share-Level Encryption:** {% include qq.html command="smb_mod_share" %}


## Disabling SMB3 Negotiation to Improve Workload Performance
{{page.varClientDecision}} In certain scenarios, compared to unencrypted configurations, while workflows triggered by pipelines can experience a slight performance degradation, synchronized operations can experience a more significant drop in performance.

To avoid potential performance impact, you can prohibit Qumulo Core from advertising its encryption capabilities by turning off SMB3 negotiation.

For more information, see {% include qq.html command="smb_modify_settings" %} in the {{site.guides.cli}}.


## Checking Encryption of SMB3 Session
To check whether an SMB3 client session is encrypted, run the `Get-SmbConnection` PowerShell command. For example:

```bat
Get-SmbConnection | Select-Object -property *
```

{{site.exampleOutput}}

```
SmbInstance : Default
ContinuouslyAvailable : False
Credential : SILENCE\jcage
Dialect : 3.0
Encrypted : False
NumOpens : 2
Redirected : False
ServerName : qq
ShareName : Files
Signed : True
UserName : SILENCE\jcage
PSComputerName :
CimClass : ROOT/Microsoft/Windows/SMB:MSFT_SmbConnection
CimInstanceProperties : {ContinuouslyAvailable, Credential, Dialect, Encrypted...}
CimSystemProperties : Microsoft.Management.Infrastructure.CimSystemProperties
```
