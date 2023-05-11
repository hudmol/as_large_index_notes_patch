
# as_large_index_notes_patch

An ArchivesSpace plugin that patches handling of index notes such that resources are still
editable in the staff interface

Compatible with AS v3.x.

&copy; 2023 Hudson Molonglo.

## Overview

This plugin is a partial fix for this ticket:
  https://archivesspace.atlassian.net/browse/ANW-1445

    NOTE: This is not intended to be a permanent not complete solution, but a stopgap until
          that issue is resolved.

In the staff interface a resource with an index note with several thousand index items bogs
the browser down to such an extent that the edit screen is unusable. This plugin eases the pain
by rendering the index items in a table (rather than as fully rendered sub-records as in core).

A consequence of this is that index items cannot be edited via the staff interface. It is still
possible to add new items, but existing items cannot be edited nor deleted.

There is a threshold (defaults to 100 - see configuration below) for the number of index items
that will trigger this alternative rendering. This means it is still possible to view and edit
note indices normally for cases where there are fewer items than the threshold.

## Installation

There are no special installation steps.

## Configuration

There is one optional configuration option:

Example:
```
  AppConfig[:large_index_notes_threshold] = 200
```

This must be given an integer value. It defaults to 100. It sets the threshold number of note items
that will trigger the special handling.


