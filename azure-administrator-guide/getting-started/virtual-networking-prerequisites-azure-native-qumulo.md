---
title: "Virtual Networking Prerequisites for Azure Native Qumulo"
summary: "This section lists the prerequisites for Azure Native Qumulo (ANQ), describes the components of virtual networking for the service, explains how to configure them, and provides virtual networking best practices."
permalink:  /azure-administrator-guide/getting-started/virtual-networking-prerequisites-azure-native-qumulo.html
redirect_from:
  - /azure-guide/configuring-virtual-networking-qumulo-scalable-file-service.html
sidebar: azure_guide_sidebar
---

## How Qumulo Manages Virtual Networking for {{site.azure.qumuloOnAzureLong}}
When you create an {{site.azure.qumuloOnAzureShort}} instance, Qumulo manages the underlying storage and compute resources for the service. These resources reside within Qumulo's Azure tenant.

The {{site.azure.qumuloOnAzureShort}} instance connects to your Azure subscription by using _VNet injection_, an Azure-specific networking technology that establishes an automatic, direct connection between your resources and service resources without complicated manual configuration or [VNet peering](https://learn.microsoft.com/en-us/azure/virtual-network/virtual-network-peering-overview).

VNet injection lets you:

* Apply routing and security policies to your {{site.azure.qumuloOnAzureShort}} service endpoints by using the Azure Portal, CLI, and API.

* Create endpoints that allow access to {{site.azure.qumuloOnAzureShort}} by inserting special network interfaces into your subnet. This process binds these network interfaces directly to the compute resources of your {{site.azure.qumuloOnAzureShort}} instance.

When you create your {{site.azure.qumuloOnAzureShort}} instance, the Azure Portal guides you to create an appropriate subnet configuration in your virtual network. Then, VNet injection delegates privileges to Qumulo by communicating with the subnet.


## Prerequisites for Configuring Virtual Networking
This section explains the prerequisites for configuring virtual networking for {{site.azure.qumuloOnAzureShort}}, such as creating roles, configuring dedicated subnets, and load-balancing endpoints.

### Creating Owner and Contributor Roles
The service requires an owner or contributor role with access to your Azure subscription.

{% include important.html content="A custom role must have write permissions to the resource groups in which you create your [delegated subnet](https://learn.microsoft.com/en-us/azure/virtual-network/subnet-delegation-overview) and service." %}

### Creating A Dedicated Subnet
The service requires a dedicated subnet.

{{site.data.alerts.note}}
<ul>
  <li>Your subnet address range should be at least <code>/24</code> (it should contain at least 256 IP addresses, including 251 free IP addresses and 5 IP addresses reserved for Azure.)</li>
  <li>Your subnet must be in the same region as the {{site.azure.qumuloOnAzureShort}} file system.</li>
</ul>
{{site.data.alerts.end}}

#### To Create a Dedicated Subnet Automatically
We recommend using the Azure Portal's automatic subnet creation and configuration functionality.

1. Create your {{site.azure.qumuloOnAzureShort}} instance. {{site.azure.detailedDeploymentInstructions}}

1. In the Azure Portal, click **Manage Subnet Configuration**.

1. When prompted, enter an IP address range for your subnet.

The Azure Portal configures your subnet and the required delegation for VNet injection automatically.

#### To Create a Dedicated Subnet Manually
To apply a specific subnet configuration, you can first create a subnet and then select it when you create your {{site.azure.qumuloOnAzureShort}} instance.

1. Identify the region in which you want to subscribe to {{site.azure.qumuloOnAzureShort}}. 

1. In the region, create a new virtual network or select an existing virtual network. 

1. In your virtual network, create a new subnet.

   Use the default configuration or update the subnet network configuration based on your network policy.

1. Delegate the newly created subnet to `Qumulo.Storage/fileSystems`.

<a id="load-balanced-endpoints"></a>
### Load-Balancing {{site.azure.qumuloOnAzureShort}} Endpoints
Qumulo provisions multiple endpoints to allow access to {{site.azure.qumuloOnAzureShort}}. Every endpoint appears in the Azure Portal as a network interface with an IP address. Qumulo creates a managed resource group under your subscription for these endpoints.

{% include tip.html content="To view links to your managed resource groups and network interfaces, use the **Portal** view of your `Qumulo.Storage/fileSystems` resource." %}

To avoid the bandwidth limits of individual endpoints, use [round-robin DNS](https://en.wikipedia.org/wiki/Round-robin_DNS) to distribute your workload traffic across your endpoints.


## Configuring Virtual Networking
This section provides an overview of configuring virtual networking for {{site.azure.qumuloOnAzureShort}}, including configuration of network security groups, route tables, and back- and front-end networking.

{% include important.html content="To enforce network policies for traffic to and from the service, you can apply network security groups and route tables to a [delegated subnet](https://learn.microsoft.com/en-us/azure/virtual-network/subnet-delegation-overview)." %}

### Configuring Network Security Groups
_Network security groups_ let administrators enforce networking traffic rules. You can assign network security groups to individual network interfaces or to entire subnets.

{% capture delegatedSubnet %}Because it is possible to create or remove network interfaces from an {{site.azure.qumuloOnAzureShort}} instance, we recommend assigning security groups to a delegated subnet.{% endcapture %}
{% include tip.html content=delegatedSubnet %}

To ensure that your configuration doesn't block a specific protocol, follow the guidance in [Required Networking Ports for Qumulo Core](https://docs.qumulo.com/azure-administrator-guide/network-configuration/required-ports.html).

### Configuring Route Tables
To configure explicit traffic routing to and from the service, you must attach an [Azure route table](https://learn.microsoft.com/en-us/azure/virtual-network/manage-route-table) to a delegated subnet, and then configure your route table.

Common configuration scenarios include routing service traffic:

* Through a firewall
* Through a gateway appliance
* Across multiple virtual network peering configurations

### Configuring Back-End and Front-End Networking
The {{site.azure.qumuloOnAzureShort}} service uses a _split-networking configuration_ in which different network interfaces handle back-end and front-end traffic.

Because it isn't possible to access the back-end network configuration or affect back-end traffic within your {{site.azure.qumuloOnAzureShort}} instance, you can configure firewalls and security groups within your virtual network without having to consider back-end connectivity requirements.
