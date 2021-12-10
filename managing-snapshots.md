---
title: Managing Snapshots
permalink: managing-snapshots.html
preamble: This topic explains how you can view and manage your saved snapshots through the frontend interface.
sidebar: administrator_guide_sidebar
tags:
  - snapshots
  - filter
  - frontend
---

The snapshots table makes it easy for anyone to view and manage their saved snapshots without having to make api queries.

## Accessing the snapshots page
1. Hover over the "Cluster" menu at the top of the screen.
1. Click the "Saved Snapshots" link in the dropdown that appears.

## Viewing your snapshots
By default, the snapshots page shows your most recent 50 snapshots ordered by creation time.

### Pagination
If you have more than 50 snapshots, you can use the pagination controls at the top and bottom of the table to navigate between pages.

{% include image.html alt="Pagination Controls" file="administrator-guide/managing-snapshots-pagination.png" %}

{% include tip.html content="The controls at the bottom of the table will also let you jump to a specific page, or change the number of rows per page." %}

### Sorting
To sort by something other than creation time, you can click the sort direction arrows in the headers for a column. Clicking it multiple times will cycle between sorting ascending or descending.

{% include image.html alt="Pagination Controls" file="administrator-guide/managing-snapshots-sort.png" %}

## Filtering
If you have a large number of snapshots, you can filter on any column in the snapshots table to narrow it down to only the ones you're interested in.

### Toggling filters
To enable filters, click the filter toggle button at the top of the table next to the pagination controls.

{% include image.html alt="Filter Toggle" file="administrator-guide/managing-snapshots-filter-off.png" %}

You can turn off filters by clicking the filter toggle button again. The toggle button's text and coloring will change to reflect whether filters are currently active.

{% include image.html alt="Filter Toggle" file="administrator-guide/managing-snapshots-filter-on.png" %}

### Filtering data
When filters are active, each column will have a filter control between its header and its data. Only snapshots that match all active filters will show in the table.

## Deleting snapshots

### Deleting a single snapshot
You can delete a single snapshot by clicking the delete icon at the end of the row you want to delete.

![Delete icon](administrator-guide/images/managing-snapshots-delete.png)

### Deleting multiple snapshots
When you select snapshots using the checkbox at the beginning of their row, a delete button will appear at the top of the table. Clicking that button will delete all selected snapshots.

{% include tip.html content="All selection and deletion controls will only ever modify the current page of data. If a snapshot isn't listed on the current page (either because it's on a different page or has been filtered out), you don't have to worry about accidentally deleting it." %}
