## coder list

List workspaces

```
coder list [flags]
```

### Options

```
  -a, --all              Specifies whether all workspaces will be listed or not.
  -c, --column strings   Columns to display in table output. Available columns: workspace, template, status, last built, outdated, starts at, stops after (default [workspace,template,status,last built,outdated,starts at,stops after])
  -h, --help             help for list
  -o, --output string    Output format. Available formats: table, json (default "table")
      --search string    Search for a workspace with a query. (default "owner:me")
```

### Options inherited from parent commands

```
      --global-config coder   Path to the global coder config directory.
                              Consumes $CODER_CONFIG_DIR (default "~/.config/coderv2")
      --header stringArray    HTTP headers added to all requests. Provide as "Key=Value".
                              Consumes $CODER_HEADER
      --no-feature-warning    Suppress warnings about unlicensed features.
                              Consumes $CODER_NO_FEATURE_WARNING
      --no-version-warning    Suppress warning when client and server versions do not match.
                              Consumes $CODER_NO_VERSION_WARNING
      --token string          Specify an authentication token. For security reasons setting CODER_SESSION_TOKEN is preferred.
                              Consumes $CODER_SESSION_TOKEN
      --url string            URL to a deployment.
                              Consumes $CODER_URL
  -v, --verbose               Enable verbose output.
                              Consumes $CODER_VERBOSE
```

### SEE ALSO

- [coder](coder.md) -
