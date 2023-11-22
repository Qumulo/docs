## Step 1: Connecting the Out-of-Band Management (IPMI) Port
The dedicated out-of-band management port allows functionality such as remote display, control, and power. The port uses the Intelligent Platform Management Interface (IPMI) protocol. Connect the IPMI port first on the back of your node (above the USB ports).

{{site.data.alerts.important}}
<ul>
  <li>The list of IPMI accounts contains the user <code>qumulo_&lt;random&gt;</code>. This account is critical for Qumulo Core functionality. Don't disable or tamper with it. To manage your Qumulo cluster's hardware, create your own IPMI user account.</li>
  <li>The IMPI username and password are unrelated to your Qumulo administrative credentials.</li>
</ul>
{{site.data.alerts.end}}
