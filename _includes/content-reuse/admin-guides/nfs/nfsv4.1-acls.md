The Qumulo Core implementation supports using `AUTH_SYS` credentials (also known as `AUTH_UNIX`), `AUTH_NONE` (which acts as `AUTH_SYS` but maps incoming UIDs and GIDs to `nobody`), and `AUTH_KRB5`, `AUTH_KRB5P`, or `AUTH_KRB5I` credentials. You can use the CLI tools in the `nfs-acl-tools` Linux package to allow or deny various operations.

For more information about NFSv4.1, see [Enabling and Using NFSv4.1 on a Qumulo Cluster](/nfsv4.1-enabling-using.html).


## Using the NFSv4.1 CLI Commands to Manage ACLs
In most Linux distributions, the `nfs-acl-tools` package contains the NFSv4.1 commands that let you manage ACLs for files.

### Showing the ACL of a File
To show the ACL of a file, run the `nfs4_getfacl` command. In the following example, we create the file `my-file` and then show the ACL for it.

```bash
touch /mnt/qumulo/my-file && \
  nfs4_getfacl /mnt/qumulo/my-file
```

{{ site.exampleOutput }}

```
A::user1@domain.example.com:rwatTnNcy
A:g:group1@domain.example.com:rwatTnNcy
A::EVERYONE@:rtncy
```

