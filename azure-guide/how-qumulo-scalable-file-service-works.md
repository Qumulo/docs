---
title: "How Azure Native Qumulo Scalable File Service (ANQ) Works"
summary: "This section gives an overview of deploying ANQ; lists the Azure regions and compliance postures that the service supports; and explains the differences between this service, Qumulo on AWS as an AMI, and Qumulo on premises."
permalink: /azure-guide/how-qumulo-scalable-file-service-works.html
sidebar: azure_guide_sidebar
keywords: cloud, azure, native, scalable_file_service, file_service, regions, soc, fips_140-2
---

This fully managed service deploys and manages resources on your behalf, runs Qumulo Core, and provides the same interfaces and functionality as Qumulo on premises.

{% capture inThisGuide %}In this guide, we refer to the collective features and functionality of Qumulo Core as _{{site.azure.qumuloOnAzureLong}}({{site.azure.qumuloOnAzureShort}})_ or _the service._{% endcapture %}
{% include tip.html content=inThisGuide %}

{{site.azure.qumuloOnAzureShort}} lets you configure file protocols, quotas, replication, and other features regardless of underlying infrastructure or storage and without requiring the tracking of resource quotas and costs. It receives the latest updates and features continuously and, when issues occur, replaces compute and storage resources automatically. 

For instructions on deploying the service in Azure, see [Getting Started with {{site.azure.qumuloOnAzureShort}}](getting-started-qumulo-scalable-file-service.html).

{% capture emailAzure %}For help with expanding the capacity of {{site.azure.qumuloOnAzureShort}}, {{site.azure.emailAzure}}{% endcapture %}
{% include note.html content=emailAzure %}

## Deploying {{site.azure.qumuloOnAzureLong}}
This section outlines the process of configuring and deploying the service.

1. You specify the following configuration.

   * **Regional Settings:** The availability zone and region; for more information, see [Supported Azure Regions](#supported-azure-regions)

   * **Networking Settings:** A virtual network in the same region; for more information, see [Configuring Virtual Networking](configuring-virtual-networking-qumulo-scalable-file-service.html)

   * **Usable Capacity:** Actual required capacity; on this platform, this value isn't restricted by architecture

1. Qumulo deploys and configures the following resources in an environment that it manages.
   
   * **Managed Resource Group:** This group contains the networking resources that the service deploys.

   * **Delegated Subnet:** The [delegated subnet](https://learn.microsoft.com/en-us/azure/virtual-network/subnet-delegation-overview) that the service uses to provision endpoints for your virtual network.

   * **Qumulo Service Resource:** The Azure resource that represents one instance of the service. You can use this resource to manage the service and view configuration details. 

   * **Marketplace SaaS Resource:** The SaaS resource from the Qumulo Marketplace offer that you choose. Azure uses this resource for billing purposes.

   {% capture autoDep %}Automated deployments let you create {{site.azure.qumuloOnAzureShort}} instances for long-term use cases and for short-term components of automated storage workflows.{% endcapture %}
   {% include tip.html content=autoDep %}
   
   
## Known Limitations 
* **IPv6 Addresses:** Currently, Azure Networking features don't support IPv6 addresses.

* **Initial Authentication over SMB:** When you deploy the service initially, all users can use the SMB protocol. However, the `admin` user can authenticate over all protocols except for SMB. To allow the `admin` user to authenticate over the SMB protocol, change the `admin` user's password. When the password change is complete, the `admin` user can authenticate over the SMB protocol.

  {% include note.html content="An incompatibility in data formats between the SMB protocol and Qumulo's integration with Azure causes this limitation." %}

* **Namespaces Larger than 1 PB:** To deploy namespaces larger than 1 PB through the Azure Portal, {{site.azure.emailAzure}}


## Supported Azure Regions
{{site.azure.qumuloOnAzureShort}} supports all public U.S. regions. For more information, see [Azure Geographies](https://azure.microsoft.com/en-us/explore/global-infrastructure/geographies/#geographies).

## Feature Comparison with Qumulo on Other Platforms
The following table compares {{site.azure.qumuloOnAzureShort}} features with those of Qumulo on other platforms.

{% capture noDirectAccess %}Although Qumulo manages the service fully, direct access to hosts with SSH is unavailable. You can configure the service by using the [`qq` CLI](https://care.qumulo.com/hc/en-us/articles/115014875988) from a remote machine or by using any of the IP addresses of the service to log in to the Web UI.{% endcapture %}
{% include note.html content=noDirectAccess %}

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
      <td>Automatic Deployment</td>
      <td>&#10003;</td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>Automatic Updates</td>
      <td>&#10003;</td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>Available in Cloud Marketplace</td>
      <td>&#10003;</td>
      <td>&#10003;</td>
      <td></td>
    </tr>
    <tr>
      <td>Customer Support</td>
      <td>&#10003;</td>
      <td>&#10003;</td>
      <td>&#10003;</td>
    </tr>
    <tr>
      <td>Automatic Infrastructure Replacement</td>
      <td>&#10003;</td>
      <td>&#10003;</td>
      <td></td>
    </tr>
    <tr>
      <td>Incremental Sizing</td>
      <td>&#10003;</td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>Pay as You Go</td>
      <td>&#10003;</td>
      <td>&#10003;</td>
      <td></td>
    </tr>
    <tr>
      <td>Portal Integration</td>
      <td>&#10003;</td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>Qumulo Core Features</td>
      <td>&#10003;</td>
      <td>&#10003;</td>
      <td>&#10003;</td>
    </tr>
    <tr>
      <td>Simple, Fast Deployment Under 15 Minutes</td>
      <td>&#10003;</td>
      <td></td>
      <td></td>
    </tr>
  </tbody>
</table>


## Qumulo Compliance Posture
For more information about third-party attestations that Qumulo has achieved, including SOC 2 Type II and FIPS 140-2 Level 1, see [Qumulo Compliance Posture](https://docs.qumulo.com/administrator-guide/getting-started-qumulo-core/qumulo-compliance-posture.html) in the Qumulo Core Administrator Guide.
