---
title: "Managing Snapshots"
summary: " This topic explains how you can view and manage your saved snapshots through the webUI."
permalink: managing-snapshots.html
sidebar: administrator_guide_sidebar
keywords: snapshots, filter, webUI
---

Qumulo Core 4.3.3 includes a redesigned snapshots page that allows users to view and manage large numbers of saved snapshots without having to make API queries. While it's possible to do these actions without the webUI, this page's ease of use allows snapshot management operations to be delegated to a wider range of users than could handle these operations otherwise.

## Viewing Your Snapshots

The snapshots page provides tools to make navigating upwards of tens of thousands of snapshots managable and performant.

### Accessing the Snapshots Page

1. Hover over the "Cluster" menu at the top of the screen.
1. Click the "Saved Snapshots" link in the dropdown that appears.

### Navigating Large Numbers of Snapshots

If you have more than 50 snapshots, you can navigate between pages of snapshots using the pagination controls at the top and bottom of the table.

{% include image.html alt="Pagination Controls" file="administrator-guide/managing-snapshots-pagination.png" %}

{% include tip.html content="The controls at the bottom of the table will also let you jump to a specific page, or change the number of rows per page." %}

### Finding Specific Snapshots

Since snapshots are divided into pages, you won't be able to rely on the web browser's built-in find functionality to find a specific snapshot. To replace this, the table has its own filtering functionality that will allow you to search for specific snapshots by name, creation time, or any other column in the table.

{% include image.html alt="Filter Toggle" file="administrator-guide/managing-snapshots-filter-off.png" %}

1. Click the filter toggle button at the top of the table next to the pagination controls.
1. Click one of the new inputs that has appeared between the table's header and its content.
1. Type a search query into the input.

As you type, the table rows will filter to match your query in real-time.

You can clear and turn off filters by clicking the filter toggle button again. Its text and coloring will change to reflect whether filters are currently active.

{% include image.html alt="Filter Toggle" file="administrator-guide/managing-snapshots-filter-on.png" %}

## Managing Your Snapshots

The page also includes functionality to delete snapshots, either one at a time or in bulk.

### Deleting a Single Snapshot

You can delete a single snapshot by clicking the delete icon at the end of the row you want to delete.

{% include image.html alt="Delete Icon" file="administrator-guide/managing-snapshots-delete.png" %}

### Deleting Multiple Snapshots

To delete multiple snapshots, you first need to select the ones you'd like to remove.

1. Click the checkbox at the beginning of the row for each snapshot you want to delete.
1. Notice that a delete button appears at the top of the table once a row is selected.
1. Click the delete button and follow the prompts in the dialog that appears.

{% include tip.html content="All selection and deletion controls will only ever modify the current page of data. If a snapshot isn't listed on the current page (either because it's on a different page or has been filtered out), you don't have to worry about accidentally deleting it." %}
