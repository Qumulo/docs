---
title: "Partitioning a Qumulo Cluster into Tenants"
summary: "This section explains how to enable, disable, and use network multitenancy in Qumulo Core."
permalink: /administrator-guide/network-multitenancy/partitioning-cluster-into-tenants.html
sidebar: administrator_guide_sidebar
varTenantCreateResult: It enables all management protocols for the tenant. The tenant also retains the same file system protocol configuration as when multitenancy was disabled.
varUnassignNetwork: After you unassign a network from a tenant, you can assign it to another tenant.
---

In Qumulo Core 5.3.4 (and higher), _network multitenancy_ lets you partition a single physical Qumulo cluster into multiple virtual _tenants._ You can define a tenant by using a name and one or more networks. When you assign a network to a tenant, Qumulo Core treats any client that connects from that network as part of that tenant. For more information, see [Connecting to Multiple Virtual Networks in Qumulo Core](https://docs.qumulo.com/administrator-guide/network-configuration/connecting-multiple-virtual-networks.html).

For each tenant, you can specify individual [management protocol access and configuration](configuring-management-protocols.html) and [file system protocol access and configuration](configuring-file-system-protocols.html).

{% include note.html content="All tenants share the cluster's underlying file system, identity providers, role-based access control (RBAC) configuration, and other global settings." %}


## Prerequisites
{% include important.html content="If your cluster runs a version of Qumulo Core lower than 6.1.0.3, you must use the `qq multitenancy_enable` command to enable multitenancy for your cluster." %}

To manage network multitenancy and tenants, your user must have membership in a Qumulo role with the following privileges.

* `PRIVILEGE_NETWORK_READ`: Viewing networks
* `PRIVILEGE_NETWORK_WRITE`: Assigning networks to tenants
* `PRIVILEGE_TENANT_READ`: Viewing tenants
* `PRIVILEGE_TENANT_WRITE`: Enabling network multitenancy and creating, modifying, and deleting tenants

## Creating, Configuring, and Unassigning Tenants by Using the qq CLI.
This section explains the lifecycle of working with tenants, including creating tenants, assigning networks to new and existing tenants, viewing tenant configuration, and unassigning tenants.

### Step 1: Create a New Tenant
After you enable multitenancy for your cluster, you can create a new tenant.

Run the `qq multitenancy_create_tenant` command and specify a name for your tenant. For example:

```bash
$ qq multitenancy_create_tenant \
  --name my_tenant
```

Your cluster creates a new tenant with no networks assigned to it. By default, Qumulo Core disables access to the tenant through all protocols.


### Step 2: Assign Networks to a Tenant
To allow a tenant to apply its configuration to clients that connect to the cluster from specific networks, you must associate the tenant with one or more networks. To do this, you can:

* Create a new tenant with networks assigned to it.

* Assign networks to, and unassign networks from, an existing tenant.

* Move networks between tenants.

#### Creating a New Tenant with Assigned Networks
Use the `qq multitenancy_create_tenant` and specify the tenant name and network ID.

{% include important.html content="The network must not be assigned to another tenant already." %}

In the following example, we specify a single network.

```bash
$ qq multitenancy_create_tenant \
  --name my_tenant_name \
  --network-id 2
```

#### Assigning a Single Network to an Existing Tenant
To assign a single network to a tenant, modify _the tenant that belongs to the network._ Run the `qq network_mod_network` command and specify the network and tenant ID.

```bash
$ qq network_mod_network \
  --network-id 3 \
  --tenant-id 2
```

#### Assigning Multiple Networks to an Existing Tenant
To assign multiple networks to a tenant, modify _the networks that belong to the tenant._  Run the `qq multitenancy_modify_tenant` command and specify the tenant and network ID.
  
{% include important.html content="Any existing networks not specified after the `--network-id` flag become unassigned." %}
  
In the following example, we specify three networks.

```bash
$ qq multitenancy_modify_tenant \
  --id 2 \
  --network-id 2 3 4
```

#### Unassigning a Single Network from a Tenant
To unassign a single network from a tenant, clear _the tenant that belongs to the network_. Run the `qq network_mod_network` command and specify the network and the `--clear-tenant-id` flag.

{% capture unassignNetwork %}{{page.varUnassignNetwork}}{% endcapture %}
{% include note.html content=unassignNetwork %}

```bash
$ qq network_mod_network \
  --network-id 3 \
  --clear-tenant-id
```

#### Unassigning All Networks from a Tenant
To unassign all networks from a tenant, clear _the networks that belong to the tenant_. Run the `qq multitenancy_modify_tenant` command and specify the tenant and network ID.

{{site.data.alerts.note}}
<ul>
  <li>{{page.varUnassignNetwork}}</li>
  <li>Don't specify any arguments for the <code>--network-id</code> flag.</li>
</ul>
{{site.data.alerts.end}}
  
```bash
$ qq multitenancy_modify_tenant \
  --id 2 \
  --network-id
```

#### Moving Networks between Tenants
Run the `qq network_mod_network` command and specify the network and target tenant.

```bash
$ qq network_mod_network \
  --network-id 2 \
  --tenant-id 1
```

### Step 3: View Tenant Information
To determine a tenant's network assignments and enabled management and file system protocols, you can view the tenant information.

#### Viewing Information for a Single Tenant
To view the information for a single tenant, use the `qq multitenancy_get_tenants` command.

```bash
$ qq multitenancy_get_tenant \
  --id 1
```

#### Viewing Information for All Tenants
* {{site.logIntoWebUI}}

* Click **Cluster > Network Multitenancy**.

* In the `qq` CLI, run the {% include qq.html command="multitenancy_list_tenants" %} command.

#### Determining the Tenant Assignment for Networks
* To view the information for a single network, use the `qq network_get_network` command.

  ```bash
  $ qq network_get_network \
    --network-id 2
  ```
 
* To view the information for all networks, use the `qq network_list_networks` command.

### Step 4: Delete a Tenant
{{site.data.alerts.important}}
<ul>
  <li>When you delete a tenant, Qumulo Core removes the tenant's entire configuration from your cluster, including NFS exports and SMB shares associated with the tenant.</li>
  <li>It isn't possible to delete the last tenant.</li>
</ul>
{{site.data.alerts.end}}

To delete a tenant, use the `qq multitenancy_delete_tenant` command and specify the tenant ID.

```bash
$ qq multitenancy_delete_tenant \
  --id 2
```

## Known Network Multitenancy Limitations in Qumulo Core
Currently, Qumulo Core doesn't support:

* Creating or modifying tenants on cloud-based clusters

* Using one VLAN on multiple tenants

* Using a separate Active Directory, standalone LDAP, or user-defined mapping configuration for each tenant

* Using a separate DNS configuration for each tenant

* Scoping RBAC privileges to each tenant
