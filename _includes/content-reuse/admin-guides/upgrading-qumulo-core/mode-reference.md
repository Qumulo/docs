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
      <td><a href="feature-log.html#qumulo-core-793">7.9.3</a></td>
      <td></td>
      <td class="instant">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-7922">7.9.2.2</a></td>
      <td></td>
      <td class="instant">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-7911">7.9.1.1</a></td>
      <td></td>
      <td class="instant">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-7902-quarterly">7.9.0.2</a></td>
      <td><span class="emoji">✅</span></td>      
      <td class="platform">Platform</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-7843">7.8.4.3</a></td>
      <td></td>
      <td class="instant">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-7831">7.8.3.1</a></td>
      <td></td>
      <td class="instant">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-7821">7.8.2.1</a></td>
      <td></td>
      <td class="instant">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-7811">7.8.1.1</a></td>
      <td></td>
      <td class="instant">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-7804-quarterly">7.8.0.4</a></td>
      <td><span class="emoji">✅</span></td>
      <td class="instant">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-7751">7.7.5.1</a></td>
      <td></td>
      <td class="instant">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-7741">7.7.4.1</a></td>
      <td></td>
      <td class="instant">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-773">7.7.3</a></td>
      <td></td>
      <td class="instant">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-772">7.7.2</a></td>
      <td></td>
      <td class="instant">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-7711">7.7.1.1</a></td>
      <td></td>
      <td class="instant">Instant</td>
    </tr>
    <tr>
      <td class="align-middle" rowspan="2"><a href="feature-log.html#qumulo-core-7703-quarterly">7.7.0.3</a></td>
      <td class="align-middle" rowspan="2"><span class="emoji">✅</span></td>
      <td class="instant">Instant from<br>7.7.0.2</td>
    </tr>
    <tr>
      <td class="platform">Platform from<br>7.7.0 or 7.7.0.1</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-7641">7.6.4.1</a></td>
      <td></td>
      <td class="instant">Instant</td>
    </tr>      
    <tr>
      <td><a href="feature-log.html#qumulo-core-7631">7.6.3.1</a></td>
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
      <td><a href="feature-log.html#qumulo-core-7552">7.5.5.2</a></td>
      <td></td>
      <td class="instant">Instant</td>
    </tr>      
    <tr>
      <td><a href="feature-log.html#qumulo-core-7542">7.5.4.2</a></td>
      <td></td>
      <td class="instant">Instant</td>
    </tr>      
    <tr>
      <td><a href="feature-log.html#qumulo-core-753">7.5.3</a></td>
      <td></td>
      <td class="instant">Instant</td>
    </tr>      
    <tr>
      <td><a href="feature-log.html#qumulo-core-752">7.5.2</a></td>
      <td></td>
      <td class="instant">Instant</td>
    </tr>      
    <tr>
      <td><a href="feature-log.html#qumulo-core-7512">7.5.1.2</a></td>
      <td></td>
      <td class="instant">Instant</td>
    </tr>      
    <tr>
      <td><a href="feature-log.html#qumulo-core-7503-quarterly">7.5.0.3</a></td>
      <td><span class="emoji">✅</span></td>
      <td class="instant">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-744">7.4.4</a></td>
      <td></td>
      <td class="platform">Platform</td>
    </tr>      
    <tr>
      <td><a href="feature-log.html#qumulo-core-7431">7.4.3.1</a></td>
      <td></td>
      <td class="instant">Instant</td>
    </tr>      
    <tr>
      <td><a href="feature-log.html#qumulo-core-7421">7.4.2.1</a></td>
      <td></td>
      <td class="instant">Instant</td>
    </tr>      
    <tr>
      <td><a href="feature-log.html#qumulo-core-7411">7.4.1.1</a></td>
      <td></td>
      <td class="instant">Instant</td>
    </tr>      
  </tbody>
</table>
