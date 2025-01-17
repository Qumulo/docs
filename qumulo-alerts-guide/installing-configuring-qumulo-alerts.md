---
title: "Installing and Configuring Qumulo Alerts"
summary: "This section explains how to install, start and stop, and configure Qumulo Alerts."
permalink: /qumulo-alerts-guide/installing-configuring-qumulo-alerts.html
redirect_from:
  - /qumulo-alerts-guide/installing-configuring/installing-connecting-to-qumulo-cluster.html
sidebar: qumulo_alerts_guide_sidebar
---

## Prerequisites
This section lists the prerequisites for Qumulo Alerts.

### Firewall Ports
Qumulo Alerts requires the following firewall ports to be open from the Qumulo Alerts instance

| Port                  | Target                                              |
| --------------------- | --------------------------------------------------- |
| `25`, `587`, or `465` | Email server                                        |
| `3000`                | Any client that queries or views Grafana dashboards |
| `8000`                | Qumulo cluster                                      |

### System Requirements
We recommend the following system requirements for Qumulo Alerts.
* 4-core processor
* 16 GB memory
* 500 GB disk space

### Tools
Before you install Qumulo Alerts, make sure you have the following tools:
* [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) (You can also browse the [QumuloAlerts](https://github.com/Qumulo/QumuloAlerts) GitHub repository.)
* [Docker](https://docs.docker.com/get-docker/)
* [Docker Compose Plugin](https://docs.docker.com/compose/install/linux/)

  {% include important.html content="Qumulo Alerts requires the Docker Compose Plugin to operate correctly." %}

### Configuration Details
Before you connect Qumulo Alerts to a Qumulo cluster, collect the information that can help you configure Qumulo Alerts to monitor your cluster.

* **Cluster Address:** Use a fully qualified domain name (FQDN) rather than an IP address.
* **Traffic Distribution:** Will your Qumulo Alerts installation use a network load balancer or a floating IP address?
* **Default Plugin Frequency**: What should be the default frequency for plugin execution? (You can specify the frequency in minutes or seconds.)
* **Alarm and Alert Types:** Which alarms and alerts will Qumulo Alerts will collect from your Qumulo cluster?

## Installing Qumulo Alerts
This section explains how to install Qumulo Alerts on your machine.

<a id="clone-qumuloalerts-repository"></a>
### Step 1: Clone the Qumulo Alerts Repository
Navigate to the directory where you want Git to download files and run the following command.

```bash
git clone https://github.com/Qumulo/QumuloAlerts.git
```
   
Git creates a directory called `QumuloAlerts` and places the necessary files in it.

### Step 2: Create a Local User for Qumulo Alerts
To be able to generate access tokens, you must create a local user for Qumulo Alerts.

1. To connect to a node in your cluster as the `root` user, use SSH and then run the `sudo -s` command.

1. To create a local user, run the {% include qq.html command="auth_add_user" %} command and specify a name and password.

   ```bash
   qq auth_add_user --name QumuloAlerts \
     --password {{site.examplePassword}} 
   ```

1. You need the user ID that appears in the command output to create a role for Qumulo Alerts.

   In the following example, the user ID is `1234`.

   ```json
   {
     "can_change_password": true,
     "home_directory": null,
     "id": "1234",
     "name": "QumuloAlerts",
     "primary_group": "999",
     "sid": "{{site.exampleSID4}}",
     "uid": ""
   }
   ```

### Step 3: Create a Qumulo Core Role for Qumulo Alerts
1. Log in to the Qumulo Core Web UI and then click **Cluster > Role Management**.

1. On the **Role Management** page, click **Create Role**.

1. On the **Create Role** page:

   1. Enter `QumuloAlerts`.
      
      {% include important.html content="Because Qumulo Alerts verifies that it has sufficient role permissions before starting, this name is required." %}

   1. Enter a description, for example `This account lets an administrator restrict the privileges of the QumuloAlerts user.`

1. For **Privileges**, click all of the following:

   {% comment %} The following table is in HTML because the overly long privilege `SNAPSHOT_CALCULATE_USED_CAPACITY_READ` doesn't wrap on mobile, requiring special CSS to move the whole thing over to the left.{% endcomment %}
   <ul class="improve-mobile collapse-scroll">
     <li><code>ACCESS_TOKENS_READ</code>: View any access tokens present in the system</li>
     <li><code>AD_READ</code>: Read Qumulo Active Directory Settings</li>
     <li><code>ANALYTICS_READ</code>: Read cluster analytics</li>
     <li><code>AUDIT_READ</code>: Read audit settings</li>
     <li><code>CHECKSUMMING_READ</code>: View the status of checksumming</li>
     <li><code>CLUSTER_READ</code>: View nodes, disks, protection status, and SSL certificate</li>
     <li><code>DNS_READ</code>: Read DNS setting</li>
     <li><code>ENCRYPTION_READ</code>: View the status of at rest encryption</li>
     <li><code>FILE_READ_ACCESS</code>: Provides read access to all files regardless of permissions</li>
     <li><code>FS_ATTRIBUTES_READ</code>: Read file system statistics</li>
     <li><code>FS_DELETE_TREE_READ</code>: View the status of directory tree delete operations</li>
     <li><code>FS_KEY_MANAGEMENT_READ</code>: Read and list public keys for various FS security features</li>
     <li><code>FS_LOCK_READ</code>: View NLM and SMB locks and waiters</li>
     <li><code>FS_SETTINGS_READ</code>: View file system permissions settings</li>
     <li><code>FTP_READ</code>: View FTP status and settings</li>
     <li><code>IDENTITY_MAPPING_READ</code>: Get AD/LDAP User Defined Mappings</li>
     <li><code>IDENTITY_READ</code>: Use Qumulo's identity lookup and translation APIs</li>
     <li><code>KERBEROS_KEYTAB_READ</code>: View Kerberos keytab</li>
     <li><code>KERBEROS_SETTINGS_READ</code>: Read Kerberos settings</li>
     <li><code>LDAP_READ</code>: View LDAP settings</li>
     <li><code>LOCAL_GROUP_READ</code>: View local groups and members</li>
     <li><code>LOCAL_USER_READ</code>: Get information about local users</li>
     <li><code>METRICS_READ</code>: Get all metrics</li>
     <li><code>NETWORK_IP_ALLOCATION_READ</code>: View network IP address allocations</li>
     <li><code>NETWORK_READ</code>: Read network status and settings</li>
     <li><code>NFS_EXPORT_READ</code>: Read network status and settings</li>
     <li><code>NFS_SETTINGS_READ</code>: Internal-Only</code>: View NFS server settings</li>
     <li><code>QUOTA_READ</code>: View all file system quotas</li>
     <li><code>REBOOT_READ</code>: View Reboot Status</li>
     <li><code>RECONCILER_READ</code>: View reconciler status and metrics</li>
     <li><code>REPLICATION_OBJECT_READ</code>: View object store relationship settings and status</li>
     <li><code>REPLICATION_SOURCE_READ</code>: View source relationship settings and status</li>
     <li><code>REPLICATION_TARGET_READ</code>: View target relationship settings and status</li>
     <li><code>ROLE_READ</code>: View roles and assignments</li>
     <li><code>S3_BUCKETS_READ</code>: View all S3 buckets present in the system</li>
     <li><code>S3_CREDENTIALS_READ</code>: View any S3 access key present in the system</li>
     <li><code>S3_SETTINGS_READ</code>: View S3 server settings</li>
     <li><code>S3_UPLOADS_READ</code>: View all S3 uploads present in the system.</li>
     <li><code>SAML_SETTINGS_READ</code>: View SAML integration settings</li>
     <li><code>SMB_FILE_HANDLE_READ</code>: List open SMB file handles</li>
     <li><code>SMB_SESSION_READ</code>: List logged on SMB sessions</li>
     <li><code>SMB_SHARE_READ</code>: View configuration of SMB shares and SMB server settings</li>
     <li><code>SNAPSHOT_CALCULATE_USED_CAPACITY_READ</code>: Recalculate capacity usage of snapshots</li>
     <li><code>SNAPSHOT_DIFFERENCE_READ</code>: View the changes between snapshots</li>
     <li><code>SNAPSHOT_POLICY_READ</code>: View snapshot policies and status</li>
     <li><code>SNAPSHOT_READ</code>: List snapshots and view their status and cached capacity.</li>
     <li><code>SUPPORT_READ</code>: View support configuration and status</li>
     <li><code>TENANT_READ</code>: View any tenant information</li>
     <li><code>TIME_READ</code>: View time and time settings</li>
     <li><code>UNCONFIGURED_NODE_READ</code>: List unconfigured Qumulo nodes</li>
     <li><code>UPGRADE_READ</code>: View upgrade configuration and status</li>
   </ul>

1. Click **Save**.

### Step 4: Assign the Qumulo Alerts Role to Your Local Qumulo Core User
1. In the Qumulo Core Web UI, click **Cluster > Role Management**.

1. On the **Role Management** page, in the **QumuloAlerts** section, click **Add Member**.

1. In the **Add Member to Administrators** dialog box, for **Trustee**, enter the local username you have created earlier (for example, `QumuloAlerts`) and then click **Yes, Add Member**.

### Step 5: Create a Long-Lived Access Token
Run the `auth_create_access_token` command and specify the ID of the local user. For example:

```bash
qq auth_create_access_token auth_id:1234
```

The `auth_create_access_token` command returns a JSON response that contains the bearer token body and the access token ID, which you can use to manage the access token.

```json
{
  "bearer_token": "access-v1:abAcde...==",
  "id": "12345678901234567890123"
}
```

{{site.data.alerts.important}}
{{site.varBearerTokenRecommend}} {{site.varBearerTokenWarning}}
{{site.data.alerts.end}}

For more information, see [Using Qumulo Core Access Tokens](https://docs.qumulo.com/administrator-guide/connecting-to-external-services/creating-using-access-tokens-to-authenticate-external-services-qumulo-core.html) in the {{site.guides.onprem}}.


## Starting and Stopping Qumulo Alerts
* To start Qumulo Alerts, run the `./start-docker-qumulo-alerts.sh` command from the Qumulo Alerts directory.

* To stop Qumulo Alerts, run the `./stop-docker-qumulo-alerts.sh` command from the Qumulo Alerts directory.


## Configuring Qumulo Alerts
This section explains how to use the `alerts` CLI and how to configure Qumulo Alerts

### Step 1: Configure the alerts CLI for Your Operating System
Qumulo Alerts comes with the following binaries for Linux, macOS, and Windows.

* `alerts.macos-latest`
* `alerts.redhat-8`
* `alerts.ubuntu-20.04`
* `alerts.ubuntu-latest`
* `alerts.windows-latest.exe`

#### To Configure the alerts CLI for Linux
1. Link the binary for your operating system to the `alerts` CLI. For example:

   ```bash
   ln -s alerts.ubuntu-20.04 alerts
   ```

1. Make the binary file executable. For example:

   ```bash
   chmod a+x alerts.ubuntu-20.04
   ```

#### To Configure the alerts CLI for Windows
1. Copy `alerts.windows-latest.exe` to your Windows machine.

1. Rename the file to `alerts.exe`


### Step 2: Log in to Qumulo Alerts
1. To log in to Qumulo Alerts, run the `./alerts login -u admin` command.

1. When prompted, enter the following:

   * **Login:** `admin`
     
   * **Password:** `Admin123`

### Step 3: Configure Qumulo Alerts
1. Configure integration [with an email server](configuring-integrations/email-server.html) or [with SMS (ClickSend)](configuring-integrations/sms-clicksend.html).

1. [Configure alarm and alert notifications](configuring-notifications/alarms-and-alert-notifications-to-administrators.html).

1. [Configure Collection of Alarms and Alerts from a Qumulo Cluster](configuring-alarm-alert-collection.html).
