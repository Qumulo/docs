<a id="create-smb-share"></a>
## To Create an SMB Share

1. Log in to the Qumulo Core Web UI.

1. Click **Sharing > SMB Shares**.

1. On the right side of the **SMB Shares** page, click **Create Share**.

1. On the **Create SMB Share** page, do the following:

   1. Enter the **File system path** from the root of your file system.

   1. To create a new directory, click **Create new directory if it doesn't exist**.

   1. Enter the **Share name** (for example, `\\{{site.exampleIP0}}\my-share`).
  
   1. Enter the **Description** for the share.
  
   1. To display only the files and directories to which the user has read access, click **Enable access-based enumeration**.

   1. To force users to connect over SMB3 (and higher) by using encryption-enabled clients, click **Require encryption**.
  
   1. Under **Share Permissions**, enter trustees and specify their:
        
      * **Permission type:** Click **Add allow** or **Add deny**.
  
        {% include note.html content="To ensure that Qumulo Core processes users to whom it explicitly denies access before processing users to whom it grants access, **Deny** entries appear at the top of the list and **Allow** entries at the bottom." %}
        
      * **Permissions:** Click **Read**, **Write**, or **Change Permissions**.
     
      To delete a trustee, click {% include shared_inline_image.html alt="Delete" file="shared-images/admin-guides/delete.png" max-width="40" %}.

   1. Under **Advanced Options**, do the following:

      1. Enter the **Default file create mode** (`0644` by default).
         
      1. Enter the **Default directory create mode** (`0755` by default).
     
  1. Click **Create Share**.


## To Modify an SMB Share

1. Log in to the Qumulo Core Web UI.

1. Click **Sharing > SMB Shares**.

1. For an SMB share, in the **Actions** column, click {% include shared_inline_image.html alt="Edit" file="shared-images/admin-guides/edit.png" max-width="40" %}.

1. Make changes to your SMB share (for more information, see [To Create an SMB Share](#create-smb-share)) and then click **Save**.


## To Delete an SMB Share

1. Log in to the Qumulo Core Web UI.

1. Click **Sharing > SMB Shares**.

1. For an SMB share, in the **Actions** column, click {% include shared_inline_image.html alt="Delete" file="shared-images/admin-guides/delete.png" max-width="40" %}.

1. In the **Delete Share** dialog box, click **Yes, Delete Share**.
