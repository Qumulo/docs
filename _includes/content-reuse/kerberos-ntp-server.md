Kerberos is very sensitive to clock skew. It is important for all systems involved in a Kerberos relationship&mdash;the KDC, your Qumulo cluster, and any Linux clients&mdash;to have as little clock skew as possible. We recommend using the same NTP server for all three components.

* You can use your AD domain controller as an NTP server. In the Qumulo Core Web UI, on the **Active Directory** page, for **Use Active Directory as your primary time server**, click **Yes**.

* To configure any other NTP server in the Qumulo Core Web UI, click **Cluster > Date & Time**.
