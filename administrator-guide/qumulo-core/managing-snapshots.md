---
title: "Managing Snapshots"
summary: "This topic explains how you can use the Qumulo Core Web UI to view and manage your saved snapshots."
permalink: /administrator-guide/qumulo-core/managing-snapshots.html
redirect_from:
  - /managing-snapshots.html
  - /administrator-guide/managing-snapshots.html
sidebar: administrator_guide_sidebar
keywords: snapshots, filter, web ui, qumulo core
varLogin: 1. Log in to Qumulo Core.
varSaved: 1. Click **Cluster > Saved Snapshots**.
---

The **Snapshots** page in Qumulo Core 4.3.3 (and higher) lets you view and manage large numbers of saved snapshots without having to make API queries. This makes it possible to delegate snapshot management operations to a wide range of users.

## To View Your Snapshots
The **Snapshots** page lets you navigate a large number of snapshots.

{{page.varLogin}}

{{page.varSaved}}

1. If you have more than 50 snapshots, click {% include inline_image.html alt="Pagination controls" file="managing-snapshots-pagination.png" max-width="40" %} to navigate the snapshot pages.

   You can also use the controls at the bottom of the table to navigate to a specific page or change the number of rows per page.

## To Find a Specific Snapshot

The table on the **Snapshots** page has a filtering mode that lets you search for a specific snapshot by name, creation time, or any other column.

{{page.varLogin}}

{{page.varSaved}}

1. At the top of the table, click {% include inline_image.html alt="Filters off" file="managing-snapshots-filter-off.png" max-width="75"%}.

   The **Search...** field appears.

1. Enter a search query.

   The table rows filter to match your query as you type.

1. To toggle filtering off, click {% include inline_image.html alt="Filters on" file="managing-snapshots-filter-on.png" max-width="75"%}.

## To Delete a Single Snapshot

{{page.varLogin}}

{{page.varSaved}}

1. On the right-most side of a snapshot's row, click {% include inline_image.html alt="Delete icon" file="managing-snapshots-delete.png" max-width="25" %}.

## To Delete Multiple Snapshots

{{page.varLogin}}

{{page.varSaved}}

1. On the left-most side of the table, click the checkbox for every snapshot you want to delete.

   When you select more than one row, the **Delete** button appears.

1. When you finish selecting snapshots, click **Delete**.

{% include note.html content="All selection and deletion controls modify only the current page. You can't delete a snapshot accidentally if it isn't listed on the current page (because it is on a different page or is filtered out)." %}
