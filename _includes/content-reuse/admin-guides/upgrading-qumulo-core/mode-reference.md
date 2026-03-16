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
      <td><a href="feature-log.html#qumulo-core-7811">7.8.1.1</a></td>
      <td></td>
      <td class="instant">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-7801-quarterly">7.8.0.1</a></td>
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
      <td><a href="feature-log.html#qumulo-core-7702-quarterly">7.7.0.2</a></td>
      <td><span class="emoji">✅</span></td>
      <td class="platform">Platform</td>
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
    <tr>
      <td><a href="feature-log.html#qumulo-core-7404-quarterly">7.4.0.4</a></td>
      <td><span class="emoji">✅</span></td>
      <td class="instant">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-7321">7.3.2.1</a></td>
      <td></td>
      <td class="instant">Instant</td>
    </tr>      
    <tr>
      <td><a href="feature-log.html#qumulo-core-7312">7.3.1.2</a></td>
      <td></td>
      <td class="instant">Instant</td>
    </tr>      
    <tr>
      <td><a href="feature-log.html#qumulo-core-7303-quarterly">7.3.0.3</a></td>
      <td><span class="emoji">✅</span></td>
      <td class="instant">Instant</td>
    </tr>
    <tr>
      <td><a href="feature-log.html#qumulo-core-7232">7.2.3.2</a></td>
      <td></td>
      <td class="instant">Instant</td>
    </tr>      
    <tr>
      <td><a href="feature-log.html#qumulo-core-722">7.2.2</a></td>
      <td></td>
      <td class="instant">Instant</td>
    </tr>  
    <tr>
      <td><a href="feature-log.html#qumulo-core-7211">7.2.1.1</a></td>
      <td></td>
      <td class="instant">Instant</td>
    </tr>    
    <tr>
      <td><a href="feature-log.html#qumulo-core-7204-quarterly">7.2.0.4</a></td>
      <td><span class="emoji">✅</span></td>
      <td class="instant">Instant</td>
    </tr>
  </tbody>
</table>
