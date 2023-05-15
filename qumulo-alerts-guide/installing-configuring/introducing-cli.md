---
title: "Introducing the CLI for Configuring Qumulo Alerts"
summary: "This section explains how to configure Qumulo Alerts using the CLI."
permalink: /qumulo-alerts-guide/installing-configuring/introducing-cli.html
sidebar: qumulo_alerts_guide_sidebar
keywords: Qumulo_Alerts, install, connect, cluster, local_user, role, assign, access_token, access, token, start, stop
---

## Configuration Commands
All configuration for Qumulo Alerts is done through the CLI. There is a CLI utility for each of the following architectures.
* Ubuntu 20
* Ubuntu 22
* Redhat 8
* MacOS
* Windows 2019 / 10 / 11

### Working with the Alerts CLI

The Alerts CLI command configures the entire Qumulo Alerts system. Alerts is composed of many subcommands; with each one configuring a specific feature of Qumulo Alerts.


```bash
alerts --help
Usage: alerts [OPTIONS] COMMAND [ARGS]...

  CLI for Qumulo Alerts subsystem

Options:
  --version                       Show the version and exit.
  --log [INFO|WARNING|ERROR|DEBUG]
                                  Set type of logging
  --host TEXT                     Host running the Qumulo Alerts API
  --port INTEGER                  Port used to connect to the Qumulo Alerts
                                  API
  -cred, --credentials-store PATH
                                  Read and writes credentials to a custom path
                                  (default: ~/.alerts_cred
  --help                          Show this message and exit.


Qumulo Alerts Command Line:

  ad_server_add            Add an AD server.
  ad_server_delete         Delete an AD server.
  ad_server_get            Get a specific AD server.
  ad_server_list           List the AD server.
  ad_server_password_set   Set the password of the AD server.
  ad_server_test           Test connectivity to AD Server.
  ad_server_update         Update an AD server.
  capacity_add             Add the capacity thresholds for a given cluster.
  capacity_delete          Delete the capacity thresholds for a given cluster.
  capacity_get             Get the capacity thresholds for a given cluster.
  capacity_list            List the capacity thresholds for a cluster.
  capacity_update          Update the capacity thresholds for a given cluster.
  change_password          Change your password.
  clicksend_server_add     Add a clicksend server.
  clicksend_server_delete  Delete a clicksend server.
  clicksend_server_list    List the clicksend server.
  clicksend_server_test    Test the clicksend server.
  clicksend_server_update  Update a clicksend server that is being managed.
  cluster_add              Add a cluster to monitor.
  cluster_delete           Delete a cluster from monitoring.
  cluster_get              Get a specific cluster being monitored.
  cluster_list             List all the clusters.
  cluster_update           Update a specific cluster being monitored.
  default_capacity_list    List the default capacity thresholds.
  default_capacity_update  Update the default capacity thresholds.
  default_quota_add        Add a default quota to monitor.
  default_quota_delete     Delete a default quota from monitoring.
  default_quota_get        Get a specific default quota being monitored.
  default_quota_list       List the default quotas
  default_quota_update     Update the thresholds for the default quota.
  email_server_add         Add an email server.
  email_server_delete      Delete an email server.
  email_server_list        List the email server.
  email_server_test        Test the email server.
  email_server_update      Update an email server that is being managed.
  ifttt_server_add         Add an IFTTT server.
  ifttt_server_delete      Delete an IFTTT server.
  ifttt_server_list        List the IFTTT server.
  ifttt_server_test        Test the IFTTT server.
  ifttt_server_update      Update an IFTTT server that is being managed.
  log_level_change         Change the logging level.
  log_level_get            Get the current logging level.
  login                    Login to Qumulo Alerts.
  logout                   Logout from Qumulo Alerts.
  notifygroup_add          Add a NotifyGroup.
  notifygroup_add_user     Add a user to a NotifyGroup.
  notifygroup_delete       Delete a NotifyGroup by name.
  notifygroup_get_user     Get user (by id) assigned to a NotifyGroup.
  notifygroup_list         List all of the NotifyGroups.
  notifygroup_list_users   List all of the users assigned to a NotifyGroup.
  notifygroup_search       Search and list a specific NotifyGroup by name.
  notifygroup_update       Update a specific NotifyGroup by name.
  plugin_get               Get a specific plugin being managed.
  plugin_list              List all of the plugins.
  plugin_search            Search for a specific plugin being managed.
  privileges_get           List a specific privilege for a role being managed.
  privileges_list          List all of the privileges available for a role.
  quota_add                Add a quota to monitor.
  quota_delete             Delete a quota from monitoring.
  quota_get                Get a specific quota being monitored.
  quota_list               List all of the quotas being monitored.
  quota_update             Update a specific quota being monitored.
  role_add_user            Add a user to a role.
  role_create              Create a role.
  role_delete              Delete a role by name.
  role_delete_user         Delete user (by id) assigned to a role.
  role_get_user            Get user (by id) assigned to a role.
  role_list                List a specific role by name.
  role_list_users          List all of the users assigned to a role.
  role_update              Update a specific role by name.
  roles_list               List all of the roles.
  softquota_add            Add a softquota to monitor.
  softquota_delete         Delete a softquota from monitoring.
  softquota_get            Get a specific softquota being monitored.
  softquota_list           List all of the softquotas being monitored.
  softquota_update         Update a specific softquota being monitored.
  user_add                 Add a user to notify.
  user_delete              Delete a user from notifications.
  user_get                 Get a specific user being notified.
  user_list                List all of the users being notified.
  user_update              Update a specific user being notified.
  who_am_i                 Who is the currently logged in user.

```
   
