# Audit Logs

Audit Logs allows **Auditors** to monitor user operations in
their deployment.

## Tracked Events

We track the following resources:

<!-- Code generated by 'make docs/admin/audit-logs.md'. DO NOT EDIT -->

| <b>Resource<b>                            |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| ----------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| APIKey<br><i>write</i>                    | <table><thead><tr><th>Field</th><th>Tracked</th></tr></thead><tbody><tr><td>created_at</td><td>false</td></tr><tr><td>expires_at</td><td>false</td></tr><tr><td>hashed_secret</td><td>false</td></tr><tr><td>id</td><td>false</td></tr><tr><td>ip_address</td><td>false</td></tr><tr><td>last_used</td><td>false</td></tr><tr><td>lifetime_seconds</td><td>false</td></tr><tr><td>login_type</td><td>false</td></tr><tr><td>scope</td><td>false</td></tr><tr><td>updated_at</td><td>false</td></tr><tr><td>user_id</td><td>false</td></tr></tbody></table>                                                                                                                                                                                                                                                                                                                          |
| Group<br><i>create, write, delete</i>     | <table><thead><tr><th>Field</th><th>Tracked</th></tr></thead><tbody><tr><td>avatar_url</td><td>true</td></tr><tr><td>id</td><td>true</td></tr><tr><td>members</td><td>true</td></tr><tr><td>name</td><td>true</td></tr><tr><td>organization_id</td><td>false</td></tr><tr><td>quota_allowance</td><td>true</td></tr></tbody></table>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| GitSSHKey<br><i>create</i>                | <table><thead><tr><th>Field</th><th>Tracked</th></tr></thead><tbody><tr><td>created_at</td><td>false</td></tr><tr><td>private_key</td><td>true</td></tr><tr><td>public_key</td><td>true</td></tr><tr><td>updated_at</td><td>false</td></tr><tr><td>user_id</td><td>true</td></tr></tbody></table>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| Template<br><i>write, delete</i>          | <table><thead><tr><th>Field</th><th>Tracked</th></tr></thead><tbody><tr><td>active_version_id</td><td>true</td></tr><tr><td>allow_user_cancel_workspace_jobs</td><td>true</td></tr><tr><td>created_at</td><td>false</td></tr><tr><td>created_by</td><td>true</td></tr><tr><td>default_ttl</td><td>true</td></tr><tr><td>deleted</td><td>false</td></tr><tr><td>description</td><td>true</td></tr><tr><td>display_name</td><td>true</td></tr><tr><td>group_acl</td><td>true</td></tr><tr><td>icon</td><td>true</td></tr><tr><td>id</td><td>true</td></tr><tr><td>is_private</td><td>true</td></tr><tr><td>min_autostart_interval</td><td>true</td></tr><tr><td>name</td><td>true</td></tr><tr><td>organization_id</td><td>false</td></tr><tr><td>provisioner</td><td>true</td></tr><tr><td>updated_at</td><td>false</td></tr><tr><td>user_acl</td><td>true</td></tr></tbody></table> |
| TemplateVersion<br><i>create, write</i>   | <table><thead><tr><th>Field</th><th>Tracked</th></tr></thead><tbody><tr><td>created_at</td><td>false</td></tr><tr><td>created_by</td><td>true</td></tr><tr><td>id</td><td>true</td></tr><tr><td>job_id</td><td>false</td></tr><tr><td>name</td><td>true</td></tr><tr><td>organization_id</td><td>false</td></tr><tr><td>readme</td><td>true</td></tr><tr><td>template_id</td><td>true</td></tr><tr><td>updated_at</td><td>false</td></tr></tbody></table>                                                                                                                                                                                                                                                                                                                                                                                                                           |
| User<br><i>create, write, delete</i>      | <table><thead><tr><th>Field</th><th>Tracked</th></tr></thead><tbody><tr><td>avatar_url</td><td>false</td></tr><tr><td>created_at</td><td>false</td></tr><tr><td>deleted</td><td>true</td></tr><tr><td>email</td><td>true</td></tr><tr><td>hashed_password</td><td>true</td></tr><tr><td>id</td><td>true</td></tr><tr><td>last_seen_at</td><td>false</td></tr><tr><td>login_type</td><td>false</td></tr><tr><td>rbac_roles</td><td>true</td></tr><tr><td>status</td><td>true</td></tr><tr><td>updated_at</td><td>false</td></tr><tr><td>username</td><td>true</td></tr></tbody></table>                                                                                                                                                                                                                                                                                              |
| Workspace<br><i>create, write, delete</i> | <table><thead><tr><th>Field</th><th>Tracked</th></tr></thead><tbody><tr><td>autostart_schedule</td><td>true</td></tr><tr><td>created_at</td><td>false</td></tr><tr><td>deleted</td><td>false</td></tr><tr><td>id</td><td>true</td></tr><tr><td>last_used_at</td><td>false</td></tr><tr><td>name</td><td>true</td></tr><tr><td>organization_id</td><td>false</td></tr><tr><td>owner_id</td><td>true</td></tr><tr><td>template_id</td><td>true</td></tr><tr><td>ttl</td><td>true</td></tr><tr><td>updated_at</td><td>false</td></tr></tbody></table>                                                                                                                                                                                                                                                                                                                                  |
| WorkspaceBuild<br><i>start, stop</i>      | <table><thead><tr><th>Field</th><th>Tracked</th></tr></thead><tbody><tr><td>build_number</td><td>false</td></tr><tr><td>created_at</td><td>false</td></tr><tr><td>daily_cost</td><td>false</td></tr><tr><td>deadline</td><td>false</td></tr><tr><td>id</td><td>false</td></tr><tr><td>initiator_id</td><td>false</td></tr><tr><td>job_id</td><td>false</td></tr><tr><td>provisioner_state</td><td>false</td></tr><tr><td>reason</td><td>false</td></tr><tr><td>template_version_id</td><td>true</td></tr><tr><td>transition</td><td>false</td></tr><tr><td>updated_at</td><td>false</td></tr><tr><td>workspace_id</td><td>false</td></tr></tbody></table>                                                                                                                                                                                                                           |

<!-- End generated by 'make docs/admin/audit-logs.md'. -->

## Filtering logs

In the Coder UI you can filter your audit logs using the pre-defined filter or by using the Coder's filter query like the examples below:

- `resource_type:workspace action:delete` to find deleted workspaces
- `resource_type:template action:create` to find created templates

The supported filters are:

- `resource_type` - The type of the resource. It can be a workspace, template, user, etc. You can [find here](https://pkg.go.dev/github.com/coder/coder/codersdk#ResourceType) all the resource types that are supported.
- `resource_id` - The ID of the resource.
- `resource_target` - The name of the resource. Can be used instead of `resource_id`.
- `action`- The action applied to a resource. You can [find here](https://pkg.go.dev/github.com/coder/coder/codersdk#AuditAction) all the actions that are supported.
- `username` - The username of the user who triggered the action.
- `email` - The email of the user who triggered the action.
- `date_from` - The inclusive start date with format `YYYY-MM-DD`.
- `date_to` - The inclusive end date with format `YYYY-MM-DD`.
- `build_reason` - To be used with `resource_type:workspace_build`, the [initiator](https://pkg.go.dev/github.com/coder/coder/codersdk#BuildReason) behind the build start or stop.

## Enabling this feature

This feature is only available with an enterprise license. [Learn more](../enterprise.md)