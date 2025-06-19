In Qumulo Core, directory quotas are designed to strike a balance between the traditional approaches of _hard quotas_ (that block operations as soon as the directory reaches a set limit) and _soft quotas_ (that only warn about the directory reaching a set limit).

When you create a directory quota, Qumulo Core checks the directory tree every few seconds for usage and marks the directory as full and read-only when it reaches its quota. This design often permits a client to finish writing a file, while still preventing the directory's usage from expanding indefinitely.

## To Create a Directory Quota

1. {{site.logIntoWebUI}}

1. Click **Sharing > Quotas**.

1. On the right side of the **Storage Quotas** page, click **Create Quota**.

1. In the **Create Quota** dialog box:

   1. Enter the **Path** to the directory to which to add a quota.
      
   1. Enter the quota **Limit** and enter the units.

   1. Click **Save**.


## To Modify a Directory Quota

1. {{site.logIntoWebUI}}

1. Click **Sharing > Quotas**.

1. For a storage quota, in the **Actions** column, click {% include shared_inline_image.html alt="Edit" file="shared-images/admin-guides/edit.png" max-width="40" %}.

1. In the **Edit Quota** dialog box, change the quota limit and click **Save**.


## To Delete a Directory Quota

1. {{site.logIntoWebUI}}

1. Click **Sharing > Quotas**.

1. For a storage quota, in the **Actions** column, click {% include shared_inline_image.html alt="Delete" file="shared-images/admin-guides/delete.png" max-width="40" %}.

1. In the **Delete quota for path?** dialog box, click **Yes, Delete**.


## Configuring Email Notifications for Cluster Quotas

For information about configuring email notifications for your cluster's quotas, see [Cluster Alerts for Qumulo](https://github.com/Qumulo/cluster-email-alerts) on GitHub.

For an example configuration, see `example_config.json`.
