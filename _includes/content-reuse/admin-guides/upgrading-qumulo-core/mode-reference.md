* An [_instant software upgrade_](performing-upgrades.html#instant-software-upgrade) requires restarting only the container on your nodes and has a downtime of less than 30 seconds without disruption to the operation of the cluster.
* A [_platform upgrade_](performing-upgrades.html#platform-upgrade) requires either a complete reboot (rebooting all nodes in your cluster at the same time) or a rolling reboot (rebooting the nodes in your cluster one at a time).
* A <em>quarterly upgrade</em> aggregates all improvements and fixes since the last quarterly upgrade. The version number of a quarterly upgrade ends in `.0`.

{{site.nexus.downloads}} {{site.loginRequired}}.

## Qumulo Core Upgrade Modes
For information about the most important features from each release, click the Qumulo Core version.
<table class="upgrade-mode">
  <thead>
    <th style="width:33%">Version</th>
    <th style="width:33%">Quarterly Upgrade</th>
    <th style="width:33%">Upgrade Type</th>
  </thead>
  <tbody>
    <tr>
      <td><a href="feature-log.html#qumulo-core-762">7.6.3</a></td>
      <td></td>
      <td class="instant">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-762">7.6.2</a></td>
      <td></td>
      <td class="instant">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-7611">7.6.1.1</a></td>
      <td></td>
      <td class="instant">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-7602-quarterly">7.6.0.2</a></td>
      <td><span class="emoji">✅</span></td>
      <td class="instant">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-7503-quarterly">7.5.0.3</a></td>
      <td><span class="emoji">✅</span></td>
      <td class="instant">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-7404-quarterly">7.4.0.4</a></td>
      <td><span class="emoji">✅</span></td>
      <td class="instant">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-7303-quarterly">7.3.0.3</a></td>
      <td><span class="emoji">✅</span></td>
      <td class="instant">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-7204-quarterly">7.2.0.4</a></td>
      <td><span class="emoji">✅</span></td>
      <td class="instant">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-7103-quarterly">7.1.0.3</a></td>
      <td><span class="emoji">✅</span></td>
      <td class="platform">Platform</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-7001-quarterly">7.0.0.1</a></td>
      <td><span class="emoji">✅</span></td>
      <td class="instant">Instant</td>
    </tr> 
    <tr>
      <td><a href="feature-log.html#qumulo-core-6301-quarterly">6.3.0.1</a></td>
      <td><span class="emoji">✅</span></td>
      <td class="platform">Platform</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-6201-quarterly">6.2.0.1</a></td>
      <td><span class="emoji">✅</span></td>
      <td class="instant">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-6103-quarterly">6.1.0.3</a></td>
      <td><span class="emoji">✅</span></td>
      <td class="instant">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-6002-quarterly">6.0.0.2</a></td>
      <td><span class="emoji">✅</span></td>
      <td class="instant">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-530-quarterly">5.3.0</a></td>
      <td><span class="emoji">✅</span></td>
      <td class="instant">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-5202-quarterly">5.2.0.2</a></td>
      <td><span class="emoji">✅</span></td>
      <td class="instant">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-5101-quarterly">5.1.0.1</a></td>
      <td><span class="emoji">✅</span></td>
      <td class="instant">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-5001-quarterly">5.0.0.1</a></td>
      <td><span class="emoji">✅</span></td>
      <td class="instant">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-430-quarterly">4.3.0</a></td>
      <td><span class="emoji">✅</span></td>
      <td class="instant">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-420-quarterly">4.2.0</a></td>
      <td><span class="emoji">✅</span></td>
      <td class="instant">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-4101-quarterly">4.1.0.1</a></td>
      <td><span class="emoji">✅</span></td>
      <td class="instant">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-4002-quarterly">4.0.0.2</a></td>
      <td><span class="emoji">✅</span></td>
      <td class="instant">Instant</td>
    </tr>
  </tbody>
</table>
