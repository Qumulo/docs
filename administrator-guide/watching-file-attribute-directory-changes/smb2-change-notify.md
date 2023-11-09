---
title: "Watching for File Attribute and Directory Changes by Using SMB2 CHANGE_NOTIFY"
summary: "This section lists the completion filters that an SMB client can request and the corresponding actions that Qumulo Core returns for a matched change."
permalink: /administrator-guide/watching-file-attribute-directory-changes/smb2-change-notify.html
redirect_from:
  - /administrator-guide/file-system-protocols/watching-file-directory-changes-smb2-change-notify.html
sidebar: administrator_guide_sidebar
keywords: SMB2, CHANGE_NOTIFY, completion_filter, action, matched_change
varNoEA: Qumulo doesn't support mutating extended attributes (EA). If the system requests only the <code>FILE_NOTIFY_CHANGE_EA</code> filter, no events propagate.
---

{% include content-reuse/admin-guides/watching-file-attribute-directory-changes/smb2-change-notify.md %}
