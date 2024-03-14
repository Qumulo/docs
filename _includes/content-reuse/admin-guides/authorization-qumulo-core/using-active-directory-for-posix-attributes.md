{% include important.html content="For changes to take effect, any Qumulo clusters that are already joined to an Active Directory domain must leave the domain and rejoin it." %}

Because the SMB and NFS protocols have unique identifiers and exist in different identity domains, it becomes difficult to link the two protocols when they represent the same identity. In addition, storage devices can't determine the entity that attempts to access a file; as a result, a file that a Linux system writes can be inaccessible on a Windows machine.

One solution to this issue is _full credential expansion_, which involves mapping the two identities&mdash;Windows identities for SMB clients and POSIX identities for NFS clients&mdash;by using Active Directory as a central reference. For more information, see {% include rfc.html rfc='2307' %}. This approach ensures that, when you use Active Directory to maintain identity mappings from POSIX to Windows, Qumulo Core abides by the mappings.

After you enable Active Diretory for POSIX attributes in Qumulo Core, you must enable user identity mapping from your Windows SID to your NFS UID. To do this, assign a _user object_ (SID or `objectSid`) to every object in Windows and enter the NFS UID of the user as an object attribute. {{page.varMapExample}} Whenever this user identity is required (for example, to check permissions), Qumulo Core uses the established mapping to retrieve the entire identity for the user by referencing the NFS UIDs and GIDs, as well as all SIDs, including the group IDs of any relevant parent groups.

{% include note.html content="The full credential expansion method lets your Qumulo Core cluster support more than 16 group memberships for your NFS users, as long as Active Directory configures the group memberships." %}

## Enabling Active Directory for POSIX Attributes in Qumulo Core
This section explains how to enable Active Directory for POSIX attributes in Qumulo Core by using the Web UI and REST API.

### To Enable Active Directory for POSIX Attributes by Using the Qumulo Core Web UI

1. {{site.logIntoWebUI}}

1. Click **Cluster > Active Directory**.

1. On the **Active Directory** page, do the following:

   1. Enter the details for your Active Directory server.

   1. For **Use Active Directory for POSIX Attributes**, click **Yes**.

   1. (Optional) To limit part of the Active Directory tree that Qumulo Core can query, enter a **Base DN (Distinguished Name) for User and Group Accounts**.
  
   1. Click **Join**.

When your cluster joins Active Directory, all SMB sessions and NFS operations result in full credential expansion for every user. For example, when NFS UID 2053 attempts to access a file, the cluster first queries the AD server to:

* Determine the groups to which the user belongs
* Map the user and groups to all Windows SIDs
* Apply permissions based on the fully expanded credential set

{{page.varMapExample}}
