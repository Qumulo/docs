---
title: "Deploying and Viewing Information about Your Azure Native Qumulo Instance"
summary: "This section explains how to deploy Azure Native Qumulo (ANQ), view information about your service, and connect to the Qumulo Web UI."
permalink: /azure-administrator-guide/getting-started/deploying-instance-azure-native-qumulo.html
redirect_from:
  - /azure-guide/getting-started-qumulo-scalable-file-service.html
sidebar: azure_administrator_guide_sidebar
---

For an introduction, see [How {{site.azure.qumuloOnAzureLong}} Works](how-azure-native-qumulo-works.html).

## To Deploy 
This section explains how to deploy the {{site.azure.qumuloOnAzureShort}} service in Azure.

1. Log in to the Azure Portal and search for `{{site.azure.qumuloOnAzureLong}}`.

1. On the **Create a Qumulo resource in Azure** page, on the **Basics** tab, in the **Project details** section:

   1. Select a **Subscription** that you can access as an owner or contributor.
   
   1. Select a **Resource group** or click **Create new**.
      
      {% include note.html content="A _resource group_ is a container that holds related Azure resources. We recommend creating a resource group exclusive to your Qumulo infrastructure." %}

1. In the **Azure resource details** section:

   1. Enter a **Resource name**.

      This is the name of your service.
   
   1. Select a **Region**.

      For more information, see [Supported Azure Regions](how-azure-native-qumulo-works.html#supported-azure-regions).
   
   1. Select an **Availability zone**.
     
      Azure pins the service resources in a region to this availability zone.
   
      {% include note.html content="By creating all your Qumulo resources within the same availability zone, Azure can reduce latency." %}

1. <a id="admin-password"></a>

   In the **Administrator account** section, enter a **Password** and then re-enter it.

1. In the **Qumulo file system details** section:

   1. Select the **Standard** or **Performance** storage type.
   
   1. Specify the size of the service to create in TB.

1. In the **Pricing plan** section, select a pricing plan.

   The pay-as-you-go plan is the default plan.

   * {{site.azure.pricingCalculator}}

   * For up-front pricing plans and free trials, {{site.azure.emailAzure}}.

1. On the **Networking** tab, in the **Configure virtual network** section:

   1. Select the **Virtual network** for hosting your service. For more information, see [Virtual Networking Prerequisites for {{site.azure.qumuloOnAzureShort}}](virtual-networking-prerequisites-azure-native-qumulo.html).
   
   1. Do one of the following:

      * Select an existing [delegated subnet](https://learn.microsoft.com/en-us/azure/virtual-network/subnet-delegation-overview) to associate with your service.
        
      * To create a new delegated subnet, click **Manage subnet configuration**.
   
      {% include note.html content="You can associate only one delegated subnet with one service instance." %}

1. On the **Tags** tab, enter any custom tags as a name-value pair.

1. To create a service, click **Next: Review + Create >**.


## Viewing Service Information and Connecting to the Qumulo Core Web UI
When Azure finishes creating your service, you can view information about the service and start using the Qumulo Core Web UI.

### Viewing the IP Addresses of Your Service
To view the IP addresses associated with your service, click **IP Addresses** on the sidebar.

{% include tip.html content="We recommend using round-robin DNS to [load balance](virtual-networking-prerequisites-azure-native-qumulo.html#load-balanced-endpoints) traffic across your service IP addresses." %}

### To Log in to the Qumulo Core Web UI
To log in to the Qumulo Core Web UI, you must identify your service endpoint.

1. Click **Overview** and then copy the **Qumulo Core Web UI Login** URL. For example:

   ```
   https://{{site.exampleGateway1}}/login
   ```
   
1. Enter the URL into a browser from a machine that runs, or is connected to, the virtual network where you deployed {{site.azure.qumuloOnAzureShort}}.

   {{site.data.alerts.note}}
   <ul>
     <li>If you connect from a machine that is in a different virtual network, establish <a href="https://learn.microsoft.com/en-us/azure/virtual-network/virtual-network-peering-overview">virtual network peering</a> between the two virtual networks.</li>
     <li>If you connect from an on-premises machine, ensure that you connect by using <a href="https://learn.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-about-vpngateways">Azure VPN Gateway</a> or <a href="https://learn.microsoft.com/en-us/azure/expressroute/expressroute-introduction">Azure ExpressRoute</a>.</li>
   </ul>
   {{site.data.alerts.end}}

1. When the page prompts you for a **Username**, enter `admin`.

1. When the page prompts you for a **Password**, enter [the administrator password that you configured previously](#admin-password).
