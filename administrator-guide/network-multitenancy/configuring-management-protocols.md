---
title: "Configuring Management Protocols on a Tenant"
summary: "This section explains how to configure management protocols for each tenant on a Qumulo cluster."
permalink: /administrator-guide/network-multitenancy/configuring-management-protocols.html
sidebar: administrator_guide_sidebar
varNoReq: access doesn't require enabling REST API access.
---

After you [create tenants](partitioning-cluster-into-tenants.html) on your Qumulo cluster, you can manage access for clients that connect to the cluster from the tenant's network by enabling or disabling the management protocols for each tenant.

{{site.data.alerts.important}}
<ul>
  <li>Access to a management protocol lets a client use the protocol to view and modify resources across the entire cluster, not only within the client's tenant.</li>
  <li>If you disable a management protocol, you can still access your cluster by using a physical or remote console.</li>
</ul>
{{site.data.alerts.end}}


## Prerequisites
To configure management protocols, your user must have membership in a Qumulo role with the following privileges.

* `PRIVILEGE_TENANT_READ`: Viewing tenants

* `PRIVILEGE_TENANT_WRITE`: Modifying tenants


## Enabling and Disabling REST API Access
The Qumulo REST API lets you manage clusters by using the `qq` CLI, Python bindings, and REST API calls.

* To enable REST API access, use the `qq multitenancy_modify_tenant` command, specify the tenant ID, and use the `--enable-rest-api` flag.

* To disable access, use the `--disable-rest-api` flag.

In the following example, the cluster begins to accept REST API traffic on TCP port 8000 on all networks assigned to the tenant.

```bash
$ qq multitenancy_modify_tenant \
  --id 2
  --enable-rest-api
```


## Enabling and Disabling Web UI Access
The Qumulo Core Web UI lets you manage clusters from a browser.

{% capture webUiNoReq %}Enabling Web UI {{page.varNoReq}}{% endcapture %}
{% include note.html content=webUiNoReq %}

* To enable REST API access, use the `qq multitenancy_modify_tenant` command, specify the tenant ID, and use the `--enable-web-ui` flag.

* To disable access, use the `--disable-web-ui` flag.

In the following example, the cluster begins to serve the Web UI on TCP ports 80 and 433 on all networks assigned to the tenant.

```bash
$ qq multitenancy_modify_tenant \
  --id 2
  --enable-web-ui
```


## Enabling and Disabling SSH Access
SSH lets you view logs and use the `qq` CLI by using a client to connect to nodes in a cluster remotely.

{% capture sshNoReq %}Enabling SSH {{page.varNoReq}}{% endcapture %}
{% include note.html content=sshNoReq %}

* To enable SSH access, use the `qq multitenancy_modify_tenant` command, specify the tenant ID, and use the `--enable-ssh` flag.

* To disable access, use the `--disable-ssh` flag.

In the following example, the cluster begins to accept SSH traffic on TCP port 22 on all networks assigned to the tenant.

```bash
$ qq multitenancy_modify_tenant \
  --id 2
  --enable-ssh
```


## Enabling and Disabling Replication Access
Replication lets a cluster transfer data from a directory on one cluster to a directory on another cluster.

* To enable replication access, use the `qq multitenancy_modify_tenant` command, specify the tenant ID, and use the `--enable-replication` flag.

* To disable access, use the `--disable-replication` flag.

In the following example, the cluster begins to accept replication traffic on TCP port 3712 on all networks assigned to the tenant.

```bash
$ qq multitenancy_modify_tenant \
  --id 2 \
  --enable-replication
```
