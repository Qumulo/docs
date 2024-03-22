---
title: "How Azure Native Qumulo Works"
summary: "This section explains the main functionality of Azure Native Qumulo (ANQ) and the differences between ANQ v2 and ANQ v1, provides a feature comparison between ANQ and Qumulo on other platforms and ANQ's known limitations and compliance posture, gives an overview of deploying the service in Azure, and lists the supported Azure Regions for the service."
permalink: /azure-administrator-guide/getting-started/how-azure-native-qumulo-works.html
redirect_from:
  - /azure-guide/how-qumulo-scalable-file-service-works.html
sidebar: azure_administrator_guide_sidebar
---

{{site.azure.detailedDeploymentInstructions}}

## What is Azure Native Qumulo?
{{site.azure.qumuloOnAzureShort}} is a fully managed service that provisions a Qumulo file system and creates a resource (for managing the file system) under your Azure subscription. {{site.azure.qumuloOnAzureShort}} provides the same multi-protocol support, interfaces, and functionality as Qumulo on premises.

{{site.azure.qumuloOnAzureShort}} makes it possible to configure file protocols, quotas, replication, and other features regardless of underlying infrastructure or storage and without tracking resource quotas or costs. The service receives the latest updates and features continuously and, if any issues occur, replaces compute and storage resources automatically. 

### Names and Versions
In this guide, we refer to the features and functionality of Qumulo Core as _{{site.azure.qumuloOnAzureLong}} ({{site.azure.qumuloOnAzureShort}})_ or _the service._

Following {{site.azure.qumuloOnAzureShort}}'s initial launch, we configured the Qumulo file system in Azure to have significant flexibility and performance improvements. This configuration appears in the Azure Portal as **{{site.azure.qumuloOnAzureShort}} v2**. For more information, see [Feature Comparison with Qumulo on Other Platforms](#anq-feature-comparison).

{{site.data.alerts.note}}
<ul>
  <li>For a limited time, you can select the original <strong>{{site.azure.qumuloOnAzureShort}} v1</strong> configuration in the Azure Portal (after this time, <strong>{{site.azure.qumuloOnAzureShort}} v2</strong> remains the only available configuration).</li>
  <li>For help with expanding {{site.azure.qumuloOnAzureShort}} v1 capacity, {{site.azure.emailAzure}}.</li>
</ul>
{{site.data.alerts.end}}
   
<a id="anq-feature-comparison"></a>
### Feature Comparison with Qumulo on Other Platforms
The following table compares the features of {{site.azure.qumuloOnAzureShort}} with those of Qumulo on other platforms.

{{site.data.alerts.note}}
<p>Because {{site.azure.qumuloOnAzureShort}} is a fully managed service, direct access to hosts with SSH is unavailable. To configure the service, you can use:</p>
<ul>
  <li><a href="https://docs.qumulo.com/administrator-guide/qq-cli/getting-started.html"><code>qq</code>CLI</a>&mdash;from a remote machine</li>
  <li>Qumulo Core Web UI&mdash;by using any of the service's IP addresses</li>
</ul>
{{site.data.alerts.end}}

<table>
  <thead>
    <tr>
      <th>Feature</th>
      <th class="width-15">{{site.azure.qumuloOnAzureShort}} v2</th>
      <th class="width-15">{{site.azure.qumuloOnAzureShort}} v1</th>
      <th class="width-15">Qumulo on AWS as an AMI</th>
      <th class="width-15">Qumulo on Premises</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Automatic deployment</td>
      <td>&#10003;</td>
      <td>&#10003;</td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>Automatic infrastructure replacement</td>
      <td>&#10003;</td>
      <td>&#10003;</td>
      <td>&#10003;</td>
      <td></td>
    </tr>    
    <tr>
      <td>Automatic updates</td>
      <td>&#10003;</td>
      <td>&#10003;</td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>Availability in Cloud Marketplace</td>
      <td>&#10003;</td>
      <td>&#10003;</td>
      <td>&#10003;</td>
      <td></td>
    </tr>  
    <tr>
      <td>Customer support</td>
      <td>&#10003;</td>
      <td>&#10003;</td>
      <td>&#10003;</td>
      <td>&#10003;</td>
    </tr>
    <tr>
      <td>Integration with Azure Portal</td>
      <td>&#10003;</td>
      <td></td>
      <td></td>
      <td></td>
    </tr>      
    <tr>
      <td>Payment for preprovisioned file system capacity</td>
      <td></td>
      <td>&#10003;</td>
      <td>&#10003;</td>
      <td>&#10003;</td>
    </tr>
    <tr>
      <td>Payment for used storage space only</td>
      <td>&#10003;</td>
      <td></td>
      <td></td>
      <td></td>
    </tr>    
    <tr>
      <td>Performance scales elastically at any capacity</td>
      <td>&#10003;</td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>Performance scales with provisioned capacity</td>
      <td></td>
      <td>&#10003;</td>
      <td>&#10003;</td>
      <td>&#10003;</td>
    </tr>
    <tr>
      <td>Qumulo Core features</td>
      <td>&#10003;</td>
      <td>&#10003;</td>
      <td>&#10003;</td>
      <td>&#10003;</td>      
    </tr>
    <tr>
      <td>Simple and fast deployment under 15 Minutes</td>
      <td>&#10003;</td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
  </tbody>
