<table>
<thead>
  <tr>
    <th>Severity Level</th>
    <th>Service Availability</th>
    <th>Response Time</th>
    <th>Description</th>
    <th>Example</th>   
  </tr>
</thead>
<tbody>
  <tr style="background:rgb(255 153 153 / 0.75);">
    <td>0</td>
    <td>24&times;7</td>   
    <td>2 hours</td>
    <td>
      <p>Outage, data unavailability, or data loss</p>
      {% include important.html content="For Severity 0 cases, call one of our <a href='#toll-free-numbers'>toll-free numbers</a> or select <strong>Severity 0</strong> when you <a href='#open-a-case'>open a case</a>." %}
    </td>
    <td>The Qumulo cluster is down or there aren't enough online nodes to form a quorum.</td>   
  </tr>
  <tr style="background:rgb(255 153 153 / 0.5);">
    <td>1</td>
    <td>24&times;7</td>   
    <td>2 hours</td>
    <td>High business impact while the Qumulo cluster is still available and functional</td>
    <td>A node is down but the cluster's quorum is still intact.</td>   
  </tr>
  <tr style="background:rgb(255 153 153 / 0.25);">
    <td>2</td>
    <td>24&times;5</td>   
    <td>2 hours</td>
    <td>A serious issue with an available workaround</td>
    <td>When you use <code>ls</code> and <code>dd</code> commands from the same client, the performance is poor. The workaround is to mount to two different nodes and run the <code>ls</code> command for the first node and the <code>dd</code> command for the second.</td>   
  </tr>
  <tr style="background:rgb(255 153 153 / 0.125);">
    <td>3</td>
    <td>24&times;5</td>   
    <td>6 hours</td>
    <td>Poor or frustrating user experience</td>
    <td>In the Web UI, a dialog box lingers for about five seconds after a change.</td>   
  </tr>
  <tr style="background:rgb(255 153 153 / 0.0625);">
    <td>4</td>
    <td>24&times;5</td>   
    <td>6 hours</td>
    <td>Cosmetic issues or other concerns</td>
    <td>The background color of a dialog box makes text difficult to read.</td>   
  </tr>   
</tbody>
</table>
