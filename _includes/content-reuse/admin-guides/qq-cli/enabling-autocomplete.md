The `qq` CLI supports [Python argparse completion](https://docs.python.org/3/library/argparse.html) that helps you use the CLI more effectively. This section explains how to enable automatic command completion for the `qq` CLI and for command aliases.

{% include important.html content="The following procedures apply to running the `qq` CLI on Linux, macOS, and Windows Subsystem for Linux. Don't run these commands on Qumulo nodes" %}

## To Enable Autocomplete for the qq CLI

1. Install the `argcomplete` Python package.

   ```bash
   pip install argcomplete
   ```
   
   {% include note.html content="Qumulo Core supports `argcomplete` 2.0.0 and higher." %}

1. Activate the `argcomplete` package.

   ```bash
   sudo activate-global-python-argcomplete
   ```

1. Search for any conflicting `qq` entries.
 
   ```bash
   complete | grep qq
   ```
   
   If conflicting entries exist, remove them by specifying the entry name or path. For example:
   
   ```bash
   complete -r /my/path
   ```

1. To enable autocompletion for the `qq` CLI, add the following line to the end of your shell profile (`.bashrc`, `.bash_profile`, and so on).

   ```
   eval "$(register-python-argcomplete qq)"
   ```

1. Reload your shell profile.

   ```bash
   source ~/.bashrc
   ```

You can now use the **Tab** key to autocomplete `qq` CLI commands. The `qq` CLI supports autocomplete for all CLI arguments and Qumulo REST API command arguments.


## Enabling Autocomplete for qq CLI Command Aliases

To eliminate the need to repeatedly enter `qq` CLI flags (such as `--host` or `--credentials-store`), for example when dealing with multiple Qumulo clusters, you can add aliases for `qq` CLI commands to your shell profile. In the following example, we alias a complex `qq` CLI command to the simple alias `qqcreds`.

```
alias qqcreds='qq --host my.qumulo.com --credentials-store ~/.my_creds'
```

When you reload your profile, you can append a parameter to the complex command by appending it to the alias. For example:

```bash
qqcreds my_credentials
```

To ensure that your `argcomplete` configuration works with `qq` CLI command aliases, you must perform additional configuration and add a third-party helper script to your system.

{% include important.html content="Before you begin, review the source code of the [complete-alias](https://github.com/cykerway/complete-alias/blob/master/complete_alias) helper script. Qumulo doesn't contribute to, maintain, or take responsibility for this script." %}

### To Enable Autocomplete for qq CLI Command Aliases

1. Add a `qq` CLI command alias and the `COMPAL_AUTO_UNMASK` configuration parameter to your shell profile (`.bashrc`, `.bash_profile`, and so on). For example:

   ```
   #qq CLI Autocomplete
   eval "$(register-python-argcomplete qq)"
   COMPAL_AUTO_UNMASK=1
   source ~/.bash_completion.d/complete_alias
   ```
   
   {% include tip.html content="Don't reload your shell profile yet." %}
   
1. Create a directory for the `complete-alias` daemon and download the script to it.

   ```bash
   mkdir ~/.bash_completion.d
   curl https://raw.githubusercontent.com/cykerway/complete-alias/master/complete_alias \
     > ~/.bash_completion.d/complete_alias
   ```
   
1. Add your alias to the `complete_alias` file.

   ```bash
   echo "complete -F _complete_alias qqcreds" >> ~/.bash_completion.d/complete_alias
   ```

1. Search for any conflicting `complete` entries.

   ```bash
   complete | grep complete
   ```
   
   If conflicting entries exist, remove them by specifying the entry name or path. For example:
   
   ```bash
   complete -r /my/path
   ```

1. Reload your shell profile.

   ```bash
   source ~/.bashrc
   ```

You can now use the **Tab** key to autocomplete `qq` CLI command aliases.
