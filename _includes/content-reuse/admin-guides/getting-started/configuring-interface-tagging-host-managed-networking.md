{% include content-reuse/admin-guides/getting-started/host-managed-vs-qumulo-managed-networking.md %}

## How Alternative Names Work in Qumulo Core
In Linux, the alternative name (`altname`) is an optional, user-defined alias for a network interface. For more information see [`ip link`](https://man7.org/linux/man-pages/man8/ip-link.8.html) in Linux documentation.

In Qumulo Core, alternative names let you use the Qumulo REST API to configure floating IP addresses for your Qumulo cluster when using Host-Managed Networking and to assign the roles of _front end_ (for client traffic) or _back end_ (for inter-node traffic) to network interfaces. Without alternative names, Qumulo Core uses all valid and connected network interfaces.


## Enabling Persistent Alternative Names
This section explains how to configure alternative names to be always enabled while `systemd-networkd` is running by using a `10-altname.link` file or by creating a `systemd` service.

### To Enable Persistent Alternative Names by Using a .link File
If you use `systemd-networkd` as your network manager, you can let the network configuration system manage alternative names directly by creating a `.link` file.

1. Use SSH to connect to your node.

1. Create the `10-altname.link` file in the `/etc/systemd/network/` directory.

1. Add one of the following to the `10-altname.link` file:

   * The PCI address of the NIC and the corresponding alternative name

     For example:
  
     ```ini
     [Match]
     Path=pci-0000:01:00.0

     [Link]
     AlternativeNames=qumulo-backend
     ```

   * The permanent MAC address of the NIC and the corresponding alternative name
  
     {% include important.html content="If you change the NIC in the node, you must update the `10-altname.link` file." %}

     ```ini
     [Match]
     PermanentMACAddress=b4:96:91:f6:33:1c

     [Link]
     AlternativeNames=qumulo-backend
     ```
     
1. To enable the alternative names, restart `systemd-networkd`.

### To Enable Persistent Alternative Names by Creating a systemd Service
If you use a network manager other than `systemd-networkd` or need an alternative name configuration that doesn't depend on a specific networking manager, you can configure a `systemd` service.

#### Step 1: Create the Alternative Name Script

1. Use SSH to connect to your node.

1. Create the `qumulo_set_altname.sh` script in the `/var/opt/qumulo/altname/` directory.

1. Add the alternative name commands to the `qumulo_set_altname.sh` file. For example:

   ```bash
   #!/bin/bash
   /usr/sbin/ip link property add dev bond0 altname qumulo-frontend1
   /usr/sbin/ip link property add dev bond0 altname qumulo-backend
   ```
   
1. Use the `chmod +x` command to make the script executable.

#### Step 2: Create the Service Definition
1. Create the `qumulo-set-altname.service` file in the `/etc/systemd/system/` directory.

1. Add the service definition to the `qumulo-set-altname.service` file. For example:

   ```ini
   [Unit]
   Description=Assign Qumulo altname to frontend NIC
   After=network-pre.target
   Before=network.target

   [Service]
   Type=oneshot
   ExecStart=/var/opt/qumulo/altname/qumulo_set_altname.sh

   [Install]
   WantedBy=multi-user.target
   ```

   In this example, the `ExecStart` parameter specifies the location of the `qumulo_set_altname.sh` file.

#### Step 3: Start the Service
1. To configure your service to start with the node, run the `systemctl` command and specify the service name.

   ```bash
   systemctl enable qumulo-set-altname.service
   ```

1. To start the service and enable alternative names immediately, do one of the following:

   * Restart the node
     
   * Run the `systemctl start qumulo-set-altname.service` command.


## Assigning Front-End and Back-End Roles to a Network Interface (NIC)
This section explains how to assign front-end and back-end roles by applying an alternative name to a network interface.

### To Assign the Front-End Role to a NIC
The front-end role instructs a NIC to serve client traffic. To assign this role, run the `ip link` command and specify the network interface name and the alternative name (which includes the network ID).

In the following example, the network interface name is `eth0` and the alternative name is `qumulo-frontend1` (the network ID is `1`).

```bash
sudo ip link property add \
  dev eth0 \
  altname qumulo-frontend1
```

### To Assign the Back-End Role to a NIC
The back-end role instructs a NIC to facilitate inter-node communication. To assign this role, run the `ip link` command and specify the network interface name and the alternative name.

{% include note.html content="Qumulo Core permits only one interface to be tagged as `qumulo-backend`." %}

In the following example, the network interface name is `eth1` and the alternative name is `qumulo-backend`.

```bash
sudo ip link property add \
  dev eth1 \
  altname qumulo-backend
```

## Example Network Configurations
This section gives examples of network configurations with and without alternative names for front-end client traffic, back-end inter-node traffic, and combined QFSD traffic.

<details>
<summary>Click to expand</summary>
<h4>Example Configurations with Alternative Names</h4>
<ul>
  <li>
    <strong>Two Network Interfaces with a Link (Front-End and Back-End):</strong> In the following example, Qumulo Core labels interface <code>eth0</code> as <code>USE_FOR_FRONTEND</code> and <code>eth1</code> (the interface with a higher PCIe address) as <code>USE_FOR_BACKEND</code>.

    <div class="language-bash highlighter-rouge"><div class="highlight">
<pre class="highlight"><code><span class="nb">sudo</span> ip <span class="nb">link</span> <span class="se">\</span>
  property add <span class="se">\</span>
  dev eth0 <span class="se">\</span>
  altname qumulo-frontend1</code></pre></div>
    </div>

    <div class="language-bash highlighter-rouge"><div class="highlight">
<pre class="highlight"><code><span class="nb">sudo</span> ip <span class="nb">link</span> <span class="se">\</span>
  property add <span class="se">\</span>
  dev eth1 <span class="se">\</span>
  altname qumulo-backend</code></pre></div>
    </div>
  </li>
  <li>
    <strong>Two Network Interfaces with a Link (Front-End and Back-End on the Same Link):</strong> In the following example, Qumulo Core labels interface <code>eth0</code> with <code>USE_FOR_FRONTEND_AND_BACKEND</code>, and uses only <code>eth0</code> for QFSD traffic.

    <div class="language-bash highlighter-rouge"><div class="highlight">
<pre class="highlight"><code><span class="nb">sudo</span> ip <span class="nb">link</span> <span class="se">\</span>
  property add <span class="se">\</span>
  dev eth0 <span class="se">\</span>
  altname qumulo-frontend1</code></pre></div>
    </div>

    <div class="language-bash highlighter-rouge"><div class="highlight">
<pre class="highlight"><code><span class="nb">sudo</span> ip <span class="nb">link</span> <span class="se">\</span>
  property add <span class="se">\</span>
  dev eth0 <span class="se">\</span>
  altname qumulo-backend</code></pre></div>
    </div>
  </li>
  <li>
    <strong>Three Network Interfaces with a Link (Three Front-End and One Back-End on the Same Link):</strong> In the following example, Qumulo Core labels interfaces <code>eth0</code> and <code>eth1</code> as <code>USE_FOR_FRONTEND</code> and <code>eth2</code> as <code>USE_FOR_FRONTEND_AND_BACKEND</code>.

  <div class="language-bash highlighter-rouge"><div class="highlight">
<pre class="highlight"><code><span class="nb">sudo</span> ip <span class="nb">link</span> <span class="se">\</span>
  property add <span class="se">\</span>
  dev eth0 <span class="se">\</span>
  altname qumulo-frontend1</code></pre></div>
    </div>

    <div class="language-bash highlighter-rouge"><div class="highlight">
<pre class="highlight"><code><span class="nb">sudo</span> ip <span class="nb">link</span> <span class="se">\</span>
  property add <span class="se">\</span>
  dev eth1 <span class="se">\</span>
  altname qumulo-frontend2</code></pre></div>
    </div>

    <div class="language-bash highlighter-rouge"><div class="highlight">
<pre class="highlight"><code><span class="nb">sudo</span> ip <span class="nb">link</span> <span class="se">\</span>
  property add <span class="se">\</span>
  dev eth2 <span class="se">\</span>
  altname qumulo-frontend3</code></pre></div>
    </div>

    <div class="language-bash highlighter-rouge"><div class="highlight">
<pre class="highlight"><code><span class="nb">sudo</span> ip <span class="nb">link</span> <span class="se">\</span>
  property add <span class="se">\</span>
  dev eth2 <span class="se">\</span>
  altname qumulo-backend</code></pre></div>
    </div>
  </li>
</ul>

<h4>Example Network Interface Labels without Alternative Names</h4>
<ul>
  <li><strong>One Network Interface with a Link:</strong> Qumulo Core labels the interface with <code>USE_FOR_<wbr>FRONTEND_AND_<wbr>BACKEND</code>.</li>
  <li><strong>Two Network Interfaces with a Link:</strong> Qumulo Core labels the interface with the lower PCIe address as <code>USE_FOR_<wbr>FRONTEND_AND_<wbr>BACKEND</code> and the interface with the higher PCIe address as <code>USE_FOR_<wbr>FRONTEND</code>.</li>
  <li>
    <p><strong>Three Network Interfaces with a Link:</strong> Qumulo Core labels the interface with the lowest PCIe address as <code>USE_FOR_<wbr>FRONTEND_AND_<wbr>BACKEND</code> and the interfaces with the next highest and the highest PCIe addresses as <code>USE_FOR_<wbr>FRONTEND</code>.</p>
    {% include note.html content="Although the interface with the lowest PCIe address is labeled for both front-end and back-end connections, only front-end traffic flows through this interface." %}
  </li>
</ul>
</details>
