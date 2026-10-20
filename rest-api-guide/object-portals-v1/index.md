---
layout: landing_page
sidebar: rest_api_guide_sidebar
summary: "[preview] The following methods manage object portals. An object portal presents a bucket, which here means an S3 bucket or an Azure Blob container, as a directory on the cluster called a bridge. The cluster reads files from the bucket as clients need them and picks up changes made in the bucket. Depending on the bridge's `protocol_access`, changes made on the cluster can be written back to the bucket. When the bucket refuses or fails a request, reads and listings on the bridge fail with an I/O error: STATUS_UNEXPECTED_IO_ERROR over SMB, NFS3ERR_IO or NFS4ERR_IO over NFS, InternalError over S3, and 550 over FTP. A method here that reads the bucket answers HTTP 503, whose message says only that the bucket failed the request, except that a create whose checks the bucket refuses, or an import whose manifest bucket the cluster can't open, answers HTTP 400."
title: Object Portals V1 (object-portal)
redirect_from:
- /rest-api-guide/object-portals/
---
