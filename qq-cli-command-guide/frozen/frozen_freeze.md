---
category: frozen
command: frozen_freeze
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
permalink: /qq-cli-command-guide/frozen/frozen_freeze.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq frozen_freeze</code> command.
synopsis: Start a freeze job, which moves the data of files on a Frozen bridge to
  the Azure Archive tier, and print the job's ID and an estimate of the files and
  bytes it covers. From the moment the job reaches a file, the file's data can't change,
  and once the data is in the Archive tier it can't be read either, until a thaw brings
  it back, which takes Azure up to 15 hours. Azure charges an early-deletion fee for
  data that leaves the Archive tier within 180 days, including by a thaw.
title: qq frozen_freeze
usage: qq frozen_freeze [-h] (--subtree SUBTREE | --files FILES [FILES ...] | --files-from
  FILE) [--exclude PATH [PATH ...]]
zendesk_source: qq CLI Command Guide

---