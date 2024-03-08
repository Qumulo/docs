<a id="create-nfs-export"></a>
## To Create an NFS Export

1. Log in to the Qumulo Core Web UI.

1. Click **Sharing > NFS Exports**.

1. On the right side of the **NFS Exports** page, click **Create Export**.

1. On the **Create NFS Export** page, do the following:

   1. Enter the **File system path** from the root of your file system.

   1. To create a new directory, click **Create new directory if it doesn't exist**.

   1. Enter the **Export path**.
  
   1. Enter the **Description** for the export.
  
   1. Under **Host Access Rules**, enter **Allowed Hosts** and specify:
        
      * Whether the host has **Read-only access**
        
      * The **User Mapping**
  
      {% include note.html content="Qumulo Core enforces host access rules in the order of appearance, top to bottom. We recommend adding rules specific to IP addresses and hosts to the top of the list and rules specific to subnets and host wildcards to the bottom. For more information see [Configuring and Troubleshooting Host Access Rules](configuring-troubleshooting-host-access-rules-nfs-exports.html)." %}
     
      To add a host, click **Add a Host Access Rule**.

      To delete an existing host, click {% include shared_inline_image.html alt="Delete" file="shared-images/admin-guides/delete.png" max-width="40" %}.
     
  1. Click **Save**.


## To Modify an NFS Export

1. Log in to the Qumulo Core Web UI.

1. Click **Sharing > NFS Exports**.

1. For an NFS Export, in the **Actions** column, click {% include shared_inline_image.html alt="Edit" file="shared-images/admin-guides/edit.png" max-width="40" %}.

1. Make changes to your NFS Export (for more information, see [To Create an NFS Export](#create-nfs-export)) and then click **Save**.


## To Delete an NFS Export

1. Log in to the Qumulo Core Web UI.

1. Click **Sharing > NFS Exports**.

1. For an NFS Export, in the **Actions** column, click {% include shared_inline_image.html alt="Delete" file="shared-images/admin-guides/delete.png" max-width="40" %}.

1. In the **Delete Export** dialog box, click **Yes, Delete Export**.
