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

1. Use SSH to log in to any node in your cluster.

1. To create a local user, use the `auth_add_user` command and specify a name and password.

   ```bash
   qq auth_add_user --name QumuloAlerts --password <password>
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
     "sid": "S-1-5-21-1234567890-098765432-1234567890-1234",
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

   {% comment %} The following table is in HTML because the overly long privilege SNAPSHOT_CALCULATE_USED_CAPACITY_READ doesn't wrap on mobile, requiring special CSS to move the whole thing over to the left.{% endcomment %}
   <ul class="improve-mobile collapse-scroll">
      <li><strong>ACCESS_TOKENS_READ: View any access tokens present in the system</strong></li>
      <li><strong>AD_READ: Read Qumulo Active Directory Settings</strong></li>
      <li><strong>ANALYTICS_READ: Read cluster analytics</strong></li>
      <li><strong>AUDIT_READ: Read audit settings</strong></li>
      <li><strong>CHECKSUMMING_READ: View the status of checksumming</strong></li>
      <li><strong>CLUSTER_READ: View nodes, disks, protection status, and SSL certificate</strong></li>
      <li><strong>DNS_READ: Read DNS setting</strong></li>
      <li><strong>ENCRYPTION_READ: View the status of at rest encryption</strong></li>
      <li><strong>FILE_FULL_ACCESS: Provides full access to all files regardless of permissions</strong></li>
      <li><strong>FS_ATTRIBUTES_READ: Read file system statistics</strong></li>
      <li><strong>FS_DELETE_TREE_READ: View the status of directory tree delete operations</strong></li>
      <li><strong>FS_KEY_MANAGEMENT_READ: Read and list public keys for various FS security features</strong></li>
      <li><strong>FS_LOCK_READ: View NLM and SMB locks and waiters</strong></li>
      <li><strong>FS_SETTINGS_READ: View file system permissions settings</strong></li>
      <li><strong>FTP_READ: View FTP status and settings</strong></li>
      <li><strong>IDENTITY_MAPPING_READ: Get AD/LDAP User Defined Mappings</strong></li>
      <li><strong>IDENTITY_READ: Use Qumulo's identity lookup and translation APIs</strong></li>
      <li><strong>KERBEROS_KEYTAB_READ: View Kerberos keytab</strong></li>
      <li><strong>KERBEROS_SETTINGS_READ: Read Kerberos settings</strong></li>
      <li><strong>LDAP_READ: View LDAP settings</strong></li>
      <li><strong>LOCAL_GROUP_READ: View local groups and members</strong></li>
      <li><strong>LOCAL_USER_READ: Get information about local users</strong></li>
      <li><strong>METRICS_READ: Get all metrics</strong></li>
      <li><strong>NETWORK_IP_ALLOCATION_READ: View network IP address allocations</strong></li>
      <li><strong>NETWORK_READ: Read network status and settings</strong></li>
      <li><strong>NFS_EXPORT_READ: Read network status and settings</strong></li>
      <li><strong>NFS_SETTINGS_READ: Internal-Only: View NFS server settings</strong></li>
      <li><strong>QUOTA_READ: View all file system quotas</strong></li>
      <li><strong>REBOOT_READ: View Reboot Status</strong></li>
      <li><strong>RECONCILER_READ: View reconciler status and metrics</strong></li>
      <li><strong>REPLICATION_OBJECT_READ: View object store relationship settings and status</strong></li>
      <li><strong>REPLICATION_SOURCE_READ: View source relationship settings and status</strong></li>
      <li><strong>REPLICATION_TARGET_READ: View target relationship settings and status</strong></li>
      <li><strong>ROLE_READ: View roles and assignments</strong></li>
      <li><strong>S3_BUCKETS_READ: View all S3 buckets present in the system</strong></li>
      <li><strong>S3_CREDENTIALS_READ: View any S3 access key present in the system</strong></li>
      <li><strong>S3_SETTINGS_READ: View S3 server settings</strong></li>
      <li><strong>S3_UPLOADS_READ: View all S3 uploads present in the system.</strong></li>
      <li><strong>SAML_SETTINGS_READ: View SAML integration settings</strong></li>
      <li><strong>SMB_FILE_HANDLE_READ: List open SMB file handles</strong></li>
      <li><strong>SMB_SESSION_READ: List logged on SMB sessions</strong></li>
      <li><strong>SMB_SHARE_READ: View configuration of SMB shares and SMB server settings</strong></li>
      <li><strong>SNAPSHOT_CALCULATE_USED_CAPACITY_READ: Recalculate capacity usage of snapshots</strong></li>
      <li><strong>SNAPSHOT_DIFFERENCE_READ: View the changes between snapshots</strong></li>
      <li><strong>SNAPSHOT_POLICY_READ: View snapshot policies and status</strong></li>
      <li><strong>SNAPSHOT_READ: List snapshots and view their status and cached capacity.</strong></li>
      <li><strong>SUPPORT_READ: View support configuration and status</strong></li>
      <li><strong>TENANT_READ: View any tenant information</strong></li>
      <li><strong>TIME_READ: View time and time settings</strong></li>
      <li><strong>UNCONFIGURED_NODE_READ: List unconfigured Qumulo nodes</strong></li>
      <li><strong>UPGRADE_READ: View upgrade configuration and status</strong></li>
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
