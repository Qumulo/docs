## Step 1: Connecting the Out-of-Band Management (iRMC) Port
The dedicated out-of-band management port allows functionality such as remote display, control, and power. The port uses the Integrated Remote Management Controller (iRMC) protocol. Connect the iRMC port first on the back of your node (the bottom Ethernet port).

{{site.data.alerts.important}}
<ul>
  <li>The list of iRMC accounts contains the user <code>qumulo_&lt;random&gt;</code>. This account is critical for Qumulo Core functionality. Don't disable or tamper with it. To manage your Qumulo cluster's hardware, create your own iRMC user account.</li>
  <li>The iRMC username and password are unrelated to your Qumulo administrative credentials.</li>
</ul>
{{site.data.alerts.end}}
