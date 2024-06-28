## How is the Qumulo Core Product Package Different from the Qumulo USB Installer?
Whereas the Qumulo USB Installer is designed for specific models of third-party hardware bundled with Qumulo Core, the Qumulo Core Product Package is designed for installation on your own hardware.

Because Qumulo has no control over the host operating system (OS), the following are the main differences in functionality between the two.

<details>
<summary>Click to expand</summary>
<ul>
  <li><strong>Web UI:</strong> The Qumulo Core Product Package has no kiosk mode. The Web UI runs directly on your node.</li>
  <li><strong>Well-Known <code>admin</code> User:</strong> When you use the Qumulo Core Product Package, changing the <code>admin</code> user's password has no effect on the host OS. You can create your own users on the host OS.</li>
  <li><strong>Automatic SSH Configuration:</strong> Any SSH configuration set by using <a target="_blank" href="https://docs.qumulo.com/qq-cli-command-guide/multitenancy/"><code>multitenancy</code></a> REST APIs have no effect on the host OS. You must configure SSH on the host OS.</li>
  <li>
    <strong>System Partitions and Directories:</strong> The Qumulo Core Product Package has no <code>/config</code> partition for storing logs and container images or <code>/history</code> partitions for storing configuration files.
    <p>The Qumulo Core container stores logs and container images in the <code>/var/opt/qumulo/history</code> directory and configuration files in the <code>/etc/qumulo</code> directory. You can also configure your own mounts and partitions on the host OS.</p>
  </li>
</ul>
</details>
