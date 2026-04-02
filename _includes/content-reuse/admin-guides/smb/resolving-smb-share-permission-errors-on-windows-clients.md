## Step 1: Disconnecting Existing Shares

By default, a Qumulo cluster has a local administrative account that you can use to set permissions on `/` (the root directory) and its subdirectories.

To be able to log in to the cluster with the local administrative account, take one of the following steps:

* In File Explorer (or Windows Explorer), right-click the network drive and then click **Disconnect**.

* At the command prompt, close all shares currently mapped on the client by running the following command:

  ```batch
  net use * /delete
  ```


## Step 2: Mapping a Network Drive to an SMB Share on a Qumulo Cluster
1. After you disconnect all shares, in File Explorer (or Windows Explorer), right-click **This PC** (or **Computer**) and then click **Map network drive**.

1. In the **Map Network Drive** dialog box, take the following steps:

   1. For **Drive**, select a drive letter.

   1. For **Folder**, enter a path to the SMB share.

   1. Click **Connect using different credentials**.

1. In the **Windows Security: Enter network credentials** dialog box, take the following steps:

   1. For the username, enter `qumulo\admin`.

   1. For the password, enter your Qumulo cluster password.

      {% include tip.html content="This is the same password you use to log in to your cluster's Qumulo Core Web UI." %}

   1. Click **OK**.


## Step 3: Testing Adding Users or Groups to the SMB Share

1. Right-click a file and then click **Properties**.

1. In the **&lt;file name&gt; Properties** dialog box, click **Security** and then check that you are logged in to the Qumulo cluster with the local administrative account.

1. To add a domain user or group, under **Group or user names**, click your username and then click **Edit**.

1. In the **Permissions for &lt;username&gt;** dialog box, click **Add**.

1. In the **Select Users, Computers, Service Accounts, or Groups** dialog box, enter a domain user or group, click **Check Names**, and then click **OK**.

1. In the **Permissions for &lt;username&gt;** dialog box, click **Apply**.

1. In the **&lt;file name&gt; Properties** dialog box, click **OK**.

{% include note.html content="New subdirectories or files inherit correct permissions from the parent directory." %}
