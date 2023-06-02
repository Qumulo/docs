---
title: "Installing Qumulo Alerts and Connecting it to a Qumulo Cluster"
summary: "This section explains how to install Qumulo Alerts and connect it to a Qumulo cluster."
permalink: /qumulo-alerts-guide/installing-configuring/installing-connecting-to-qumulo-cluster.html
sidebar: qumulo_alerts_guide_sidebar
keywords: Qumulo_Alerts, install, connect, cluster, local_user, role, assign, access_token, access, token, start, stop
---

## Prerequisites
We recommend the following system requirements for Qumulo Alerts.
* 4-core processor
* 16 GB memory
* 2 TB disk space

Before you install Qumulo Alerts, make sure you have the following tools:
* [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) (You can also browse the [QumuloAlerts](https://github.com/Qumulo/QumuloAlerts) GitHub repository.)
* [Docker](https://docs.docker.com/get-docker/)
* [Docker Compose Plugin](https://docs.docker.com/compose/install/linux/)

  {% include important.html content="Qumulo Alerts requires the Docker Compose Plugin to operate correctly." %}

Before you connect Qumulo Alerts to a Qumulo cluster, collect the information that can help you configure Qumulo Alerts to monitor your cluster.
* **Cluster Address:** Use a fully qualified domain name (FQDN) rather than an IP address.
* **Traffic Distribution:** Will your Qumulo Alerts installation use a network load balancer or a floating IP address?
* **Default Plugin Frequency**: What should be the default frequency for plugin execution? (You can specify the frequency in minutes or seconds.)
* **Alarm and Alert Types:** Which alarms and alerts will Qumulo Alerts will collect from your Qumulo cluster?

<a id="clone-qumuloalerts-repository"></a>
## Step 1: Clone the QumuloAlerts Repository
Navigate to the directory where you want Git to download files and run the following command.

```bash
git clone https://github.com/Qumulo/QumuloAlerts.git
```
   
Git creates a directory called `QumuloAlerts` and places the necessary files in it.

## Step 2: Create a Local User for Qumulo Alerts
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

## Step 3: Create a Role for Qumulo Alerts
1. Log in to the Qumulo Web UI and then click **Cluster > Role Management**.

1. On the **Role Management** page, click **Create Role**.

1. On the **Create Role** page:

   1. Enter `QumuloAlerts`.
      
      {% include important.html content="Because Qumulo Alerts verifies that it has sufficient role permissions before starting, this name is required." %}

   1. Enter a description, for example `This account lets an administrator restrict the privileges of the QumuloAlerts user.`

1. For **Privileges**, click all of the following:

   {% comment %} The following table is in HTML because the overly long privilege SNAPSHOT_CALCULATE_USED_CAPACITY_READ doesn't wrap on mobile, requiring special CSS to move the whole thing over to the left.{% endcomment %}
   <ul class="improve-mobile">
      <li><strong>ACCESS_TOKENS_READ: View any access tokens present in the system</strong></li>
      <li><strong>AD_READ: Read Qumulo Active Directory Settings</strong></li>
      <li><strong>ANALYTICS_READ: Read cluster analytics</strong></li>
      <li><strong>AUDIT_READ: Read audit settings</strong></li>
      <li><strong>CHECKSUMMING_READ: View the status of checksumming</strong></li>
      <li><strong>CLUSTER_READ: View nodes, disks, protection status, and SSL certificate</strong></li>
      <li><strong>DNS_READ: Read DNS setting</strong></li>
      <li><strong>ENCRYPTION_READ: View the status of at rest encryption</strong></li>
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

## Step 4: Assign the Qumulo Alerts Role to Your Local User
1. In the Web UI, click **Cluster > Role Management**.

1. On the **Role Management** page, in the **QumuloAlerts** section, click **Add Member**.

1. In the **Add Member to Administrators** dialog box, for **Trustee**, enter the local username you have created earlier (for example, `QumuloAlerts`) and then click **Yes, Add Member**.

## Step 5: Create a Long-Lived Access Token
Use the `auth_create_access_token` command and specify the ID of the local user. For example:

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

For more information, see [Using Qumulo Core Access Tokens](https://docs.qumulo.com/administrator-guide/external-services/using-access-tokens.html) in the Qumulo Administrator Guide.

## Step 6: Start Qumulo Alerts
To start Qumulo Alerts, run the following command from the directory to which you cloned the `QumuloAlerts` repository.

```bash
./start-docker-qumulo-alerts.sh
```

## Step 7: Configure Qumulo Alerts
1. [Configure alarms and alerts](alarms-and-alerts.md).

1. [Configure alarm and alert notifications](../configuring-notifications/alarms-and-alerts.md).

1. Configure integration [with an email server](../configuring-integrations/email-server.md) or [with SMS (ClickSend)](../configuring-integrations/sms-clicksend.md).


## Step 8: Stop Qumulo Alerts
To stop Qumulo Alerts, run the following command from the directory to which you cloned the 'QumuloAlerts' repository.

```bash
./stop-docker-qumulo-alerts.sh
```
