---
title: "Installing Qumulo Alerts and Connecting it to a Qumulo Cluster"
summary: "This section explains how to install Qumulo Alerts and connect it to a Qumulo cluster."
permalink: /qumulo-alerts-guide/installing-configuring/installing-connecting-to-qumulo-cluster.html
sidebar: qumulo_alerts_guide_sidebar
keywords: Qumulo Alerts, install, connect, cluster, local user, role, assign, access token, access, token
---

## Prerequisites
We recommend the following system requirements for Qumulo Alerts.
* 4-core processor
* 16 GB memory
* 2 TB disk space

Before you install Qumulo Alerts, make sure you have the following tools:
* [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) (You can also browse the [QumuloAlerts](https://github.com/Qumulo/QumuloAlerts) GitHub repository.)
* [Docker](https://docs.docker.com/get-docker/)

Before you connect Qumulo Alerts to a Qumulo cluster, collect the information that can help you configure Qumulo Alerts to monitor your cluster.
* **Cluster Address:** What is your cluster's address? Use a fully qualified domain name (FQDN) rather than an IP address.
* **Traffic Distribution:** Will your Qumulo Alerts installation use a network load balancer or a floating IP address?
* **Default Plugin Frequency**: What should be the default frequency for plugin execution? (You can specify the frequency in seconds or minutes.)
* **Alarm and Alert Types:** Decide which alarms and alerts Qumulo Alerts will collect for your cluster.

## Step 1: Install QumuloAlerts
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

1. You will need the user ID that appears in the command output to create a role for Qumulo Alerts.

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

   a. Enter a name, for example `Qumulo Alerts`.

   b. Enter a description, for example `This account lets an administrator restrict the privileges of the Qumulo Alerts user.`

1. For **Privileges**, click all of the following:

   * **AD_READ: Read Qumulo Active Directory Settings**
   * **ANALYTICS_READ: Read cluster analytics**
   * **CHECKSUMMING_READ: View the status of checksumming**
   * **CLUSTER_READ: View nodes, disks, protection status, and SSL certificate**
   * **DNS_READ: Read DNS setting**
   * **ENCRYPTION_READ: View the status of at rest encryption**
   * **FTP_READ: View FTP status and settings**
   * **IDENTITY_MAPPING_READ: Get AD/LDAP User Defined Mappings**
   * **LDAP_READ: View LDAP settings**
   * **LOCAL_GROUP_READ: View local groups and members**
   * **LOCAL_USER_READ: Get information about local users**
   * **METRICS_READ: Get all metrics**
   * **NETWORK_READ: Read network status and settings**
   * **NFS_EXPORT_READ: Read network status and settings**
   * **QUOTA_READ: View all file system quotas**
   * **REBOOT_READ: View Reboot Status**
   * **RECONCILER_READ: View reconciler status and metrics**
   * **REPLICATION_SOURCE_READ: View source relationship settings and status**
   * **REPLICATION_TARGET_READ: View target relationship settings and status**
   * **ROLE_READ: View roles and assignments**
   * **S3_BUCKETS_READ: View all S3 buckets present in the system**
   * **S3_CREDENTIALS_READ: View any S3 access key present in the system**
   * **S3_SETTINGS_READ: View S3 server settings**
   * **SAML_SETTINGS_READ: View SAML integration settings**
   * **SMB_SESSION_READ: List logged on SMB sessions**
   * **SMB_SHARE_READ: View configuration of SMB shares and SMB server settings**
   * **SNAPSHOT_CALCULATE_USED_CAPACITY_READ:  Recalculate capacity usage of snapshots**
   * **SNAPSHOT_DIFFERENCE_READ: View the changes between snapshots**
   * **SNAPSHOT_POLICY_READ: View snapshot policies and status**
   * **SNAPSHOT_READ: List snapshots and view their status and cached capacity.**
   * **SUPPORT_READ: View support configuration and status**
   * **TENANT_READ: View any tenant information**
   * **TIME_READ: View time and time settings**
   * **UNCONFIGURED_NODE_READ: List unconfigured Qumulo nodes**
   * **UPGRADE_READ: View upgrade configuration and status**

1. Click **Save**.

## Step 4: Assign the Qumulo Alerts Role to Your Local User
1. In the Web UI, click **Cluster > Role Management**.

1. On the **Role Management** page, in the **Qumulo Alerts** section, click **Add Member**.

1. In the **Add Member to Administrators** dialog box, for **Trustee**, enter the local username you have created earlier (for example, `Qumulo Alerts`) and then click **Yes, Add Member**.

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
