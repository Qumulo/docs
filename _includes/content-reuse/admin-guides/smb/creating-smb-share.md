## To Create an SMB Share {#create-smb-share}
1. {{site.logIntoWebUI}}

1. Click **Sharing > SMB Shares**.

1. On the right side of the **SMB Shares** page, click **Create Share**.

1. On the **Create SMB Share** page, take the following steps.

   1. Enter the **File system path** from the root of your file system.

   1. To create a new directory, click **Create new directory if it doesn't exist**.
  
   1. To allow username substitution in the _File system path_, click **Expand %U to username in path**.
  
      For more information see [How SMB Share Username Expansion Works in Qumulo Core](#username-expansion).
  
      {% include note.html content="If you click **Create new directory if it doesn't exist** in addition to **Expand %U to username in path**, Qumulo Core creates the path automatically the first time the user connects to the SMB share. This lets cluster administrators configure individual access to home directories without having to create an SMB share for each user." %}

   1. Enter the **Share name**.

      The share name becomes part of the UNC path for your SMB share. For example, if you set the **Share name** to `grumpquat` and your cluster's hostname is `my-cluster.example.com`, SMB clients can access the share by using the `\\my-cluster.example.com\grumpquat` UNC path.
  
   1. Enter the **Description** for the share.
  
   1. To display only the files and directories to which the user has read access, click **Enable access-based enumeration**.

   1. To force users to connect over SMB3 (and higher) by using encryption-enabled clients, click **Require encryption**.
  
   1. Under **Share Permissions**, enter trustees and specify their:
        
      * **Permission type:** Click **Add allow** or **Add deny**.
  
        {% include note.html content="To ensure that Qumulo Core processes users to whom it explicitly denies access before processing users to whom it grants access, **Deny** entries appear at the top of the list and **Allow** entries at the bottom." %}
        
      * **Permissions:** Click **Read**, **Write**, or **Change Permissions**.
     
      To delete a trustee, click {% include shared_inline_image.html alt="Delete" file="shared-images/admin-guides/delete.png" max-width="40" %}.

   1. (Optional) Under **Advanced Options**:

      1. Enter the **Default file create mode** (`0644` by default).
         
      1. Enter the **Default directory create mode** (`0755` by default).

      {% include note.html content="Qumulo Core applies these POSIX permissions to files and directories that SMB clients create when the parent directory doesn't contain any inheritable permissions. This helps maintain NFS compatibility and enable smooth cross-protocol workflows in scenarios when organizations use SMB and NFS together." %}
     
  1. Click **Create Share**.

### How SMB Share Username Expansion Works in Qumulo Core {#username-expansion}
In Qumulo Core 7.7.5.1 (and higher), the system expands the `%U` placeholder to a username for SMB shares. For example, for a user authenticated in SMB as `EXAMPLE_DOMAIN\alice`, the path `/home/%U` becomes `/home/%alice`.

Qumulo core expands the `%U` placeholder:

* Only if it is an _entire_ file path component

  For example, Qumulo Core expands `/home/%U/example` but treats `/home/test%U/example` literally.

* Only to a username

  {{site.data.alerts.important}}
  Qumulo Core expands the <code>%U</code> placeholder even if your system has a primary Active Directory (AD) domain user with the same username as:
  <ul>
    <li>A user in your Qumulo cluster</li>
    <li>A trusted AD domain user</li>
  </ul>
  For this reason, we strongly recommend that system administrators in your organization use the <code>%U</code> placeholder with caution and in conjunction with share permission to prevent unauthorized access to cluster data.
  {{site.data.alerts.end}}


## To Modify an SMB Share
1. {{site.logIntoWebUI}}

1. Click **Sharing > SMB Shares**.

1. For an SMB share, in the **Actions** column, click {% include shared_inline_image.html alt="Edit" file="shared-images/admin-guides/edit.png" max-width="40" %}.

1. Make changes to your SMB share (for more information, see [To Create an SMB Share](#create-smb-share)) and then click **Save**.


## To Delete an SMB Share
1. {{site.logIntoWebUI}}

1. Click **Sharing > SMB Shares**.

1. For an SMB share, in the **Actions** column, click {% include shared_inline_image.html alt="Delete" file="shared-images/admin-guides/delete.png" max-width="40" %}.

1. In the **Delete Share** dialog box, click **Yes, Delete Share**.
