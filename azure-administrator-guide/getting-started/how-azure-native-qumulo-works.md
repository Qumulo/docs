---
title: "How Azure Native Qumulo Works"
summary: "This section explains the main functionality of Azure Native Qumulo (ANQ), provides a feature comparison between ANQ and Qumulo on other platforms. In addition, it explains the difference between ANQ Hot and Cold, specifies ANQ's known limitations and compliance posture, gives an overview of deploying the service in Azure, and lists the supported Azure Regions for the service."
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
* In this guide, we refer to the features and functionality of Qumulo Core as _{{site.azure.qumuloOnAzureLong}} ({{site.azure.qumuloOnAzureShort}})_ or _the service._

* Following {{site.azure.qumuloOnAzureShort}}'s initial launch, we configured the Qumulo file system in Azure to have significant flexibility and performance improvements. For more information, see [Feature Comparison with Qumulo on Other Platforms](#anq-feature-comparison).

* Default {{site.azure.qumuloOnAzureShort}} workloads are called _Hot workloads_. Workloads that use the Azure Blob Storage Cold Tier are called [_Cold workloads_](#using-cold-workloads).

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
      <th class="width-15">{{site.azure.qumuloOnAzureShort}}</th>
      <th class="width-15">Qumulo on AWS as an AMI</th>
      <th class="width-15">Qumulo on Premises</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Automatic deployment</td>
      <td>&#10003;</td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>Automatic infrastructure replacement</td>
      <td>&#10003;</td>
      <td>&#10003;</td>
      <td></td>
    </tr>    
    <tr>
      <td>Automatic updates</td>
      <td>&#10003;</td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>Availability in Cloud Marketplace</td>
      <td>&#10003;</td>
      <td>&#10003;</td>
      <td></td>
    </tr>  
    <tr>
      <td>Customer support</td>
      <td>&#10003;</td>
      <td>&#10003;</td>
      <td>&#10003;</td>
    </tr>
    <tr>
      <td>Integration with Azure Portal</td>
      <td>&#10003;</td>
      <td></td>
      <td></td>
    </tr>      
    <tr>
      <td>Payment for preprovisioned file system capacity</td>
      <td></td>
      <td>&#10003;</td>
      <td>&#10003;</td>
    </tr>
    <tr>
      <td>Payment for used storage space only</td>
      <td>&#10003;</td>
      <td></td>
      <td></td>
    </tr>    
    <tr>
      <td>Performance scales elastically at any capacity</td>
      <td>&#10003;</td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>Performance scales with provisioned capacity</td>
      <td></td>
      <td>&#10003;</td>
      <td>&#10003;</td>
    </tr>
    <tr>
      <td>Qumulo Core features</td>
      <td>&#10003;</td>
      <td>&#10003;</td>
      <td>&#10003;</td>      
    </tr>
    <tr>
      <td>Simple and fast deployment under 15 Minutes</td>
      <td>&#10003;</td>
      <td></td>
      <td></td>
    </tr>
  </tbody>
</table>

### Known Limitations 
* **IPv6 Addresses:** Currently, Azure Networking features don't support IPv6 addresses.

* **Initial Authentication over SMB:** When you deploy the service initially, all users can use the SMB protocol. However, the `admin` user can authenticate over all protocols except over SMB.

  To allow the `admin` user to authenticate over the SMB protocol, change the `admin` user's password.

### Qumulo Compliance Posture
For information about Qumulo's third-party attestations, including FIPS 140-2 Level 1, GDPR, HIPAA, and SOC 2 Type II, see [Qumulo Trust Center](https://qumulo.com/trust/).


<a id="using-cold-workloads"></a>
## Using {{site.azure.qumuloOnAzureLong}} Cold Workloads
{{site.azure.qumuloOnAzureShort}} Cold uses Azure Blob Storage Cold Tier and has the same data integrity as {{site.azure.qumuloOnAzureShort}} Hot, a slightly lower (99% rather than 99.9%) guaranteed availability, and a sustained high performance and read throughput. {{site.azure.qumuloOnAzureShort}} Cold is designed for workloads in which the majority of the data is written once, read infrequently, and retained for a long time period.

{% capture availabilityEvent %}When Azure Blob Storage Cold Tier causes an availability event, it affects only the data within the files, not the metadata. While the data of a specific file might become unavailable, the file system and data within other files remain accessible.{% endcapture %}
{% include note.html content=availabilityEvent %}


## Deploying {{site.azure.qumuloOnAzureLong}}
This section outlines the process of configuring and deploying {{site.azure.qumuloOnAzureShort}}. {{site.azure.detailedDeploymentInstructions}}

1. You specify the following configuration.

   * **Regional Settings:** The availability zone and region. For more information, see [Supported Azure Regions](#supported-azure-regions)

   * **Networking Settings:** The virtual network in the same region. For more information, see [Virtual Networking Prerequisites](virtual-networking-prerequisites-azure-native-qumulo.html)

   * **Storage Class:** {{site.azure.anqColdImpact}} For more information, see [Using {{site.azure.qumuloOnAzureShort}} Cold Workloads](#using-cold-workloads).

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
The following table lists the regions that {{site.azure.qumuloOnAzureShort}} supports. &#10033; indicates supported zoneless regions.

<table>
  <thead>
    <tr>
      <th>Geographical Location</th>
      <th width="30%">Azure Region</th>
      <th width="15%">{{site.azure.qumuloOnAzureShort}} Hot</th>
      <th width="15%">{{site.azure.qumuloOnAzureShort}} Cold</th>
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
      <td>&#10003;&#10033;</td>
      <td>&#10003;&#10033;</td>
    </tr>    
    <tr>
      <td>US (Illinois)</td>
      <td>North Central US</td>
      <td>&#10003;&#10033;</td>
      <td>&#10003;&#10033;</td>
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
      <td>&#10003;</td>
    </tr>
    <tr>
      <td>Brazil (S&atilde;o Paulo State)</td>
      <td>Brazil South</td>
      <td>&#10003;</td>
      <td>&#10003;</td>
    </tr>
    <tr>
      <td>India (Pune)</td>
      <td>Central India</td>
      <td>&#10003;</td>
      <td>&#10003;</td>
    </tr>
    <tr>
      <td>Japan (Tokyo, Saitama)</td>
      <td>Japan East</td>
      <td>&#10003;</td>
      <td>&#10003;</td>
    </tr>
    <tr>
      <td>Korea (Seoul)</td>
      <td>Korea Central</td>
      <td>&#10003;</td>
      <td>&#10003;</td>
    </tr>
    <tr>
      <td>UAE (Dubai)</td>
      <td>UAE North</td>
      <td>&#10003;</td>
      <td>&#10003;</td>
    </tr>
  </tbody>
</table>

## Usage Billing and Metering for {{site.azure.qumuloOnAzureLong}}
Once an hour, every deployed {{site.azure.qumuloOnAzureShort}} Hot and Cold instance reports a metering event to Azure Marketplace.

{% capture pricingCalculator %}{{site.azure.pricingCalculator}}{% endcapture %}
{% include note.html content=pricingCalculator %}

### Billing for {{site.azure.qumuloOnAzureShort}} Cold Instances
{{site.azure.qumuloOnAzureShort}} Cold instances:

* Are billed at a lower rate than {{site.azure.qumuloOnAzureShort}} Hot instances

* Include a set amount of used capacity, higher than that of an {{site.azure.qumuloOnAzureShort}} Hot instance

* Include a set amount of data that you can retrieve per month

  When you exceed this amount, we charge a per-gigabyte rate for reading data from the instance (regardless of protocol).

* Have a minimum data retention period of 120 days.

  When you delete data early (before the retention period expires), you incur a short-lived data charge, equal to the remaining duration of the retention period.

### Metering Dimensions for {{site.azure.qumuloOnAzureShort}} Hot and Cold
Both {{site.azure.qumuloOnAzureShort}} Hot and Cold use the `Used Capacity` metering dimension. In addition:

* Metering for {{site.azure.qumuloOnAzureShort}} Hot instances uses the `Used capacity` and `Used throughput` dimensions

* Metering for {{site.azure.qumuloOnAzureShort}} Cold instances uses the `Data read` and `Data deleted early` dimensions.

{% include note.html content="Because the throughput of an instance can vary significantly within an hour, Qumulo Core samples the used throughput every minute, rounds the computed throughput value to 1 GBps, and then multiplies it by the used capacity during this minute." %}
