### Viewing Configuration Details and Status of Shift Relationships
* To view configuration details for all Shift relationships, run the {% include qq.html command="replication_list_object_relationships" %} command.

* To view configuration details for a specific relationship, run the {% include qq.html command="replication_get_object_relationship" %} command followed by the `--id` and the Shift relationship ID (GUID), for example:

   ```bash
   qq replication_get_object_relationship --id 1c23b4ed-5c67-8f90-1e23-a4f5f6ceff78
   ```

* To view the status of a specific relationship, run the {% include qq.html command="replication_get_object_relationship_status" %} command followed by the `--id` and the Shift relationship ID.

* To view the status of all relationships, run the {% include qq.html command="replication_list_object_relationship_statuses" %} command.

  The CLI returns the details of all relationships in JSON format, for example:
