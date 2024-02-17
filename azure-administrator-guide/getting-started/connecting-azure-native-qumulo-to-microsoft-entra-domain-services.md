---
title: "Connecting Azure Native Qumulo to Microsoft Entra Domain Services"
summary: "This section explains how to connect Azure Native Qumulo (ANQ) to Microsoft Entra Domain Services (DS)."
permalink: /azure-administrator-guide/getting-started/connecting-azure-native-qumulo-to-microsoft-entra-domain-services.html
redirect_from:
  - /azure-guide/connecting-to-azure-active-directory-domain-services.html
sidebar: azure_guide_sidebar
---

{% include important.html content="On October 1, 2023, Microsoft renamed Azure Active Directory Domain Services to Microsoft Entra Domain Services." %}

Microsoft Entra DS provides managed domain services such as Windows Domain Join, Group Policy, LDAP, and Kerberos authentication. You can connect your {{site.azure.qumuloOnAzureShort}} to standard Active Directory (on-premises AD or self-managed AD in the cloud) or to Microsoft Entra DS.

For information about joining {{site.azure.qumuloOnAzureShort}} to standard AD, see [Join Your Qumulo Cluster to Active Directory](https://care.qumulo.com/hc/en-us/articles/115007276068) on Qumulo Care.

For information about joining Microsoft Entra DS, see the following resources in the Microsoft Entra documentation.

  * [Tutorial: Configure virtual networking for a Microsoft Entra Domain Services managed domain](https://learn.microsoft.com/en-us/azure/active-directory-domain-services/tutorial-configure-networking)

  * [Tutorial: Join a Windows Server virtual machine to a Microsoft Entra Domain Services managed domain](https://learn.microsoft.com/en-us/azure/active-directory-domain-services/join-windows-vm)

## To Configure Microsoft Entra Domain Services (Microsoft Entra DS)
1. Create an instance of Microsoft Entra DS by entering the following details.

   * **Name:** Your domain name.

     We recommend entering `$DOMAIN.onmicrosoft.com` that the system creates for you.

     You can also use your own custom domain name that acts as a routable or non-routable domain suffix.

   * **VNet:** A VNet and a resource group for your Microsoft Entra DS instance.

   * **SKU:** Standard

   * **Forest:** User

   After the system completes deploying your managed domain (this takes 1-2 hours), it creates the VNet that you specified.
   
1. Configure DNS for your managed domain.

   1. Log in to the [Azure portal](https://azure.microsoft.com/en-us/) and search for `microsoft entra domain services`.
   
   1. Click your domain.
   
   1. In the **Required configuration steps** section, under **Update DNS server settings for your virtual network**, write down the domain controllers (DNS servers) that the managed domain deployment created for you, and then click **Configure**.

      For more information, see [Update DNS settings for the Azure virtual network](https://learn.microsoft.com/en-us/azure/active-directory-domain-services/tutorial-create-instance#update-dns-settings-for-the-azure-virtual-network) in the Microsoft Entra Domain Services documentation.

1. (Optional) If the Microsoft Entra DS managed domain VNet is different from the VNet that you used for deploying {{site.azure.qumuloOnAzureShort}}, peer the two VNets.

   For more information, see [Configure virtual network peering](https://learn.microsoft.com/en-us/azure/active-directory-domain-services/tutorial-configure-networking#configure-virtual-network-peering) in the Microsoft Entra Domain Services documentation.
   
1. Configure the {{site.azure.qumuloOnAzureShort}} DNS servers to point to the servers that the managed domain provided for you.

   For more information, see [Custom DNS Configuration](https://care.qumulo.com/hc/en-us/articles/360026611494) on Qumulo Care.
   
1. To finish configuring your file system to work with Microsoft Entra DS, [join your Qumulo cluster to AD](https://care.qumulo.com/hc/en-us/articles/115007276068).

   {% include note.html content="We recommend giving an administrative role to the user who joins the domain. For newly created users, the system requires a password reset when the user logs in to the [Azure portal](https://azure.microsoft.com/en-us/)." %}

## Next Steps
After you deploy your Microsoft Entra DS instance and connect {{site.azure.qumuloOnAzureShort}} to it, you can [configure SAML Single Sign-On (SSO) for your {{site.azure.qumuloOnAzureShort}} instance](../authentication-qumulo-core/configuring-saml-single-sign-on-sso.html).
