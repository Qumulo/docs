---
category: /Session Management
methods:
  get:
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"api_user_info\",\n  \"type\": \"object\",\n\
        \  \"properties\": {\n    \"id\": {\n      \"description\": \"The user's unique\
        \ id\",\n      \"type\": \"string\"\n    },\n    \"name\": {\n      \"description\"\
        : \"The user's account name\",\n      \"type\": \"string\"\n    },\n    \"\
        primary_group\": {\n      \"description\": \"The unique ID of the user's group\"\
        ,\n      \"type\": \"string\"\n    },\n    \"sid\": {\n      \"description\"\
        : \"The users's SID\",\n      \"type\": \"string\"\n    },\n    \"uid\": {\n\
        \      \"description\": \"The user's NFS uid\",\n      \"type\": \"string\"\
        \n    },\n    \"home_directory\": {\n      \"description\": \"The path to\
        \ the user's home directory\",\n      \"type\": \"string\"\n    },\n    \"\
        can_change_password\": {\n      \"description\": \"Specifies whether the user\
        \ can change the password\",\n      \"type\": \"boolean\"\n    },\n    \"\
        privileges\": {\n      \"type\": \"array\",\n      \"items\": {\n        \"\
        type\": \"string\",\n        \"enum\": [\n          \"PRIVILEGE_AD_READ\"\
        ,\n          \"PRIVILEGE_AD_USE\",\n          \"PRIVILEGE_AD_WRITE\",\n  \
        \        \"PRIVILEGE_ANALYTICS_READ\",\n          \"PRIVILEGE_AUDIT_READ\"\
        ,\n          \"PRIVILEGE_AUDIT_WRITE\",\n          \"PRIVILEGE_AUTH_CACHE_READ\"\
        ,\n          \"PRIVILEGE_AUTH_CACHE_WRITE\",\n          \"PRIVILEGE_CLUSTER_READ\"\
        ,\n          \"PRIVILEGE_CLUSTER_WRITE\",\n          \"PRIVILEGE_DEBUG\",\n\
        \          \"PRIVILEGE_DNS_READ\",\n          \"PRIVILEGE_DNS_USE\",\n   \
        \       \"PRIVILEGE_DNS_WRITE\",\n          \"PRIVILEGE_FILE_FULL_ACCESS\"\
        ,\n          \"PRIVILEGE_FS_ATTRIBUTES_READ\",\n          \"PRIVILEGE_FS_DELETE_TREE_READ\"\
        ,\n          \"PRIVILEGE_FS_DELETE_TREE_WRITE\",\n          \"PRIVILEGE_FS_LOCK_READ\"\
        ,\n          \"PRIVILEGE_FS_LOCK_WRITE\",\n          \"PRIVILEGE_FS_SETTINGS_READ\"\
        ,\n          \"PRIVILEGE_FS_SETTINGS_WRITE\",\n          \"PRIVILEGE_FTP_READ\"\
        ,\n          \"PRIVILEGE_FTP_WRITE\",\n          \"PRIVILEGE_IDENTITY_MAPPING_READ\"\
        ,\n          \"PRIVILEGE_IDENTITY_MAPPING_WRITE\",\n          \"PRIVILEGE_IDENTITY_READ\"\
        ,\n          \"PRIVILEGE_IDENTITY_WRITE\",\n          \"PRIVILEGE_KERBEROS_KEYTAB_READ\"\
        ,\n          \"PRIVILEGE_KERBEROS_KEYTAB_WRITE\",\n          \"PRIVILEGE_KERBEROS_SETTINGS_READ\"\
        ,\n          \"PRIVILEGE_KERBEROS_SETTINGS_WRITE\",\n          \"PRIVILEGE_KV_READ\"\
        ,\n          \"PRIVILEGE_LDAP_READ\",\n          \"PRIVILEGE_LDAP_USE\",\n\
        \          \"PRIVILEGE_LDAP_WRITE\",\n          \"PRIVILEGE_LOCAL_GROUP_READ\"\
        ,\n          \"PRIVILEGE_LOCAL_GROUP_WRITE\",\n          \"PRIVILEGE_LOCAL_USER_READ\"\
        ,\n          \"PRIVILEGE_LOCAL_USER_WRITE\",\n          \"PRIVILEGE_METRICS_READ\"\
        ,\n          \"PRIVILEGE_NETWORK_IP_ALLOCATION_READ\",\n          \"PRIVILEGE_NETWORK_READ\"\
        ,\n          \"PRIVILEGE_NETWORK_WRITE\",\n          \"PRIVILEGE_NFS_EXPORT_READ\"\
        ,\n          \"PRIVILEGE_NFS_EXPORT_WRITE\",\n          \"PRIVILEGE_POWER_CYCLE\"\
        ,\n          \"PRIVILEGE_QUOTA_READ\",\n          \"PRIVILEGE_QUOTA_WRITE\"\
        ,\n          \"PRIVILEGE_RECONCILER_READ\",\n          \"PRIVILEGE_REPLICATION_REVERSE_RELATIONSHIP\"\
        ,\n          \"PRIVILEGE_REPLICATION_SOURCE_READ\",\n          \"PRIVILEGE_REPLICATION_SOURCE_WRITE\"\
        ,\n          \"PRIVILEGE_REPLICATION_TARGET_READ\",\n          \"PRIVILEGE_REPLICATION_TARGET_WRITE\"\
        ,\n          \"PRIVILEGE_ROLE_READ\",\n          \"PRIVILEGE_ROLE_WRITE\"\
        ,\n          \"PRIVILEGE_SMB_SHARE_READ\",\n          \"PRIVILEGE_SMB_SHARE_WRITE\"\
        ,\n          \"PRIVILEGE_SNAPSHOT_CALCULATE_USED_CAPACITY_READ\",\n      \
        \    \"PRIVILEGE_SNAPSHOT_DIFFERENCE_READ\",\n          \"PRIVILEGE_SNAPSHOT_POLICY_READ\"\
        ,\n          \"PRIVILEGE_SNAPSHOT_POLICY_WRITE\",\n          \"PRIVILEGE_SNAPSHOT_READ\"\
        ,\n          \"PRIVILEGE_SNAPSHOT_WRITE\",\n          \"PRIVILEGE_SUPPORT_READ\"\
        ,\n          \"PRIVILEGE_SUPPORT_WRITE\",\n          \"PRIVILEGE_TEST_ONLY\"\
        ,\n          \"PRIVILEGE_TIME_READ\",\n          \"PRIVILEGE_TIME_WRITE\"\
        ,\n          \"PRIVILEGE_UNCONFIGURED_NODE_READ\",\n          \"PRIVILEGE_UPGRADE_READ\"\
        ,\n          \"PRIVILEGE_UPGRADE_WRITE\",\n          \"PRIVILEGE_SMB_FILE_HANDLE_READ\"\
        ,\n          \"PRIVILEGE_SMB_FILE_HANDLE_WRITE\",\n          \"PRIVILEGE_SMB_SESSION_READ\"\
        ,\n          \"PRIVILEGE_SMB_SESSION_WRITE\",\n          \"PRIVILEGE_REPLICATION_OBJECT_READ\"\
        ,\n          \"PRIVILEGE_REPLICATION_OBJECT_WRITE\",\n          \"PRIVILEGE_ENCRYPTION_WRITE\"\
        ,\n          \"PRIVILEGE_ENCRYPTION_READ\",\n          \"PRIVILEGE_NFS_SETTINGS_READ\"\
        ,\n          \"PRIVILEGE_NFS_SETTINGS_WRITE\",\n          \"PRIVILEGE_SERVICE_PUBLIC_KEYS_WRITE\"\
        ,\n          \"PRIVILEGE_SERVICE_PUBLIC_KEYS_READ\",\n          \"PRIVILEGE_METRICS_CONFIG_READ\"\
        ,\n          \"PRIVILEGE_METRICS_CONFIG_WRITE\",\n          \"PRIVILEGE_REBOOT_USE\"\
        ,\n          \"PRIVILEGE_REBOOT_READ\",\n          \"PRIVILEGE_CHECKSUMMING_READ\"\
        ,\n          \"PRIVILEGE_S3_SETTINGS_READ\",\n          \"PRIVILEGE_S3_SETTINGS_WRITE\"\
        ,\n          \"PRIVILEGE_WEB_UI_SETTINGS_WRITE\",\n          \"PRIVILEGE_S3_CREDENTIALS_READ\"\
        ,\n          \"PRIVILEGE_S3_CREDENTIALS_WRITE\",\n          \"PRIVILEGE_TENANT_READ\"\
        ,\n          \"PRIVILEGE_TENANT_WRITE\",\n          \"PRIVILEGE_SAML_SETTINGS_READ\"\
        ,\n          \"PRIVILEGE_SAML_SETTINGS_WRITE\",\n          \"PRIVILEGE_S3_BUCKETS_READ\"\
        ,\n          \"PRIVILEGE_S3_BUCKETS_WRITE\",\n          \"PRIVILEGE_ACCESS_TOKENS_READ\"\
        ,\n          \"PRIVILEGE_ACCESS_TOKENS_WRITE\",\n          \"PRIVILEGE_S3_UPLOADS_READ\"\
        ,\n          \"PRIVILEGE_S3_UPLOADS_WRITE\",\n          \"PRIVILEGE_SNAPSHOT_LOCK\"\
        ,\n          \"PRIVILEGE_FS_KEY_MANAGEMENT_WRITE\",\n          \"PRIVILEGE_FS_KEY_MANAGEMENT_READ\"\
        ,\n          \"PRIVILEGE_IDENTITY_CONFIG_WRITE\",\n          \"PRIVILEGE_IDENTITY_CONFIG_READ\"\
        ,\n          \"PRIVILEGE_FILE_READ_ACCESS\",\n          \"PRIVILEGE_PORTAL_SPOKE_READ\"\
        ,\n          \"PRIVILEGE_PORTAL_SPOKE_WRITE\",\n          \"PRIVILEGE_PORTAL_SPOKE_EVICT\"\
        ,\n          \"PRIVILEGE_PORTAL_HUB_READ\",\n          \"PRIVILEGE_PORTAL_HUB_WRITE\"\
        ,\n          \"PRIVILEGE_PORTAL_GLOBAL_READ\",\n          \"PRIVILEGE_FS_FILE_LOCK_WRITE\"\
        ,\n          \"PRIVILEGE_LICENSE_READ\",\n          \"PRIVILEGE_CAPACITY_READ\"\
        ,\n          \"PRIVILEGE_CAPACITY_WRITE\",\n          \"PRIVILEGE_OBJECT_STORAGE_URIS_READ\"\
        ,\n          \"PRIVILEGE_OBJECT_STORAGE_URIS_WRITE\"\n        ],\n       \
        \ \"description\": \"The user's privileges:\\n * `PRIVILEGE_ACCESS_TOKENS_READ`\
        \ - View any access tokens present in the system,\\n * `PRIVILEGE_ACCESS_TOKENS_WRITE`\
        \ - Create or delete access tokens for any user in the system,\\n * `PRIVILEGE_AD_READ`\
        \ - Read Qumulo Active Directory settings,\\n * `PRIVILEGE_AD_USE` - Use Qumulo's\
        \ APIs for performing queries against Active Directory,\\n * `PRIVILEGE_AD_WRITE`\
        \ - Modify Qumulo Active Directory settings,\\n * `PRIVILEGE_ANALYTICS_READ`\
        \ - Read cluster analytics,\\n * `PRIVILEGE_AUDIT_READ` - Read audit settings,\\\
        n * `PRIVILEGE_AUDIT_WRITE` - Modify audit settings,\\n * `PRIVILEGE_AUTH_CACHE_READ`\
        \ - Internal-Only: Read authentication cache settings,\\n * `PRIVILEGE_AUTH_CACHE_WRITE`\
        \ - Internal-Only: Modify authentication cache settings,\\n * `PRIVILEGE_CAPACITY_READ`\
        \ - View the capacity clamp value.,\\n * `PRIVILEGE_CAPACITY_WRITE` - Set\
        \ the capacity clamp value.,\\n * `PRIVILEGE_CHECKSUMMING_READ` - View the\
        \ status of checksumming,\\n * `PRIVILEGE_CLUSTER_READ` - View nodes, disks,\
        \ protection status, and SSL certificate,\\n * `PRIVILEGE_CLUSTER_WRITE` -\
        \ Modify cluster settings and disk/identify LEDs,\\n * `PRIVILEGE_DEBUG` -\
        \ Internal-Only: Perform debug operations on the cluster,\\n * `PRIVILEGE_DNS_READ`\
        \ - Read DNS settings,\\n * `PRIVILEGE_DNS_USE` - Perform DNS lookups,\\n\
        \ * `PRIVILEGE_DNS_WRITE` - Modify DNS settings,\\n * `PRIVILEGE_ENCRYPTION_READ`\
        \ - View the status of at-rest-encryption,\\n * `PRIVILEGE_ENCRYPTION_WRITE`\
        \ - Rotate encryption keys for clusters with at-rest-encryption,\\n * `PRIVILEGE_FILE_FULL_ACCESS`\
        \ - Provides full access to all files regardless of permissions,\\n * `PRIVILEGE_FILE_READ_ACCESS`\
        \ - Provides read access to all files regardless of permissions,\\n * `PRIVILEGE_FS_ATTRIBUTES_READ`\
        \ - Read file system statistics,\\n * `PRIVILEGE_FS_DELETE_TREE_READ` - View\
        \ the status of directory tree delete operations,\\n * `PRIVILEGE_FS_DELETE_TREE_WRITE`\
        \ - Use directory tree delete API. Granting this privilege allows the deletion\
        \ of any file or directory on the cluster. File and directory permissions\
        \ are not taken into account. Not required for `rm -r`.,\\n * `PRIVILEGE_FS_FILE_LOCK_WRITE`\
        \ - Set or extend file lock retention periods and legal holds.,\\n * `PRIVILEGE_FS_KEY_MANAGEMENT_READ`\
        \ - Read and list public keys for various FS security features.,\\n * `PRIVILEGE_FS_KEY_MANAGEMENT_WRITE`\
        \ - Create and manage public keys for various FS security features.,\\n *\
        \ `PRIVILEGE_FS_LOCK_READ` - View NLM and SMB locks and waiters,\\n * `PRIVILEGE_FS_LOCK_WRITE`\
        \ - Release NLM and SMB locks,\\n * `PRIVILEGE_FS_SETTINGS_READ` - View file\
        \ system permissions settings,\\n * `PRIVILEGE_FS_SETTINGS_WRITE` - Modify\
        \ file system permissions mode,\\n * `PRIVILEGE_FTP_READ` - View FTP status\
        \ and settings,\\n * `PRIVILEGE_FTP_WRITE` - Modify FTP status and settings,\\\
        n * `PRIVILEGE_IDENTITY_CONFIG_READ` - Read and list identity configurations.,\\\
        n * `PRIVILEGE_IDENTITY_CONFIG_WRITE` - Modify identity configurations.,\\\
        n * `PRIVILEGE_IDENTITY_MAPPING_READ` - Get AD/LDAP User Defined Mappings,\\\
        n * `PRIVILEGE_IDENTITY_MAPPING_WRITE` - Set AD/LDAP User Defined Mappings,\\\
        n * `PRIVILEGE_IDENTITY_READ` - Use Qumulo's identity lookup and translation\
        \ APIs,\\n * `PRIVILEGE_IDENTITY_WRITE` - Modify identity attributes and clear\
        \ authentication cache,\\n * `PRIVILEGE_KERBEROS_KEYTAB_READ` - View Kerberos\
        \ keytab,\\n * `PRIVILEGE_KERBEROS_KEYTAB_WRITE` - Modify Kerberos keytab,\\\
        n * `PRIVILEGE_KERBEROS_SETTINGS_READ` - Read Kerberos settings,\\n * `PRIVILEGE_KERBEROS_SETTINGS_WRITE`\
        \ - Modify Kerberos settings,\\n * `PRIVILEGE_KV_READ` - DEPRECATED: Read\
        \ and delete KV store entries for all users,\\n * `PRIVILEGE_LDAP_READ` -\
        \ View LDAP settings,\\n * `PRIVILEGE_LDAP_USE` - Use Qumulo's APIs for performing\
        \ LDAP queries,\\n * `PRIVILEGE_LDAP_WRITE` - Modify LDAP settings,\\n * `PRIVILEGE_LICENSE_READ`\
        \ - Get the cluster's license status.,\\n * `PRIVILEGE_LOCAL_GROUP_READ` -\
        \ View local groups and members,\\n * `PRIVILEGE_LOCAL_GROUP_WRITE` - Modify\
        \ local groups and membership,\\n * `PRIVILEGE_LOCAL_USER_READ` - Get information\
        \ about local users,\\n * `PRIVILEGE_LOCAL_USER_WRITE` - Create and modify\
        \ all local users,\\n * `PRIVILEGE_METRICS_CONFIG_READ` - View metrics configuration,\\\
        n * `PRIVILEGE_METRICS_CONFIG_WRITE` - Modify metrics configuration,\\n *\
        \ `PRIVILEGE_METRICS_READ` - Get all metrics,\\n * `PRIVILEGE_NETWORK_IP_ALLOCATION_READ`\
        \ - View network IP address allocations,\\n * `PRIVILEGE_NETWORK_READ` - Read\
        \ network status and settings,\\n * `PRIVILEGE_NETWORK_WRITE` - Modify network\
        \ configuration,\\n * `PRIVILEGE_NFS_EXPORT_READ` - View configuration of\
        \ NFS exports,\\n * `PRIVILEGE_NFS_EXPORT_WRITE` - Create, modify, and delete\
        \ NFS exports,\\n * `PRIVILEGE_NFS_SETTINGS_READ` - Internal-Only: View NFS\
        \ server settings,\\n * `PRIVILEGE_NFS_SETTINGS_WRITE` - Internal-Only: Modify\
        \ NFS server settings,\\n * `PRIVILEGE_OBJECT_STORAGE_URIS_READ` - View the\
        \ object storage URIs.,\\n * `PRIVILEGE_OBJECT_STORAGE_URIS_WRITE` - Add new\
        \ object storage URIs.,\\n * `PRIVILEGE_PORTAL_GLOBAL_READ` - View global\
        \ portal settings and status,\\n * `PRIVILEGE_PORTAL_HUB_READ` - View hub\
        \ portal relationship status and configuration,\\n * `PRIVILEGE_PORTAL_HUB_WRITE`\
        \ - Authorize, modify, and delete hub portal relationships. Granting this\
        \ privilege allows authorizing proposed relationships. Depending on existing\
        \ file and directory permissions, this privilege can allow remote access to\
        \ local data under the hub root directory.,\\n * `PRIVILEGE_PORTAL_SPOKE_EVICT`\
        \ - Remove cached files and directories from a spoke portal. Qumulo Core recaches\
        \ the removed files or directories upon access.,\\n * `PRIVILEGE_PORTAL_SPOKE_READ`\
        \ - View spoke portal relationship status and configuration,\\n * `PRIVILEGE_PORTAL_SPOKE_WRITE`\
        \ - Create, modify, and delete spoke portal relationships. Granting this privilege\
        \ allows creating spoke portal root directories. Depending on existing file\
        \ permissions, this privilege can allow local access to remote files and directories.,\\\
        n * `PRIVILEGE_POWER_CYCLE` - Shutdown and reboot nodes,\\n * `PRIVILEGE_QUOTA_READ`\
        \ - View all file system quotas,\\n * `PRIVILEGE_QUOTA_WRITE` - Create, modify,\
        \ and delete file system quotas,\\n * `PRIVILEGE_REBOOT_READ` - View Reboot\
        \ Status,\\n * `PRIVILEGE_REBOOT_USE` - Perform Reboots,\\n * `PRIVILEGE_RECONCILER_READ`\
        \ - View reconciler status and metrics,\\n * `PRIVILEGE_REPLICATION_OBJECT_READ`\
        \ - View object store relationship settings and status,\\n * `PRIVILEGE_REPLICATION_OBJECT_WRITE`\
        \ - Create, modify, and delete object store relationships. Granting this privilege\
        \ allows overwriting existing data, replicating, and potentially accessing\
        \ any data on the cluster regardless of file and directory permissions.,\\\
        n * `PRIVILEGE_REPLICATION_REVERSE_RELATIONSHIP` - Reverse a source and target\
        \ relationship,\\n * `PRIVILEGE_REPLICATION_SOURCE_READ` - View source relationship\
        \ settings and status,\\n * `PRIVILEGE_REPLICATION_SOURCE_WRITE` - Create,\
        \ modify, and delete source relationships. Granting this privilege allows\
        \ replicating and potentially accessing any data on the cluster regardless\
        \ of file and directory permissions.,\\n * `PRIVILEGE_REPLICATION_TARGET_READ`\
        \ - View target relationship settings and status,\\n * `PRIVILEGE_REPLICATION_TARGET_WRITE`\
        \ - Create, modify, and delete target relationships. Granting this privilege\
        \ allows overwriting any data on the cluster regardless of file and directory\
        \ permissions.,\\n * `PRIVILEGE_ROLE_READ` - View roles and assignments,\\\
        n * `PRIVILEGE_ROLE_WRITE` - Create and modify roles and assignments,\\n *\
        \ `PRIVILEGE_S3_BUCKETS_READ` - View all S3 buckets and bucket policies present\
        \ in the system,\\n * `PRIVILEGE_S3_BUCKETS_WRITE` - Create or delete any\
        \ S3 bucket in the system, and create, delete, or modify policies for any\
        \ S3 bucket in the system. Subject to having sufficient FS permissions.,\\\
        n * `PRIVILEGE_S3_CREDENTIALS_READ` - View any S3 access key present in the\
        \ system,\\n * `PRIVILEGE_S3_CREDENTIALS_WRITE` - Create or delete S3 access\
        \ keys for any user in the system,\\n * `PRIVILEGE_S3_SETTINGS_READ` - View\
        \ S3 server settings,\\n * `PRIVILEGE_S3_SETTINGS_WRITE` - Modify S3 server\
        \ settings,\\n * `PRIVILEGE_S3_UPLOADS_READ` - View all S3 uploads present\
        \ in the system. This will override a bucket policy that denies the user this\
        \ permission.,\\n * `PRIVILEGE_S3_UPLOADS_WRITE` - Abort S3 uploads in the\
        \ system. This will override a bucket policy that denies the user this permission.,\\\
        n * `PRIVILEGE_SAML_SETTINGS_READ` - View SAML integration settings,\\n *\
        \ `PRIVILEGE_SAML_SETTINGS_WRITE` - Modify SAML integration settings,\\n *\
        \ `PRIVILEGE_SERVICE_PUBLIC_KEYS_READ` - Internal-Only: Read public keys,\\\
        n * `PRIVILEGE_SERVICE_PUBLIC_KEYS_WRITE` - Internal-Only: Write public keys,\\\
        n * `PRIVILEGE_SMB_FILE_HANDLE_READ` - List open SMB file handles,\\n * `PRIVILEGE_SMB_FILE_HANDLE_WRITE`\
        \ - Force close an open SMB file handle,\\n * `PRIVILEGE_SMB_SESSION_READ`\
        \ - List logged on SMB sessions,\\n * `PRIVILEGE_SMB_SESSION_WRITE` - Force\
        \ close a logged on SMB session,\\n * `PRIVILEGE_SMB_SHARE_READ` - View configuration\
        \ of SMB shares and SMB server settings,\\n * `PRIVILEGE_SMB_SHARE_WRITE`\
        \ - Create, modify, and delete SMB shares and SMB server settings,\\n * `PRIVILEGE_SNAPSHOT_CALCULATE_USED_CAPACITY_READ`\
        \ - Recalculate capacity usage of snapshots,\\n * `PRIVILEGE_SNAPSHOT_DIFFERENCE_READ`\
        \ - View the changes between snapshots,\\n * `PRIVILEGE_SNAPSHOT_LOCK` - Lock\
        \ or unlock snapshots. Configure snapshot policies to lock or unlock snapshots.,\\\
        n * `PRIVILEGE_SNAPSHOT_POLICY_READ` - View snapshot policies and status,\\\
        n * `PRIVILEGE_SNAPSHOT_POLICY_WRITE` - Create, modify, and delete snapshot\
        \ policies,\\n * `PRIVILEGE_SNAPSHOT_READ` - List snapshots and view their\
        \ status and cached capacity. Does not affect the visibility of the virtual\
        \ `.snapshot` directories,\\n * `PRIVILEGE_SNAPSHOT_WRITE` - Create, modify,\
        \ and delete snapshots,\\n * `PRIVILEGE_SUPPORT_READ` - View support configuration\
        \ and status,\\n * `PRIVILEGE_SUPPORT_WRITE` - Modify cloud-based monitoring\
        \ and remote management,\\n * `PRIVILEGE_TENANT_READ` - View any tenant information,\\\
        n * `PRIVILEGE_TENANT_WRITE` - Create, edit or delete tenants,\\n * `PRIVILEGE_TEST_ONLY`\
        \ - Test only actions,\\n * `PRIVILEGE_TIME_READ` - View time and time settings,\\\
        n * `PRIVILEGE_TIME_WRITE` - Modify time settings,\\n * `PRIVILEGE_UNCONFIGURED_NODE_READ`\
        \ - List unconfigured Qumulo nodes,\\n * `PRIVILEGE_UPGRADE_READ` - View upgrade\
        \ configuration and status,\\n * `PRIVILEGE_UPGRADE_WRITE` - Perform upgrades,\\\
        n * `PRIVILEGE_WEB_UI_SETTINGS_WRITE` - Modify web UI settings\"\n      }\n\
        \    },\n    \"access_token_id\": {\n      \"description\": \"The user's access\
        \ token ID. Only present when access token authentication is used.\",\n  \
        \    \"type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Retrieve information about the currently logged in user.
rest_endpoint: /v1/session/who-am-i
api_version: v1
permalink: /rest-api-guide/session-management/session_who-am-i.html
sidebar: rest_api_guide_sidebar
---
