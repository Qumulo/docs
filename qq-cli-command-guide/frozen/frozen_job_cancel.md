---
category: frozen
command: frozen_job_cancel
optional_options:
- alternate: []
  help: The job's ID, as frozen_freeze, frozen_thaw or frozen_job_list prints it.
  name: --id
  required: true
- alternate: []
  help: 'Cluster path of the Frozen bridge, or of any file or directory on it. (Default:
    the cluster''s only Frozen bridge, when it has exactly one)'
  name: --bridge-path
  required: false
permalink: /qq-cli-command-guide/frozen/frozen_job_cancel.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq frozen_job_cancel</code> command.
synopsis: Cancel a freeze or thaw job, which is CANCELED at once and starts on no
  more files. What it already did stays done, and files a freeze started on stay frozen
  until a thaw. A file whose upload may already have reached Azure is put in the Azure
  Archive tier as the job winds down, and then stays frozen until a thaw. A freeze's
  uploads stop after the part in progress, except one that replaces data an earlier
  freeze put in the Azure Archive tier, which runs to its end and for a large file
  can take hours; until it ends, the job's other files don't take writes. Azure still
  brings back the data of files whose thaw it has already accepted, and charges for
  it, though a later freeze can keep such a file frozen. Until every request the job
  already sent to Azure has returned and every such upload has ended, and the files
  it puts in the Archive tier as it winds down are archived, a later job that reaches
  one of its files waits.
title: qq frozen_job_cancel
usage: qq frozen_job_cancel [-h] --id ID [--bridge-path BRIDGE_PATH]
zendesk_source: qq CLI Command Guide

---