The entries in the ACL have four parts separated by colons (`:`). For more information, see the [nfs4_acl](https://linux.die.net/man/5/nfs4_acl) in the Linux documentation.

The ACL in this example corresponds to `664` mode: The owner (`user1`) and group (`group1`) of the file are allowed to read and write, while others (`EVERYONE@`) are allowed to only read. To check the current mode, run the `stat` command, for example:

```bash
stat -c %a /mnt/qumulo/my-file
```

{{ site.exampleOutput }}

```
664
```

### Editing the ACL of a File
To edit the ACL of a file (by using the text editor specified in the `$EDITOR` environment variable), run the [nfs4_editfacl](https://linux.die.net/man/1/nfs4_editfacl) command (or the [nfs4_setfacl](https://linux.die.net/man/1/nfs4_setfacl) command with the `-e` flag).

### Setting the ACL of a File
To set the ACL of a file, you can use one of the following commands:

* **Add a Single ACE:** `nfs4_setfacl -a <ace>`
* **Set an Entire ACL:** `nfs4_setfacl -s <acl>`

### Configuring Access Control Entries (ACEs) and Trustee Representation
{% include note.html content="The following guidance applies to all `nfs4_acl` scenarios, including getting, editing, and setting the ACL." %}

There are four fields in the `nfs4_acl` syntax, separated by colons (`:`):

* The ACE type
* Additional ACE flags
* The trustee to which the ACE applies
* The access types to which the ACE applies

#### ACE Type
In [the example of the file ACL](#showing-the-acl-of-a-file), all three ACEs are set to `A` (allow).

{% include note.html content="Qumulo Core supports only `A` and `D` ACEs." %}

* **A:** Allow
* **D:** Deny
* **U:** Audit
* **L:** Alarm

#### Additional ACE Flags
In [the example of the file ACL](#showing-the-acl-of-a-file), the second ACE has the flag `g` that shows that the ID in the following part represents a _group_ (rather than a user).

{% include note.html content="Qumulo Core doesn't support The `S` and `F` flags." %}

#### The Trustee to Which the ACE Applies
You can use the following trustee representation formats.

{{site.data.alerts.important}}
<ul>
  <li>Be careful when you copy <em>local users and groups</em> across different Qumulo clusters manually. Aside from UIDs and GIDs, local users and groups are the only identity types in this table that aren't globally unique (because a user or group name represents them). If the destination cluster interprets the named user or group differently, the permissions you set might be unexpected.</li>
  <li>This consideration doesn't apply to replication copies of local user or group trustees.</li>
</ul>
{{site.data.alerts.end}}

{% capture useReg %}You can use this format regardless of client mount security, but only when the cluster is joined to AD.{% endcapture %}

<table>
  <thead>
    <tr>
      <th style="width:28%">Representation</th>
      <th style="width:28%">Example</th>
      <th style="width:21%">Storage Location</th>
      <th style="width:21%">Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>A Kerberos principal that represents a user in the domain to which a Qumulo cluster is joined, in the following format:<br><code>&lt;user&gt;@&lt;domain&gt;</code></td>
      <td><code>user1@domain.example.com</code></td>   
      <td>For this trustee in the ACE, the system stores the corresponding AD SID for this user principal on disk.</td>
      <td>
        <p>You can use this format regardless of client mount security, but only when the cluster is joined to AD.</p>
        <p>For more information about configuring your clients and Qumulo cluster for Kerberos, see the <a href="../kerberos/kerberos-with-qumulo-core.html">How NFSv4.1 Works with Kerberos in Qumulo Core</a>.</p>
      </td>
    </tr>
    <tr>
      <td>A Kerberos principal that represents a group in the domain to which a Qumulo cluster is joined, in the following format:<br><code>&lt;group&gt;@&lt;domain&gt;</code></td>
      <td><code>group1@domain.example.com</code></td>
      <td>For this trustee in the ACE, the system stores the corresponding AD SID for this group principal on disk.</td>
      <td>
        <ul>
          <li>You can use this format regardless of client mount security, but only when the cluster is joined to AD.</li>
          <li>The group flag isn't necessary to show that this is a group.</li>
        </ul>
        <p>For more information about configuring your clients and Qumulo cluster for Kerberos, see <a href="../kerberos/kerberos-with-qumulo-core.html">How NFSv4.1 Works with Kerberos in Qumulo Core</a>.</p>
      </td>
    </tr>
    <tr>
      <td>A raw SID, in the following format:<br><code>&lt;S-R-X-Y1-Y2-Yn-1-Yn&gt;</code></td>
      <td><code>{{site.adminGroupSID}}</code></td>
      <td>To store a SID on disk for this trustee, you can use this format in place of a Kerberos principal.</td>
      <td>
        <ul>
          <li>An AD SID must be a user or a group, but can't be both.</li>
          <li>
            The group flag isn't necessary for showing whether the SID represents a user or group.
            {% include tip.html content="This can be useful if you have SIDs in a foreign domain (that is, a domain that the cluster isn't joined to)." %}
          </li>
          <li>You can use this representation when the cluster isn't joined to a domain at all. When you retrieve an ACL by using <code>nfs4_getfacl</code>, the presentation for joined domain SIDs is <code>&lt;group&gt;@&lt;domain&gt;</code> and the presentation for foreign SIDs is <code>&lt;S-R-X-Y1-Y2-Yn-1-Yn&gt;</code>.</li>
        </ul>
        <p>For more information, see <a href="https://docs.microsoft.com/en-us/windows/security/identity-protection/access-control/security-identifiers">Security Identifiers</a> in the Microsoft documentation.</p>
      </td>
    </tr>
    <tr>
      <td>A numerical UID for an <code>AUTH_SYS</code> user, in the following format:<br><code>&lt;numeric_uid&gt;</code></td>
      <td><code>1234</code></td>
      <td>For this trustee in the ACE, the system stores this UID on disk.</td>
      <td class="align-center">&mdash;</td>
    </tr>
    <tr>
      <td>A numerical GID for an <code>AUTH_SYS</code> user, in the following format:<br><code>&lt;numeric_gid&gt;</code></td>
      <td><code>5678</code></td>
      <td>For this trustee in the ACE, the system stores the GID on disk.</td>
      <td>To avoid having the group interpreted as a user, you must <a href="#additional-ace-flags">specify the group flag</a>.</td>
    </tr>
    <tr>
      <td>A user local to a Qumulo cluster (that is, a user that was created by using Qumulo Core Web UI or the <code>qq</code> CLI), in the following format:<br><code>qumulo_local/&lt;username&gt;</code></td>
      <td><code>qumulo_local/localuser1</code></td>
      <td>For the trustee in this ACE, the system stores this user as a local user.</td>
      <td class="align-center">&mdash;</td>
    </tr>
    <tr>
      <td>A group local to a Qumulo cluster (that is, a group created by using the Qumulo Core Web UI or the <code>qq</code> CLI), in the following format:<br><code>qumulo_local/&lt;groupname&gt;</code></td>
      <td><code>qumulo_local/localgroup1</code></td>
      <td>For the trustee in this ACE, the system stores this group as a local group, on disk.</td>
      <td>Because local Qumulo users and groups can't share a name, the group flag isn't necessary to show this is a group.</td>
    </tr>
    <tr>
      <td>Any user of the file system, in the following format:<br><code>EVERYONE@</code></td>
      <td class="align-center">&mdash;</td>
      <td class="align-center">&mdash;</td>
      <td class="align-center">&mdash;</td>
    </tr>
    <tr>
      <td>The group owner of a file, in the following format:<br><code>GROUP@</code></td>
      <td class="align-center">&mdash;</td>
      <td class="align-center">&mdash;</td>
      <td class="align-center">&mdash;</td>
    </tr>
    <tr>
      <td>The owner of a file, in the following format:<br><code>OWNER@</code></td>
      <td class="align-center">&mdash;</td>
      <td class="align-center">&mdash;</td>
      <td class="align-center">&mdash;</td>
    </tr>
  </tbody>
</table>

You can use all trustee representations interchangeably, even within a single ACL. For example, the following ACL is possible for a file:

```bash
nfs4_getfacl /mnt/qumulo/my-file
```

{{ site.exampleOutput }}

```
A::user1@domain.example.com:rwatTnNcy
A:g:group1@domain.example.com:rwatTnNcy
A::1234:rwatTnNcy
A:g:5678:rwatTnNcy
A::{{site.exampleShortSID4}}:rwatTnNcy
A:g:{{site.exampleShortSID5}}:rwatTnNcy
A::qumulo_local/localuser1:rwatTnNcy
A:g:qumulo_local/localgroup1:rwatTnNcy
A::EVERYONE@:rtncy
```

#### The Access Types to Which the ACE Applies
For example:

* `r`: Read
* `t`: Read attributes
* `w`: Write

The `nfs4_setfacl` command also lets you use the following shorthand:

* `R`: Generic read
* `W`: Generic write
* `X`: Execute permissions


## Managing NFSv4.1 Permissions with ACLs and POSIX-Style Modes
You can manage NFSv4.1 access permissions by using ACLs, POSIX-style modes, or a combination of both.

* If you set an ACL on a file and then also set a mode on it, the restrictions that the mode expresses also apply to the ACL. These restrictions change or remove ACEs that apply to the owner, group, or other users.

* If you use the `OWNER@` or `GROUP@` identifiers in an ACL that allows read, write, or execute permissions, the identifiers appear in the `owner` or `group` bits of the mode when you read the file's mode.

{% include note.html content="Because the `EVERYONE@` identifier includes the owner and group of a file and the `other` bits of a mode don't apply to the owner or group, the permissions you grant to the `EVERYONE@` identifier are more broad than a mode's `other` bits." %}

## Using NFSv4.1 ACLs with SMB Access Control
NFSv4.1 ACLs are interoperable with SMB access controls. You can write and read by using both protocols. When you edit over NFS, the system represents SMB SIDs Kerberos principals.

## Changing File Owners
When you change the owner of a file, the ACEs that refer to the owner change to the new owner, for example:

### Example 1
```bash
nfs4_getfacl /mnt/qumulo/my-file
```

{{ site.exampleOutput }}

```
A::user1@domain.example.com:rwatTnNcy
A:g:group1@domain.example.com:rwatTnNcy
A::EVERYONE@:rtncy
```

### Example 2
```bash
sudo chown user2 /mnt/qumulo/my_file && \
  nfs4_getfacl /mnt/qumulo/my-file
```

{{ site.exampleOutput }}

```
A::user2@domain.example.com:rwatTnNcy
A:g:group1@domain.example.com:rwatTnNcy
A::EVERYONE@:rtncy
```

## Using Equivalent NFSv4.1 and Qumulo ACL Commands

The syntax for the `nfs4_setfacl` command is `<type>:<flags>:<principal>:<permissions>`, for example `A:fd:GROUP@:rwaDdxtTnNcCoy`. You can use equivalent NFS (`nfs4_setfacl`) and Qumulo (`qq fs_modify_acl`) CLI commands to set ACL permissions.

The following tables compare elements of NFS and Qumulo ACL permissions.

| NFSv4.1 ACL Type | Qumulo ACL Type |
| ---------------- | --------------- |
| `A`              | `Allowed`       |
| `D`              | `Denied`        |

| NFSv4.1 ACL Flag | Qumulo ACL Flag           |
| ---------------- | ------------------------- |
| `d`              | `Container inherit`       |
| `f`              | `Object inherit`          |

| NFSv4.1 Rights  | Qumulo Rights                                                     |
| --------------- | ----------------------------------------------------------------- |
| `a`             | `Extend file`                                                     |
| `c`             | `Read ACL`                                                        |
| `C`             | `Write ACL`                                                       |
| `d`             | `Delete`                                                          |
| `D`             | `Delete child`                                                    |
| `n`             | `Read EA`                                                         |
| `N`             | `Write EA`                                                        |
| `o`             | `Take Ownership`                                                  |
| `r`             | `Read contents`                                                   |
| `R`             | `Read`, `Synchronize`                                             |
| `t`             | `Read attr`                                                       |
| `T`             | `Write attr`                                                      |
| `w`             | `Write data`                                                      |
| `W`             | `Read ACL`, `Read attr`, `Synchronize`, `Write ACL`, `Write file` |
| `x`             | `Execute/Traverse`                                                |
| `X`             | `Execute/Traverse`, `Read ACL`, `Read attr`, `Synchronize`        |
| `y`             | `Synchronize`                                                     |

The following table gives examples of permissions and equivalent NFS and Qumulo CLI commands.

<table>
  <thead>
    <tr>
      <th style="width:20%">Permissions</th>
      <th style="width:40%">NFSv4.1 Command</th>
      <th style="width:40%">Qumulo Command</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Add Read Permission to File</td>
      <td><pre><code>nfs4_setfacl \
  -a "A::OWNER@:R" \
  myfile.ext</code></pre></td>
      <td><pre><code>qq fs_modify_acl \
  --path /myfile.ext \
  add_entry \
  -y Allowed \
  -t "File Owner" \
  -r 'Read' 'Read EA' 'Read attr' 'Read ACL' 'Synchronize'</code></pre></td>
    </tr>
    <tr>
      <td>Add Read and Execute Permissions to File</td>
      <td><pre><code>nfs4_setfacl \
  -a "A::EVERYONE@:rtRX" \
  myfile.ext</code></pre></td>
      <td><pre><code>qq fs_modify_acl \
  --path /myfile.ext \
  add_entry \
  -y Allowed \
  -t "EVERYONE" \
  -r 'Read' 'Read attr' 'Read EA' 'Read ACL' 'Synchronize' 'Execute/Traverse'</code></pre></td>
    </tr>
    <tr>
      <td>Add Read, Write, and Execute Permissions to File</td>
      <td><pre><code>nfs4_setfacl \
  -a "A::GROUP@:rtwRWX" \
  myfile.ext</code></pre></td>
      <td><pre><code>qq fs_modify_acl \
  --path /myfile.ext \
  add_entry \
  -y Allowed \
  -t "File Group Owner" \
  -r 'Read' 'Read attr' 'Write file' 'Read EA' 'Read ACL' 'Synchronize' 'Extend file' 'Write attr' 'Write EA' 'Write ACL' 'Execute/Traverse'</code></pre></td>
    </tr>
    <tr>
      <td>Add Full Access to File</td>
      <td><pre><code>nfs4_setfacl \
  -a "A::GROUP@:rwaDdxtTnNcCoy" \
  myfile.ext</code></pre></td>
      <td><pre><code>qq fs_modify_acl \
  --path /myfile.ext \
  add_entry \
  -y Allowed \
  -t "File Group Owner" \
  -r All</code></pre></td>
    </tr>
    <tr>
      <td>Add Deny ACE for Write and Execute Permissions on File</td>
      <td><pre><code>nfs4_setfacl \
  -a "D::OWNER@:wx" \
  myfile.ext</code></pre></td>
      <td><pre><code>qq fs_modify_acl \
  --path /myfile.ext \
  add_entry \
  -y Denied \
  -t "File Owner" \
  -r 'Write file' 'Execute/Traverse'</code></pre></td>
    </tr>
    <tr>
      <td>Add Full Access to Group File and Directory Inheritances to Directory</td>
      <td><pre><code>nfs4_setfacl \
  -a "A:fd:GROUP@:rwaDdxtTnNcCoy" \
  mydirectory</code></pre></td>
      <td><pre><code>qq fs_modify_acl \
  --path /mydirectory \
  add_entry \
  -y Allowed \
  -t "File Group Owner" \
  -r All \
  -f 'Container inherit' 'Object inherit'</code></pre></td>
    </tr>
  </tbody>
</table>
