* An [_instant software upgrade_](performing-upgrades.html#instant-software-upgrade) requires restarting only the container on your nodes and has a downtime of less than 30 seconds without disruption to the operation of the cluster.
* A [_platform upgrade_](performing-upgrades.html#platform-upgrade) requires either a complete reboot (rebooting all nodes in your cluster at the same time) or a rolling reboot (rebooting the nodes in your cluster one at a time).
* A <em>quarterly upgrade</em> aggregates all improvements and fixes since the last quarterly upgrade. The version number of a quarterly upgrade ends in `.0`.

{% include important.html content="Although the _upgrade types_ for on-premises upgrades and cloud upgrades are most often the same, they do occasionally diverge. For example, for Qumulo Core 5.3.1, a cloud deployment allows an instant upgrades, an on-premises deployment requires a platform upgrade." %}

{{site.nexusDownloads}} {{site.loginRequired}}.

## Qumulo Core Upgrade Modes
For information about the most important features from each release, click the Qumulo Core version.
<table width="100%">
  <thead>
    <th width="33%">Version</th>
    <th width="33%">On-Premises Upgrade Type</th>
    <th width="33%">Cloud Upgrade Type</th>      
  </thead>
  <tbody>
    <tr>
      <td><a href="feature-log.html#qumulo-core-723">7.2.3</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-722">7.2.2</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-7211">7.2.1.1</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-7202-quarterly">7.2.0.2 (Quarterly)</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-714">7.1.4</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-713">7.1.3</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr> 
    <tr>
      <td><a href="feature-log.html#qumulo-core-712">7.1.2</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr> 
    <tr>
      <td><a href="feature-log.html#qumulo-core-711">7.1.1</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr> 
    <tr>
      <td><a href="feature-log.html#qumulo-core-7101-quarterly">7.1.0.1 (Quarterly)</a></td>
      <td colspan="2" class="shared-upgrade-mode platform">Platform</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-702">7.0.2</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr> 
    <tr>
      <td><a href="feature-log.html#qumulo-core-7011">7.0.1.1</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr> 
    <tr>
      <td><a href="feature-log.html#qumulo-core-7001-quarterly">7.0.0.1 (Quarterly)</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr> 
    <tr>
      <td><a href="feature-log.html#qumulo-core-632">6.3.2</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>    
    <tr>
      <td><a href="feature-log.html#qumulo-core-6311">6.3.1.1</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-6301-quarterly">6.3.0.1 (Quarterly)</a></td>
      <td colspan="2" class="shared-upgrade-mode platform">Platform</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-6222">6.2.2.2</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-6212">6.2.1.2</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-6201-quarterly">6.2.0.1 (Quarterly)</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-6122">6.1.2.2</a></td>
      <td colspan="2" class="shared-upgrade-mode platform">Platform</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-611">6.1.1</a></td>
      <td colspan="2" class="shared-upgrade-mode platform">Platform</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-6103-quarterly">6.1.0.3 (Quarterly)</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-602">6.0.2</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>   
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-6011">6.0.1.1</a></td>
      <td colspan="2" class="shared-upgrade-mode platform">Platform</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-6002-quarterly">6.0.0.2 (Quarterly)</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-534">5.3.4</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-5331">5.3.3.1</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-532">5.3.2</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-531">5.3.1</a></td>
      <td class="platform">Platform</td>
      <td class="instant">Instant</td>    
    </tr>    
    <tr>
      <td><a href="feature-log.html#qumulo-core-530-quarterly">5.3.0 (Quarterly)</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-5251">5.2.5.1</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-524">5.2.4</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-523">5.2.3</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-522">5.2.2</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-521">5.2.1</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-5202-quarterly">5.2.0.2 (Quarterly)</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-515">5.1.5</a></td>
      <td colspan="2" class="shared-upgrade-mode platform">Platform</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-5141">5.1.4.1</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-513">5.1.3</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-512">5.1.2</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-511">5.1.1</a></td>
      <td colspan="2" class="shared-upgrade-mode platform">Platform</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-5101-quarterly">5.1.0.1 (Quarterly)</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-506">5.0.6</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-505">5.0.5</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-504">5.0.4</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-503">5.0.3</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-502">5.0.2</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-501">5.0.1</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-5001-quarterly">5.0.0.1 (Quarterly)</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-434">4.3.4</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-433">4.3.3</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-432">4.3.2</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-431">4.3.1</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-430-quarterly">4.3.0 (Quarterly)</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-426">4.2.6</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-425">4.2.5</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-424">4.2.4</a></td>
      <td colspan="2" class="shared-upgrade-mode platform">Platform</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-423">4.2.3</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-422">4.2.2</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-421">4.2.1</a></td>
      <td colspan="2" class="shared-upgrade-mode platform">Platform</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-420-quarterly">4.2.0 (Quarterly)</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-415">4.1.5</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-414">4.1.4</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-413">4.1.3</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-412">4.1.2</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-411">4.1.1</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-4101-quarterly">4.1.0.1 (Quarterly)</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-406">4.0.6</a></td>
      <td class="instant">Instant</td>
      <td class="platform">Platform</td>    
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-405">4.0.5</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-404">4.0.4</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-403">4.0.3</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-402">4.0.2</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-4011">4.0.1.1</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-4002-quarterly">4.0.0.2 (Quarterly)</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-335">3.3.5</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-334">3.3.4</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-333">3.3.3</a></td>
      <td colspan="2" class="shared-upgrade-mode">Instant</td>
    </tr>
  </tbody>
</table>
