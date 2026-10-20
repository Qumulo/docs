---
category: frozen
command: frozen_thaw
optional_options:
- alternate: []
  help: Cluster path of one directory, with everything under it, or of one file, on
    a Frozen bridge.
  name: --subtree
  required: false
- alternate: []
  help: Cluster paths of files or directories, each directory with everything under
    it, on one Frozen bridge. Up to 256.
  name: --files
  required: false
- alternate: []
  help: A local file listing the cluster paths --files takes, one to a line. Empty
    lines are skipped.
  name: --files-from
  required: false
- alternate: []
  help: Cluster paths of files or directories for the job to leave as they are, each
    directory with everything under it. Each must exist and lie inside the subtree
    or inside a directory given to --files. A file that replaces an excluded file
    is left as it is too. Up to 256, given at once or over several --exclude options.
  name: --exclude
  required: false
- alternate: []
  help: The tier to bring the data back to. HOT, the default, costs the most to store
    and the least to read. COOL and COLD cost less to store, and Azure charges an
    early-deletion fee for data that leaves them within 30 or 90 days.
  name: --tier
  required: false
- alternate: []
  help: How fast Azure brings the data back. STANDARD, the default, takes up to 15
    hours. HIGH can bring a file under 10 GB back in under an hour, at a much higher
    price, but Azure limits it to about 10 GiB per hour for the storage account, so
    a HIGH thaw of more than about 150 GiB, counting other HIGH thaws still running,
    is no faster than STANDARD.
  name: --priority
  required: false
permalink: /qq-cli-command-guide/frozen/frozen_thaw.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq frozen_thaw</code> command.
synopsis: Start a thaw job, which brings the data of frozen files on a Frozen bridge
  back online at the tier you choose, HOT by default, after which the files can be
  read and written again. Azure takes up to 15 hours at STANDARD priority.
title: qq frozen_thaw
usage: qq frozen_thaw [-h] (--subtree SUBTREE | --files FILES [FILES ...] | --files-from
  FILE) [--exclude PATH [PATH ...]] [--tier {HOT,COOL,COLD}] [--priority {STANDARD,HIGH}]
zendesk_source: qq CLI Command Guide

---