</table>

### Known Limitations 
* **IPv6 Addresses:** Currently, Azure Networking features don't support IPv6 addresses.

* **Initial Authentication over SMB:** When you deploy the service initially, all users can use the SMB protocol. However, the `admin` user can authenticate over all protocols except over SMB.

  To allow the `admin` user to authenticate over the SMB protocol, change the `admin` user's password.

* **File Systems Larger than 1 PB:** This limitation applies only to {{site.azure.qumuloOnAzureShort}} v1.

  To deploy {{site.azure.qumuloOnAzureShort}} v1 instances larger than 1 PB by using the Azure Portal, {{site.azure.emailAzure}}.

### Qumulo Compliance Posture
For information about Qumulo's third-party attestations, including FIPS 140-2 Level 1, GDPR, HIPAA, and SOC 2 Type II, see [Qumulo Trust Center](https://qumulo.com/trust/).


## Deploying {{site.azure.qumuloOnAzureLong}}
This section outlines the process of configuring and deploying {{site.azure.qumuloOnAzureShort}}. {{site.azure.detailedDeploymentInstructions}}

1. You specify the following configuration.

   * **Regional Settings:** The availability zone and region. For more information, see [Supported Azure Regions](#supported-azure-regions)

   * **Networking Settings:** The virtual network in the same region. For more information, see [Virtual Networking Prerequisites](virtual-networking-prerequisites-azure-native-qumulo.html)

   * **Usable Capacity:** For {{site.azure.qumuloOnAzureShort}} v1 instances, the available file system capacity (in TB).

     {% capture v2inEB %}Because {{site.azure.qumuloOnAzureShort}} v2 instances use the Azure Blob Store capacity limit (in EB), it isn't necessary to configure usable capacity in advance.{% endcapture %}
     {% include note.html content=v2inEB %}

1. When Qumulo creates your {{site.azure.qumuloOnAzureShort}} instance, it deploys and configures the following Azure resources:
   
   * **Managed Resource Group:** This group contains the networking resources that the service deploys.

     When you create your service instance, you can specify an existing resource group or create a new one.

   * **Delegated Subnet:** The [delegated subnet](https://learn.microsoft.com/en-us/azure/virtual-network/subnet-delegation-overview) that the service uses to provision endpoints for your virtual network.

     When you create your service instance, you can specify an existing delegated subnet or create a new one..

   * **Qumulo Service Resource:** The Azure resource that represents one instance of the service.

     You can use this resource to manage and view the service configuration. 

   * **Marketplace SaaS Resource:** The Qumulo Marketplace SaaS resource that you select.

     Azure uses this resource for billing purposes.

   {% capture autoDep %}To automate the creation of {{site.azure.qumuloOnAzureShort}} instances for long-term use cases and for short-term components of automated storage workflows, use [Azure Resource Manager](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/overview).{% endcapture %}
   {% include tip.html content=autoDep %}
   

## Supported Azure Regions
The following table lists regions in US, Canada, Europe, and the UK that {{site.azure.qumuloOnAzureShort}} supports.

<table>
  <thead>
    <tr>
      <th>Geographical Location</th>
      <th width="30%">Azure Region</th>
      <th width="15%">{{site.azure.qumuloOnAzureShort}} v2</th>      
      <th width="15%">{{site.azure.qumuloOnAzureShort}} v1</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>US (Arizona)</td>
      <td>West US 3</td>
      <td>&#10003;</td>
      <td>&#10003;</td>
    </tr>
    <tr>
      <td>US (California)</td>
      <td>West US</td>
      <td></td>      
      <td>&#10003;</td>
    </tr>    
    <tr>
      <td>US (Illinois)</td>
      <td>North Central US</td>
      <td></td>      
      <td>&#10003;</td>
    </tr>    
    <tr>
      <td>US (Iowa)</td>
      <td>Central US</td>
      <td>&#10003;</td>
      <td>&#10003;</td>
    </tr>
    <tr>
      <td>US (Texas)</td>
      <td>South Central US</td>
      <td>&#10003;</td>
      <td>&#10003;</td>
    </tr>    
    <tr>
      <td>US (Virginia)</td>
      <td>East US</td>
      <td>&#10003;</td>
      <td>&#10003;</td>
    </tr>
    <tr>
      <td>US (Virginia)</td>
      <td>East US 2</td>
      <td>&#10003;</td>
      <td>&#10003;</td>
    </tr>
    <tr>
      <td>US (Washington)</td>
      <td>West US 2</td>
      <td>&#10003;</td>
      <td>&#10003;</td>
    </tr>
    <tr>
      <td>Canada (Toronto)</td>
      <td>Canada Central</td>
      <td>&#10003;</td>
      <td>&#10003;</td>
    </tr>
    <tr>
      <td>Europe (Frankfurt)</td>
      <td>Germany West Central</td>
      <td>&#10003;</td>
      <td>&#10003;</td>
    </tr>
    <tr>
      <td>Europe (G&auml;vle)</td>
      <td>Sweden Central</td>
      <td>&#10003;</td>
      <td>&#10003;</td>
    </tr>
    <tr>
      <td>Europe (Ireland)</td>
      <td>North Europe</td>
      <td>&#10003;</td>
      <td>&#10003;</td>
    </tr>
    <tr>
      <td>Europe (Netherlands)</td>
      <td>West Europe</td>
      <td>&#10003;</td>
      <td>&#10003;</td>
    </tr>    
    <tr>
      <td>Europe (Oslo)</td>
      <td>Norway East</td>
      <td>&#10003;</td>
      <td>&#10003;</td>
    </tr>    
    <tr>
      <td>Europe (Paris)</td>
      <td>France Central</td>
      <td>&#10003;</td>
      <td>&#10003;</td>
    </tr>
    <tr>
      <td>Europe (Zurich)</td>
      <td>Switzerland North</td>
      <td>&#10003;</td>
      <td>&#10003;</td>
    </tr>
    <tr>
      <td>UK (London)</td>
      <td>UK South</td>
      <td>&#10003;</td>
      <td>&#10003;</td>
    </tr>
    <tr>
      <td>Australia (New South Wales)</td>
      <td>Australia East</td>
      <td>&#10003;</td>
      <td></td>
    </tr>
    <tr>
      <td>Brazil (S&atilde;o Paulo State)</td>
      <td>Brazil South</td>
      <td>&#10003;</td>
      <td></td>
    </tr>
    <tr>
      <td>India (Pune)</td>
      <td>Central India</td>
      <td>&#10003;</td>
      <td></td>
    </tr>
    <tr>
      <td>Japan (Tokyo, Saitama)</td>
      <td>Japan East</td>
      <td>&#10003;</td>
      <td></td>
    </tr>
    <tr>
      <td>Korea (Seoul)</td>
      <td>Korea Central</td>
      <td>&#10003;</td>
      <td></td>
    </tr>
    <tr>
      <td>UAE (Dubai)</td>
      <td>UAE North</td>
      <td>&#10003;</td>
      <td></td>
    </tr>
  </tbody>
</table>

## Usage Metering and Billing for {{site.azure.qumuloOnAzureLong}}
Once an hour, {{site.azure.qumuloOnAzureShort}} reports a metering event to Azure Marketplace for each deployed instance. 

{% capture differentDimensions %}{{site.azure.qumuloOnAzureShort}} v1 and {{site.azure.qumuloOnAzureShort}} v2 use different dimensions for metering.{% endcapture %}
{% include note.html content=differentDimensions %}

### {{site.azure.qumuloOnAzureShort}} v1 Metering for Total Available Capacity
Qumulo provisions {{site.azure.qumuloOnAzureShort}} v1 instances with a total available capacity (to increase this capacity, you can {{site.contactQumuloCare}}).

Qumulo performs metering on a single dimension&mdash;the total available capacity that your instance reports.

### {{site.azure.qumuloOnAzureShort}} v2 Metering for Used Capacity and Throughput
Qumulo doesn't provision {{site.azure.qumuloOnAzureShort}} v2 instances with a total available capacity. Instead, it performs metering on two dimensions:

* Used capacity

* Used throughput

  {% capture throughputCaveat %}Because the throughput for an instance can vary significantly within a given hour, Qumulo samples the used throughput _each minute_. It rounds the computed throughput value to 1 GBps and then multiplies it by the used capacity during the given minute. {{site.azure.pricingCalculator}}{% endcapture %}
  {% include note.html content=throughputCaveat %}
