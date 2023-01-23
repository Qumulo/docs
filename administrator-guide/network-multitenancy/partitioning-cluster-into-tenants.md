---
title: "Partitioning a Qumulo Cluster into Tenants"
summary: "This section explains how to enable, disable, and use network multitenancy in Qumulo Core."
permalink: /administrator-guide/network-multitenancy/partitioning-cluster-into-tenants.html
keywords: network, tenant, multitenancy, vlan
sidebar: administrator_guide_sidebar
varTenantCreateResult: It enables all management protocols for the tenant. The tenant also retains the same file system protocol configuration as when multitenancy was disabled.
---

In Qumulo Core 5.3.4 (and higher), _network multitenancy_ lets you partition a single physical Qumulo cluster into multiple virtual _tenants._ You can define a tenant by using a name and one or more networks. When you assign a network to a tenant, Qumulo Core treats any client that connects from that network as part of that tenant. For more information, see [Connect to Multiple Networks in Qumulo Core](https://care.qumulo.com/hc/en-us/articles/115007237948) on Qumulo Care.

For each tenant, you can specify individual [management protocol access and configuration](configuring-management-protocols.html) and [file system protocol access and configuration](configuring-file-system-protocols.html).

{% include note.html content="All tenants share the cluster's underlying file system, identity providers, role-based access control (RBAC) configuration, and other global settings." %}


## Prerequisites
To manage network multitenancy and tenants, your user must have membership in a Qumulo role with the following privileges.

* `PRIVILEGE_TENANT_READ`: Viewing tenants

* `PRIVILEGE_TENANT_WRITE`: Enabling network multitenancy and creating, modifying, and deleting tenants


## Enabling and Disabling Network Multitenancy
To add tenants to your Qumulo cluster, you must enable network multitenancy. This section explains how to enable and disable network multitenancy on your Qumulo cluster.

### To Enable Network Multitenancy by Using the Web UI
1. Log in to Qumulo Core.

1. Click **Cluster > Network Multitenancy**.

1. On the **Network Tenants** page, in the upper right, click **Enable Multitenancy...**

1. In the **Enable Multitenancy?** dialog box, click **Yes, Enable Multitenancy...**
   
   Qumulo Core creates a tenant with the name `Default` and all of the cluster's networks. {{page.varTenantCreateResult}}

### Enabling Network Multitenancy by Using the qq CLI
Use the `qq multitenancy_enable` command and specify a name for your tenant. For example:

```bash
$ qq multitenancy_enable \
  --name my_tenant
```

Your cluster creates a tenant with the specified name and all of the cluster's networks. {{page.varTenantCreateResult}}

<a id="disable-multitenancy"></a>
### Disabling Network Multitenancy by Using the qq CLI
{% include note.html content="You can disable multitenancy on your Qumulo cluster if it has only one tenant." %}

To disable network multitenancy for your cluster, use the `qq multitenancy disable` command. The cluster:

* Deletes the last tenant

* Makes the SMB shares and NFS exports associated with this tenant available on all networks

* Retains global settings and deletes tenant-specific settings


## Creating, Configuring, and Deleting Tenants
This section explains the lifecycle of working with tenants, including creating tenants, assigning networks to new and existing tenants, viewing tenant configuration, and deleting tenants.

### Step 1: Create a New Tenant
After you enable multitenancy for your cluster, you can create a new tenant.

Use the `qq multitenancy_create_tenant` command and specify a name for your tenant. For example:

```bash
$ qq multitenancy_create_tenant \
  --name my_tenant
```

Your cluster creates a new tenant with no networks assigned to it. By default, Qumulo Core disables access to the tenant through all protocols.


### Step 2: Assign Networks to a Tenant
To allow a tenant to apply its configuration to clients that connect to the cluster from specific networks, you must associate the tenant with one or more networks. To do this, you can:

1. Create a new tenant with networks assigned to it.

1. Assign networks to, and unassign networks from, an existing tenant.

1. Move networks between tenants.

#### Creating a New Tenant with Assigned Networks
Use the `qq multitenancy_create_tenant` and specify the tenant name and network ID.

{% include important.html content="The network must not be assigned to another tenant already." %}

In the following example, we specify a single network.

```bash
$ qq multitenancy_create_tenant \
  --name my_tenant_name \
  --network-id 2
```

#### Assigning Networks to an Existing Tenant
Use the `qq multitenancy_modify_tenant` and specify the tenant and network ID.

{% include important.html content="Any existing networks not specified after the `--network-id` flag become unsassigned." %}

In the following example, we specify two networks.

```bash
$ qq multitenancy_modify_tenant \
  --id 2 \
  --network-id 2 3
```

#### Unassigning Networks from a Tenant
Use the `qq multitenancy_modify_tenant` command and specify the tenant and network ID, but don't specify any arguments for the network ID.

{% include note.html content="After you unassign a network from a tenant, you can assign it to another tenant." %}

In the following example, we unassign all networks from the tenant.

```bash
$ qq multitenancy_modify_tenant \
  --id 2 \
  --network-id
```

#### Moving Networks between Tenants
Use the `qq multitenancy_reassign_network` command and specify the source and target tenants.

```bash
$ qq multitenancy_reassign_network \
  --source-tenant-id 1 \
  --target-tenant-id 2 \
  --network-id 2
```

### Step 3: View Tenant Information
To determine a tenant's network assignments and enabled management and file system protocols, you can view the tenant information.

* To view tenant information by using the Web UI, log in to Qumulo Core and then click **Cluster > Network Multitenancy**.

* To view tenant information by using the `qq` CLI, use the `qq multitenancy_list_tenants` command.

### Step 4: Delete a Tenant
{{site.data.alerts.important}}
<ul>
  <li>When you delete a tenant, Qumulo Core removes the tenant's entire configuration from your cluster, including NFS exports and SMB shares associated with the tenant.</li>
  <li>It isn't possible to delete the last tenant. To do this you must <a href="#disable-multitenancy">disable network multitenancy</a>.</li>
</ul>
{{site.data.alerts.end}}

To delete a tenant, use the `qq multitenancy_delete_tenant` command amd specify the tenant ID.

```bash
$ qq multitenancy_delete_tenant \
  --id 2
```


## Known Network Multitenancy Limitations in Qumulo Core
Currently, Qumulo Core doesn't support:

* Using network multitenancy with cloud-based clusters

* Using one VLAN on multiple tenants

* Using a separate Active Directory, standalone LDAP, or user-defined mapping configuration for each tenant

* Using a separate DNS configuration for each tenant

* Scoping RBAC privileges to each tenant
