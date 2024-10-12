Your nodes receive DHCP address assignments by default. When you configure a node's iLO port, you can access the node by using the IP address (that the DHCP server assigns to the node) and a browser that supports HTML5, Java, or .NET.

{% capture content_tag %}{{site.splitIlo}}{% endcapture %}
{% include important.html content=content_tag %}

To access iLO configuration from the BIOS System Utilities menu, press **F9**.

{% include note.html content="The IMPI username and password are unrelated to your Qumulo administrative credentials." %}

## iLO Configuration
To configure the iLO port, you must use `ipmitool`. For more information, see the following HPE resources:

{{ include.iloUserGuide }}

* [HPE iLO IPMI User Guide](https://support.hpe.com/hpesc/public/docDisplay?docId=a00018321en_us&docLocale=en_US&page=GUID-D7147C7F-2016-0901-06CE-0000000004E4.html)
