{% include important.html content="To perform the following operations, you must use a Qumulo Core account with the Administrators or Data Administrators role." %}

## Prerequisites
Windows 7 or Windows Server 2008 R2 (or higher)


## To Connect a Windows Machine to the SMB Shares on Your Qumulo Cluster by Using the Shared Folders MMC Snap-In

1. In Command Prompt, run the `net use` command to connect to your Qumulo cluster. For example:

   ```bat
   net use \\mycluster.example.com /user:admin
   ```

1. When prompted, enter your credentials.

1. In MMC, click **File > Add/Remove Snap-in...**.

1. In the **Add or Remove Snap-ins** dialog box, under **Available snap-ins**, click **Shared Folders**, and then click **Add >**.

1. In the **Shared Folders** window, in the left pane, right-click **Shared Folders (<JSMITH-WORK-DESKTOP>)**, and then click **Connect to another computer...**.

1. In the **Shared Folders** dialog box, do the following:

   1. Under **This snap-in will always manage**, click **Another computer** and enter your cluster's hostname, for example `mycluster.example.com`.

      {% include important.html content="Don't place a slash (`/`) after your cluster's hostname. Although the Shared Folders snap-in doesn't display an error message in case of failure, adding the slash after the hostname causes the opertion to fail." %}

   1. Under **View**, click **All**.

   1. Click **Finish**.

   MMC adds the Shared Folders snap-in to its left pane, under **Console Root**.

1. (Optional) To view the existing shares on your Qumulo cluster, expand **Shared Folders (\\MYCLUSTER.EXAMPLE.COM)** and then click **Shares**.


## To Connect Your Qumulo Cluster to a Share on Your Windows Machine by Using the Shared Folders MMC Snap-In

{% include note.html content="Shared folder permissions are unrelated to NTFS access control lists (ACLs)." %}

1. In MMC, click **Shared Folders (<JSMITH-WORK-DESKTOP>)** and then on the menu bar click **Action > New Share...**.

1. In the **Create a Shared Folder Wizard: Folder Path** dialog box, for **Folder path**, specify the path for the SMB share (for example `C:\Users\Jennifer\Reports`) and then click **Next >**.

   {% include note.html content="If you click **Browse...**, you might see the **q$** parent item in the directory tree. The is the root (`/`) of the file system." %}

1. In the **Create a Shared Folder Wizard: Name, Description, and Settings** dialog box, do the following:

   1. Enter the **Share name**, for example `jennifer-reports`.

   1. Enter the **Share path**, for example `\\JSMITH-WORK-DESKTOP\jennifer-reports`.

   1. Click **Next >**.

1. In the **Create a Shared Folder Wizard: Shared Folder Permissions** dialog box, select one of the following permissions for the shared folder:

   * **All users have read-only access**

   * **Administrators have full access; other uers have read-only access**

   * **Administrators have full access; other users have no access**

   * **Customize permissions**

     {% include tip.html content="We recommend clicking **Customize permissions** and then, in the dialog box, giving **Full Control** to the group **Everyone**." %}

1. Click **Finish**.

1. To confirm that your SMB share is visible to your Qumulo cluster, log in to the Web UI and click **Sharing > SMB Shares**.


## To Change the Configuration for an Existing Share on Your Windows Machine by Using the Shared Folders MMC Snap-In

1. In MMC, click **Shared Folders (<JSMITH-WORK-DESKTOP>)** and then in the right pane right-click an existing share and then click **Properties**.

1. In the **File Properties** dialog box, on the **General** tab, you can edit properties such as **Share name**, **Folder path**,  **Description**, and **User Limit**.

   {{site.data.alerts.note}}
   <ul>
     <li>The settings of the <strong>User limit</strong> and <strong>Offline Settings...</strong> properties have no effect on your Qumulo cluster.</li>
     <li>The path `C:\` represents the root (`/`) of your Qumulo file system.</li>
   </ul>
   {{site.data.alerts.end}}

1. On the **Share Permissions** tab, ensure that the permissions for various users and groups are correct.

   {{site.data.alerts.note}}
   <ul>
     <li>It is possible to add local users and groups from your Qumulo cluster by prefixing them with the name of your cluster followed by a backslash (<code>\</code>). For example: <code>accounting\admin</code></li>
     <li>Because, if you <em>don't</em> select **Full Control**, there is a minor mismatch between the rights that Windows Change Permissions grants and the Qumulo Core Web UI `Write` permissions. For this reason, share permissions configured by using the MMC appear with an asterisk (<code>*</code>) in the Qumulo Core Web UI. We recommend using Qumulo Core to configure share permissions.</li>
   </ul>
   {{site.data.alerts.end}}

1. On the **Security** tab, ensure that the file permissions for the directory subtree under the share are conect.

1. To save changes, click **Apply**.It is possible to add local users and groups from your Qumulo cluster by prefixing them with the name of your cluster followed by a backslash (`\`). For example: `accounting\admin`

   {% include important.html content="For a Qumulo cluster with default settings, applying changes results in an error for the `.snapshots` meta-directory. It is safe to click **Continue** each time this error occurs." %}
