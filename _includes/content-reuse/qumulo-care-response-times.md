<table>
<thead>
  <tr>
    <th style="text-align:center;">Severity Level</th>
    <th style="text-align:center;">Service Availability</th>
    <th style="text-align:center;">Response Time</th>
    <th style="text-align:center;">Description</th>
    <th style="text-align:center;">Common Examples</th>   
  </tr>
</thead>
<tbody>
  <tr style="background:rgb(255 153 153 / 0.75);">
    <td>Sev0</td>
    <td>24&times;7</td>   
    <td>30 minutes</td>
    <td>
      <p><strong>Business Impacting:</strong> A Qumulo cluster is offline, impacting regular business operations, with potential productivity or financial losses.</p>
      {% include important.html content="For Severity 0 cases, call one of our <a href='#toll-free-numbers'>toll-free numbers</a> or select <strong>Severity 0</strong> when you <a href='#open-a-case'>open a case</a>." %}
    </td>
    <td>
      <ul>
        <li>A Qumulo cluster is unable to form a quorum</li>
        <li>A Qumulo cluster is unable to maintain a quorum</li>
      </ul>
    </td>   
  </tr>
  <tr style="background:rgb(255 153 153 / 0.5);">
    <td>Sev1</td>
    <td>24&times;7</td>   
    <td>1 hour</td>
    <td><strong>High Priority:</strong> A Qumulo cluster is operational. However, a node is offline or the cluster experiences a severe performance degradation.</td>
    <td>
      <ul>
        <li>A node in a Qumulo cluster is offline.</li>
        <li>Multiple business units experience degraded performance.</li>
      </ul>
    </td>   
  </tr>
  <tr style="background:rgb(255 153 153 / 0.25);">
    <td>Sev2</td>
    <td>24&times;5</td>   
    <td>2 hours</td>
    <td><strong>Normal Priority:</strong> A Qumulo cluster and the Qumulo Core software are operational. However, an issue with the cluster or moderate performance degradation causes applications to operate suboptimally.</td>
    <td>
      <ul>
        <li>CPU cores recover to normal operation</li>
        <li>Drive failures (within expected parameters)</li>
        <li>Inconsistent performance issues</li>
      </ul>
    </td>   
  </tr>
  <tr style="background:rgb(255 153 153 / 0.125);">
    <td>Sev3</td>
    <td>24&times;5</td>   
    <td>6 hours</td>
    <td><strong>Low Priority:</strong> A Qumulo cluster or the Qumulo Core software experiences an issue, cosmetic Web UI defect, or minor performance degradation that has minimal or negligible impact on a production system or regular business operations.</td>
    <td>
      <ul>
        <li>PSU failure</li>
        <li>Loss of communication with Cloud-Based Monitoring</li>
        <li>Upgrade issues</li>
      </ul>
    </td>   
  </tr>
  <tr style="background:rgb(255 153 153 / 0.0625);">
    <td>Sev4</td>
    <td>24&times;5</td>   
    <td>6 hours</td>
    <td><strong>Informational:</strong> Informal inquiries about product functionality</td>
    <td>
      <ul>
        <li>Questions about Qumulo Core configuration</li>
        <li>Documentation requests</li>
        <li>Qumulo Care Slack channel access permissions</li>
      </ul>
    </td>   
  </tr>   
</tbody>
</table>
