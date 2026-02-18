{% if page.context == 'qpp' %}
  {% capture howTo %}enable Qumulo-Managed Networking when you [install the Qumulo Core Product Package](#install-qumulo-core-product-package){% endcapture %}
You can choose a networking mode depending on the version of Qumulo Core that you want to install.
{% else %}
## Understanding the Difference Between Host-Managed Networking and Qumulo-Managed Networking
  {% capture howTo %}enable Qumulo-Managed Networking when you [install the Qumulo Core Product Package](../getting-started/installing-product-package.html#install-qumulo-core-product-package){% endcapture %}
This section explains the difference between the two networking modes in Qumulo Core. You can choose a networking mode depending on the version of Qumulo Core that you want to install.
{% endif %}

* <a id="host-managed-networking"></a> **Host-Managed Networking:** This is the default networking mode for Qumulo Core Product Package installations of Qumulo Core 7.8.0.1 (and higher).

  In this networking mode:
  * You're responsible for configuring most of your network infrastructure.
  * Qumulo provides configurations only for tenants and floating IP addresses.

  {% include note.html content="You can use Host-Managed Networking with or without the Qumulo REST API. However, using floating IP addresses requires tagging with alternative names and REST API access." %}

  To disable Host-Managed Networking, {{ howTo }}.

* <a id="qumulo-managed-networking"></a> **Qumulo-Managed Networking**: This is the default networking mode for Qumulo Core Product Package installations of Qumulo Core versions lower than 7.8.0.1.

  In this networking mode:
  * Qumulo is responsible for configuring your entire network infrastructure.
  * You can change only a limited number of settings.

  To enable Host-Managed Networking for Qumulo Core versions lower than 7.8.0, {{ howTo }}.
