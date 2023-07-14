---
title: "Configuring Virtual Networking for Azure Native Qumulo Scalable File Service (ANQ)"
summary: "This section lists the prerequisites for ANQ, describes the components of virtual networking for the service, explains how to configure them, and provides virtual networking best practices."
permalink: /azure-guide/configuring-virtual-networking-qumulo-scalable-file-service.html
sidebar: azure_guide_sidebar
keywords: cloud, azure, native, scalable_file_service, file_service, network, networking, owner, contributor, role, subnet, dedicated_subnet, endpoint, route_table, security_group, VNet_injection
---

The underlying storage of the service resides in Qumulo's Azure tenant. This storage system connects to your Azure subscription by using _VNet injection,_ a process that establishes a direct connection between your resources and the service resources without using VNet peering. You can use VNet injection to apply routing and security policies to your service endpoints.

To create endpoints for accessing {{site.azure.qumuloOnAzureShort}}, Qumulo creates network interfaces (NICs) and inserts them into your subnet. To allow VNet injection to operate correctly, you must create and configure a new subnet within your virtual network.


## Prerequisites for Configuring Virtual Networking
This section explains the prerequisites for configuring virtual networking for {{site.azure.qumuloOnAzureShort}}.

### Owner and Contributor Roles
The service requires an Owner or Contributor role with access to your Azure subscription.

{% capture customRole %}A custom role must have write permissions to the resource groups in which you create your [delegated subnet](https://learn.microsoft.com/en-us/azure/virtual-network/subnet-delegation-overview) and service.{% endcapture %}
{% include important.html content=customRole %}

### A Dedicated Subnet
The service requires a dedicated subnet.

{{site.data.alerts.note}}
<ul>
  <li>Your subnet address range should be at least <code>/24</code> (it should contain at least 256 IP addresses, including 251 free IP addresses and 5 IP addresses reserved for Azure.)</li>
  <li>Your subnet must be in the same region as the service.</li>
</ul>
{{site.data.alerts.end}}

#### To Create a Dedicated Subnet
1. Identify the region in which you want to subscribe to the service.  

1. In the region, create a new virtual network or select an existing virtual network. 

1. In your virtual network, create a new subnet. Use the default configuration or update the subnet network configuration based on your network policy.

1. Delegate the newly created subnet to `Qumulo.Storage/fileSystems`.

### Load-Balanced Endpoints
Every endpoint created for the service appears as a NIC, with an IP address that you can use to access the service. To hold these endpoints, Qumulo creates a manage resource group under your Azure subscription. To view links to your managed resource group and NICs, see the **Portal** view of your `Qumulo.Storage/fileSystems` resource.

Qumulo provisions multiple endpoints to allow access to the service. To avoid the bandwidth limits of individual endpoints, use [round-robin DNS](https://en.wikipedia.org/wiki/Round-robin_DNS) to distribute your workload traffic across the endpoints available to you.


## Configuring Virtual Networking
This section explains how to configure virtual networking for {{site.azure.qumuloOnAzureShort}}.

{% include important.html content="To enforce network policies for traffic to and from the service, you can apply network security groups and route tables to a [delegated subnet](https://learn.microsoft.com/en-us/azure/virtual-network/subnet-delegation-overview)." %}

### Configuring Network Security Groups
Network security groups let administrators enforce networking traffic rules. You can assign network security groups to individual NICs or to entire subnets. Because it is possible to create or remove NICs from the, we recommend assigning security groups to a delegated subnet.

To ensure that your configuration doesn't block a specific protocol, see [Required Networking Ports for Qumulo Core](https://docs.qumulo.com/administrator-guide/networking/required-networking-ports.html).

### Configuring Route Tables
To configure explicit traffic routing to and from the service, use an [Azure route table](https://learn.microsoft.com/en-us/azure/virtual-network/manage-route-table). Before you can configure your route table, you must attach it to a delegated subnet.

Common configuration scenarios for a route table include routing service traffic:

* Through a firewall
* Through a gateway appliance
* Across multiple virtual network peering configurations

### Configuring Back-End and Front-End Networking
The  platform uses a _split-networking configuration_ in which different NICs handle back-end and front-end traffic. Changes that impact one traffic type have no impact on the other traffic type. In this way, split networking lets you configure firewalls and security groups without having to consider back-end connectivity requirements.
