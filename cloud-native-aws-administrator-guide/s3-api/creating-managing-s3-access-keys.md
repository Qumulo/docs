---
title: "Creating and Managing S3 Access Keys in Qumulo Core"
summary: "This section explains how to create and manage credentials that S3 API actions in Qumulo Core require to access file system resources, such as access key pairs that sign requests."
permalink: /aws-administrator-guide/s3-api/creating-managing-s3-access-keys.html
sidebar: aws_administrator_guide_sidebar
varPaginatedResponsePart1: The `entries` list contains the access keys, limited to the first
varListMax: "10,000"
varPaginatedResponsePart2: The `paging.next` field contains the URI to which you can send a `GET` request to retrieve the next page of access keys. By making `GET` requests with all returned `paging.next` values, you can iterate over all of the access keys in the cluster.
varKeyDoAlso: along with the identities associated with the key and the key creation times
include_content: content-reuse/admin-guides/s3-api/creating-managing-s3-access-keys.md
---

