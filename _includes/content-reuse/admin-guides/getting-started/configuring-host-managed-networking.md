## Configuring Interface Tagging with Alternative Names
In Linux, the alternative name (`altname`) is an optional, user-defined alias for a network interface. For more information see [`ip link`](https://man7.org/linux/man-pages/man8/ip-link.8.html) in Linux documentation.

In Qumulo Core, alternative names let you use the Qumulo REST API to configure floating IP addresses for your Qumulo cluster and to assign the roles of _front end_ (for client traffic) or _back end_ (for inter-node traffic) to network interfaces. Without alternative names, Qumulo Core uses all valid and connected network interfaces.

### To Enable Alternative Names
You can configure alternative names to be always enabled while `systemd-networkd` is operating.

1. To your `/etc/systemd/network/` directory, add the file `10-altname.link`.

1. Add the PCI address and alternative name for the network interface to the `10-altname.link` file. For example:

   ```
   [Match]
   Path=pci-0000:01:00.0
   [Link]
   AlternativeNames=qumulo-backend
   ```

1. To enable the changes, restart `systemd-networkd`.

   {% include note.html content="If you use another networking manager, consult its documentation for information about enabling alternative names permanently." %}

1. To put your alternative names into effect, restart QFSD.

### Assigning a Front-End of Back-End Role to a Network Interface

* To assign the _front-end_ role to a network interface, for serving client traffic, run the `ip link` command and specify the network interface name and the alternative name (which includes the network ID).

  In the following example, the network interface name is `eth0` and the alternative name is `qumulo-frontend1` (the network ID is `1`).

  ```bash
  sudo ip link \
    property add \
    dev eth0 \
    altname qumulo-frontend1
  ```

* To assign the _back-end_ role to a network interface, for inter-node communication, run the `ip link` command and specify the network interface name and the alternative name.

  In the following example, the network interface name is `eth1` and the alternative name is `qumulo-backend`.

  ```bash
  sudo ip link \
    property add \
    dev eth1 \
    altname qumulo-backend
  ```

  {% include note.html content="Qumulo Core permits only one interface to be tagged as `qumulo-backend`." %}


### Example Configurations
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
    <p><strong>Three Network Interfaces with a Link:</strong> Qumulo Core labels the interface with the lowest PCIe address as <code>USE_FOR_<wbr>FRONTEND_AND_<wbr>BACKEND</code> and the interfaces with the next highest an the highest PCIe addresses as <code>USE_FOR_<wbr>FRONTEND</code>.</p>
    {% include note.html content="Although the interface with the lowest PCIe address is labeled for both front-end and back-end connections, only front-end traffic flows through this interface." %}
  </li>
</ul>
</details>
