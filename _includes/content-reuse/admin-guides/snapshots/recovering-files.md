In Qumulo Core 2.5.0 (and higher), you can recover files by accessing the hidden `.snapshot` directory over SMB or NFS.

Inside the `.snapshot` directory, directories with snapshot IDs represent various snapshots. The _modified_ timestamp of a directory is the time at which Qumulo Core took the snapshot.

{{site.data.alerts.note}}
<ul>
  <li>When you use NFS on Linux and macOS (even if you configure your system to show hidden files), the <code>.snapshot</code> directory doesn't appear when you list a directory's contents. You must navigate to the <code>.snapshot</code> directory explicitly.</li>
  <li>When you use SMB, the <code>.snapshot</code> directory appears only at the root of the share in Finder or File Explorer. In other directories, you must navigate to the <code>.snapshot</code> directory explicitly.</li>  
</ul>
{{site.data.alerts.end}}


## To Recover Files on Linux or macOS by Using the Command Line
1. Navigate to the `.snapshot` directory. For example:

   ```bash
   cd /Volumes/MyShareName/.snapshot
   ```
   
{{page.varRecover}}

{% include tip.html content="To see the `.snapshot` directory at the root of the share, show hidden files by pressing **&#8984; + Shift + .**" %}


## To Recover Files on macOS by Using Finder
1. On the Finder menu, click **Go > Go to Folder...**.

1. In the dialog box, enter the path to the `.snapshot` directory. For example:

   ```
   /Volumes/MyShareName/.snapshot
   ```

   {% include note.html content="You must specify the `.snapshot` directory from the root of the share." %}
   
{{page.varRecover}}


## To Recover Files on Windows by Using File Explorer
1. On Windows 7 (and higher), configure Windows Explorer (or File Explorer) as follows:

   1. Disable **Hide protected operating system files**.
   
   1. Enable **Show hidden files, folders, and drives**.

1. Navigate to the `.snapshot` directory.

{{page.varRecover}}
