## Prerequisites
To configure the iLO port, you must have root access to the client-facing network through SSH. For example, you can run the `sudo -s` command.

{% include important.html content="Access to the iLO port on a public LAN can have serious security implications because it can grant anyone with credentials direct access to your server's hardware and console. Follow security best practices when implementing iLO access." %}

## How the iLO Port Works
Your node provides iLO support for out-of-band maintenance access even when the node is plugged in but powered off. {% if page.portLoc == nil %}The following diagram shows the location of the iLO port.{% endif %}
