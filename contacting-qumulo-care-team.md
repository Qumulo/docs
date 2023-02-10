---
title: "Contacting the Qumulo Care Team"
summary: "This section explains how to contact the Qumulo Care team through Slack, email, or by phone."
permalink: contacting-qumulo-care-team.html
sidebar: home_sidebar
breadcrumbs: exclude
keywords: contact, qumulo care, care, support, tech support, tech, support, help, customer service, service, customer
---

We make sure that every one of our engineers has deep experience with file storage systems; knows the appropriate workflows, software, and hardware; and can get you the answers you need quickly.

We take pride in helping our customers and coming up with solutions for every specific issue.

## Ways to Get Help
The Qumulo Care team is always here to help you. You can contact us by using any of the following ways.

* 📚 Browse the [Qumulo Knowledge Base](https://care.qumulo.com/hc/en-us/categories/115000637447)

* <a id="open-a-case"></a>🧑‍💻 Open a case by [filing a request](https://care.qumulo.com/hc/en-us/requests/new) or [emailing us](mailto:care@qumulo.com).

* 💬 [Message us on Slack](https://qumulocare.slack.com/) (if you are a current customer). For more information, see our [Slack Tips and Tricks](#slack-tips-and-tricks).

* <a id="toll-free-numbers"></a>📱 Call one of our toll-free numbers:

  * **North America:** [+1 855-577-7544](tel:+18555777544)

  * **United Kingdom:** [+44 808-164-6656](tel:+448081646656)

  * **Germany:** [+49 800-000-7047](tel:+498000007047)

  * **Australia:** [+61 1800-954-952](tel:+611800954952)
  
  * **U.S. Government Customers:** [+1 844-962-3777](tel:+18449623777)

## Support Hours
The Qumulo Care team is available Monday to Friday, 24&times;5 to answer your questions and requests. During off hours, a team member is on call 24&times;7 for when you might need help the most.

## Qumulo Care Response Times
The service availability and initial response time vary based on an issue's severity level, starting from the time when the Qumulo Care team first learns about the issue.

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

## Slack Tips and Tricks
The Qumulo Care team monitors the [qumulocare Slack channel](https://qumulocare.slack.com/) during our normal Monday-to-Friday, 24&times;5 standard support hours. If you are currently a Qumulo customer, the fastest way to reach us is by using your dedicated Slack channel.

The following are some tips and tricks that can help you get the most out of making requests through Slack.

* Keep all communications with the Qumulo Care team in your dedicated Slack channel.

  * If you haven't been working with a specific member of the Qumulo Care team, include `@here` in your first message to notify the present Qumulo Care team members of your request.

  * If you've been working with a specific member of the Qumulo Care team, use `@<name>` in your dedicated Slack channel. If that team member is unavailable, another Qumulo Care team member responds to your request.

* Check **Also send to #&lt;channel&gt;** whenever you reply to a message thread.
