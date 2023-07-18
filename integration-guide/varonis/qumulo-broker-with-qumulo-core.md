---
title: "How Qumulo Core Integrates with Varonis"
summary: "This section explains how Qumulo Core integrates with Varonis by using Qumulo Broker."
permalink: /integration-guide/varonis/qumulo-broker-with-qumulo-core.html
redirect_from:
  - /integration-guide/qumulo-broker/qumulo-broker-with-qumulo-core.html
  - /integration-guide/varonis-collector/qumulo-core-with-varonis.html
sidebar: integration_guide_sidebar
keywords: Varonis, Qumulo Broker, integrate, integration, getting started
---

The Qumulo-Varonis integration monitors file and directory operations in Qumulo Core. When events take place in a Qumulo system, Qumulo Core adds the events to audit logs which track all actions that users take within a Qumulo namespace, including data access and modification, file system access, data sharing through new SMB shares or NFS exports, and system configuration changes. Qumulo Core uses the [Qumulo Broker](#qumulo-broker) to process and send audit logs to Varonis.


## How the Qumulo-Varonis Integration Works
This section describes how the Qumulo-Varonis integration works. It provides an overview of the integration workflow; explains how Qumulo Broker gathers, processes, and emits Qumulo Core audit logs; and describes how Qumulo Broker uses rsyslog queues to ensure efficient data transfer.

### How Qumulo Clusters Send Audit Log Data to Varonis
Qumulo Core sends audit logs for each [supported file- and directory-level operation](#supported-operations) in real time to Varonis for continuous monitoring. To detect anomalous behaviour that system administrators can use to detect potential activity from a bad actor (for example, abnormal or high-frequency changes in file activity&mdash;such as file creation, deletion, and modification&mdash;or changes to access permissions), Varonis applies machine learning to Qumulo Core audit logs and issues alerts. In addition to common patterns, Varonis uses thread feeds and blacklists to identify known ransomware and attack patterns.

The following architecture diagram shows the workflow between Qumulo Broker and Qumulo Core.

{% include note.html content="We recommend installing Qumulo Broker and Varonis in the same VLAN or VPC." %}

<a id="integration-architecture-diagram"></a>
{% include image.html alt="An Architecture Diagram of Integration Between Qumulo Broker and Qumulo Core" file="qumulo-broker-with-qumulo-core.png" url="/integration-guide/varonis/images/qumulo-broker-with-qumulo-core.png" %}

{% include note.html content="Although Qumulo currently is certified only for the Varonis SaaS offering, you can configure and use the SaaS offering with an on-premises Qumulo cluster." %}

<a id="qumulo-broker"></a>
### How Qumulo Broker Gathers, Processes, and Emits Data
In Qumulo Core, each audit log has a specific logging requirement (for example, certain log types include only specific fields). Although normally Qumulo Core outputs audit logs in CSV format, it can output these additional fields in JSON format. For more information, see [Configure Qumulo Audit Logging by Using the qq CLI](deploying-qumulo-broker.html#configure-audit-logging).

Typically, Qumulo Core sends the audit logs to a single remote syslog instance. In the Qumulo-Varonis integration, Qumulo Broker receives the audit logs from multiple Qumulo clusters, converts them to various formats, and then sends them to Varonis.

{% include note.html content="Qumulo Core can send audit logs to only one target syslog instance. For information about sending your Qumulo audit logs to different target systems in addition to Varonis, see [Configuring rsyslog to Communicate with Multiple Clusters](deploying-qumulo-broker.html#rsyslog-with-multiple-clusters)." %}

The following architecture diagram shows how Qumulo Broker gathers, processes, and emits data.

{% include image.html alt="An Architecture Diagram that Shows how Qumulo Broker Gathers, Processes, and Emits Data" file="how-qumulo-broker-works.png" url="/integration-guide/varonis/images/how-qumulo-broker-works.png" %}


## Qumulo Broker Specifications
This section describes the specifications for Qumulo Broker, including system requirements, prerequisites, firewall definitions, and supported operations. {{site.varonis.separateMachine}} For more information, see the [Qumulo-Varonis integration architecture diagram](#integration-architecture-diagram).

### System Requirements
We recommend the following system requirements for Qumulo Broker.

* 8-core processor

* 16 GB memory

* 200 GB disk space

### Prerequisites
Deploying [Qumulo Broker](https://github.com/Qumulo/QumuloBroker) requires:

* Qumulo Core 6.0.2 (and higher)

* Git

* Docker 23.0.1 (and higher)

* rsyslog 8.2001 (and higher)

### Firewall Definitions
In addition to the Varonis firewall requirements, you must also define the following firewall rules for Qumulo Broker connections.

<table>
  <thead>
    <tr>
      <th>Port</th>
      <th>Protocol</th>	    
      <th>Source IP address</th>
      <th>Destination IP address</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>22</td>
      <td>TCP</td>	    
      <td>The system administrator's machine</td>
      <td>Qumulo Broker</td>	    	    
      <td>Qumulo Broker SSH connection</td>
    </tr>
    <tr>
      <td>443</td>
      <td>TCP</td>	    
      <td>Qumulo Broker</td>
      <td>GitHub and Docker Hub</td>	    
      <td>Temporary GitHub and Docker Hub connections from Qumulo Broker</td>
    </tr>	  
    <tr>
      <td>443</td>	    
      <td>TCP</td>	    
      <td>Varonis</td>
      <td>Qumulo Broker</td>
      <td>Qumulo Broker API calls</td>
    </tr>		  
    <tr>
      <td>514</td>	    
      <td>TCP</td>	    
      <td>Qumulo Core (persistent and floating IP addresses)</td>
      <td>Qumulo Broker</td>
      <td>Qumulo Broker Syslog connection</td>
    </tr>
    <tr>
      <td>8000</td>
      <td>TCP</td>	    
      <td>Qumulo Broker IP address</td>
      <td>Qumulo Core persistent and floating IP addresses</td>
      <td>Qumulo Core API calls from Qumulo Broker</td>
    </tr>
  </tbody>
</table>

<a id="supported-operations"></a>
### Supported Operations
Qumulo Broker supports the following file- and directory-level operations.

<table>
<thead>
  <tr>
    <th>File-Level Operations</th>
    <th>Directory-Level Operations</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td>
      <ul>
        <li>Add file permissions</li>
        <li>Add file protection</li>	      
        <li>Change file owner</li>
        <li>Create file</li>
        <li>Delete file</li>
        <li>Read file</li>
        <li>Rename file</li>
        <li>Remove file permissions</li>
        <li>Remove file protection</li>
	<li>Write to file</li>
      </ul>
    </td>
    <td>
      <ul>
        <li>Add directory permissions</li>
        <li>Add directory protection</li>
        <li>Change directory owner</li>
        <li>Create directory</li>
        <li>Delete directory</li>
        <li>Rename directory</li>
        <li>Remove directory permissions</li>
        <li>Remove directory protection</li>
      </ul>
    </td>
  </tr>
</tbody>
</table>
