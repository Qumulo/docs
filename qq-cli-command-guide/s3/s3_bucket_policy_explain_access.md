---
category: s3
command: s3_bucket_policy_explain_access
optional_options:
- alternate: []
  help: The bucket for which the access policy will be explained.
  name: --bucket
  required: true
- alternate: []
  help: Auth ID of the qumulo user
  name: --auth-id
  required: false
- alternate: []
  help: An unauthenticated S3 user
  name: --anonymous
  required: false
permalink: /qq-cli-command-guide/s3/s3_bucket_policy_explain_access.html
positional_options:
- help: An auth_id, SID, or name optionally qualified with a domain prefix (e.g "local:name",
    "ad:name", "AD\name") or an ID type (e.g. "auth_id:513", "SID:S-1-1-0"). Groups
    are not supported for access keys, must be a user.
  name: identifier
  required: true
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq s3_bucket_policy_explain_access</code>
  command.
synopsis: Details a users access as allowed by the bucket policy
title: qq s3_bucket_policy_explain_access
usage: qq s3_bucket_policy_explain_access [-h] --bucket BUCKET [--auth-id AUTH_ID]
  [--anonymous] [identifier]
zendesk_source: qq CLI Command Guide

---
For more information, see {{site.xref.adminOnPrem.manageAccessS3}}.

## Examples

### To Explain a User Access Policy for an S3 Bucket
Run the `s3_bucket_policy_explain_access` command and specify the bucket name and the auth ID of the Qumulo user. For example:

```bash
qq s3_bucket_policy_explain_access \
  --bucket my-bucket \
  --auth-id 1234
```

{{site.exampleOutput}} The command lists the S3 API permissions that the specified auth ID can perform on the specified S3 bucket.

```
Bucket `my-bucket` access for identity:                                                   
{                                                                                           
    "auth_id": "1234"                                                                       
}                                                                                           
                                                                                            
Policy statements access evaluation:                                                        
==== 1 ====                                                                                 
Effect: Allow                                                                             
Actions: s3:GetObject, s3:ListBucket                                                      
==== 2 ====                                                                                 
Effect: None                                                                              
==== 3 ====                                                                                 
Effect: Deny                                                                              
Actions: s3:PutObject                                                                     
==== 4 ====                                                                                 
Effect: Allow                                                                             
Actions s3:DeleteBucket
S3 actions granted by RBAC:                                                                 
s3:DeleteBucket, s3:GetBucketPolicy                                                         
                                                                                            
S3 actions allowed for bucket:                                                              
action              source                                                                  
==================  ============                                                            
s3:DeleteBucket     RBAC, policy                                                            
s3:GetBucketPolicy  RBAC                                                                    
s3:GetObject        policy                                                                  
s3:ListBucket       policy  
```
