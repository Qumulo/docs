---
title: "Getting Started with the Azure Native Qumulo Scalable File Service"
summary: "This section explains how to deploy Azure Native Qumulo Scalable File Service, view information about your service, and connect to the Web UI."
permalink: /azure-guide/getting-started-qumulo-scalable-file-service.html
sidebar: azure_guide_sidebar
keywords: cloud, azure, native, scalable file service, file service, getting started
---

## To Deploy the {{site.azure.qumuloOnAzureLong}}
This section explains how to deploy the service in Azure.

1. Log in to the Azure Portal and search for `{{site.azure.qumuloOnAzureLong}}`.

1. On the **Create a Qumulo resource in Azure** page, on the **Basics** tab, in the **Project details** section:

   a. Select a **Subscription** that you can access as an owner.
   
   b. Select a **Resource group** or click **Create new**.
      
      {% include note.html content="A _resource group_ is a container that holds related Azure resources. We recommend creating resource groups exclusive to your Qumulo infrastructure." %}

1. In the **Azure resource details** section:

   a. Enter a **Resource name**. This is the name of your service.
   
   b. Select a **Region**. For more information, see [Supported Azure Regions](how-qumulo-scalable-file-service-works.html#supported-azure-regions).
   
   c. Select an **Availability zone**. Azure pins the service resources in a region to this availability zone.
   
      {% include note.html content="By creating all your Qumulo resources within the same availability zone, Azure can reduce latency." %}

1. <a id="admin-password"></a>In the **Administrator account** section, enter a **Password** and then re-enter it.

1. In the **Qumulo file system details** section:

   a. Select the **Standard** or **Performance** storage type.
   
   b. Specify the size of the service to create, in TB.

1. In the **Pricing plan** section, select a pricing plan.

   The pay-as-you-go plan is the default plan. For up-front pricing plans and free trials, {{site.azure.emailAzure}}

1. On the **Networking** tab, in the **Configure virtual network** section:

   a. Select the **Virtual network** for hosting your service. For more information, see [Configuring Virtual Networking for the {{site.azure.qumuloOnAzureLong}}](configuring-virtual-networking-qumulo-scalable-file-service.html).
   
   b. Select an existing [delegated subnet](https://learn.microsoft.com/en-us/azure/virtual-network/subnet-delegation-overview) to associate with your service.
   
      {% include note.html content="You can associate only one delegated subnet with one service instance." %}

1. On the **Tags** tab, enter any custom tags as a name-value pair.

1. To create a service, click **Next: Review + Create >**.


## Viewing Service Information and Connecting to the Web UI
When Azure finishes creating your service, you can view information about the service and use the Web UI.

### Viewing the IP Addresses of Your Service
To view the IP addresses associated with your service, click **IP Addresses** on the sidebar.

### To Log in to the Web UI
To log in to the Web UI, you must identify your service endpoint.

1. Click **Overview** and then copy the **Qumulo Core Web UI Login** URL. For example:

   ```
   https://192.0.0.4/login
   ```
   
1. Enter the URL into a browser on the same network.

1. When the page prompts you for a **Username**, enter `admin`.

1. When the page prompts you for a **Password**, enter [the administrator password that you configured](#admin-password).

For more information about working with Qumulo Core and the Web UI, see the [Qumulo Administrator Guide](https://docs.qumulo.com/administrator-guide/).