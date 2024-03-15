The `qq` CLI is a powerful tool that lets you configure, manage, and administer Qumulo clusters.


## Prerequisites
The `qq` CLI works with Python 3.8 to 3.11.

{{site.data.alerts.tip}}
<ul>
  <li>On Linux or macOS, run the <code>chmod +x qq</code> command to make the <code>qq</code> CLI executable.</li>
  <li>On Windows, use the <code>python.exe</code> interpreter to run the <code>qq</code> CLI.</li>
</ul>
{{site.data.alerts.end}}


## Downloading or Installing the qq CLI
This section explains how to download the `qq` CLI from your Qumulo cluster or how to install it by using the Python SDK.

### To Download and Run the qq CLI from Your Qumulo Cluster
1. {{site.logIntoWebUI}}

1. Click **APIs & Tools > Download qq Command-Line Tool for Python 3.8+**

1. Run the `qq` CLI.

   * On Linux or macOS, run the `chmod +x qq` command to make the `qq` CLI executable.

   * On Windows, use the `python.exe` interpreter to run the `qq` CLI.

### To Install the qq CLI by Using the Python SDK
Run the `pip install qumulo_api` command.


## Exploring Your Qumulo Cluster by Using the qq CLI
The best way to start exploring your Qumulo cluster by using the `qq` CLI is to learn about its most frequently used commands. For example:

* **{% include qq.html command="login" %}:** Connect to the IP address of one of the nodes in your cluster and log in.
* **{% include qq.html command="nodes_list" %}:** List information about the nodes in your cluster.
* **{% include qq.html command="version" %}:** Show the version of Qumulo Core running on your cluster.
* **{% include qq.html command="fs_read_dir" %}:** List the contents of a directory on your cluster.
* **{% include qq.html command="fs_write" %}:** Write a file to a directory on your cluster.

{% include tip.html content="To get a complete list of `qq` CLI commands, run the `qq --help` command." %}

### To Run qq CLI from a Remote Machine
Run the `qq login` command and specify the IP address of one of the nodes in your cluster and your credentials. For example:

```bash
qq login --host {{site.exampleIP0}} \
  -u admin
  -p NW0bJbixtQcQzkq5q4sp
```

### To Run qq CLI from a Node in Your Cluster
Use SSH to log in to one of the nodes in your cluster.

{% include note.html content="It is possible to run `qq` CLI commands as the administrative Linux user. However, to do this, you must authenticate by using the `qq login` commqand." %}
