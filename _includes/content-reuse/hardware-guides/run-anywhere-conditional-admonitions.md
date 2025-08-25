{% capture checkNetworks %}{% if page.platform contains 'all4110' %}Your {{site.all4110}} node uses a split networking configuration. Ensure that the <a href="wiring-nodes-networking-cluster.html#connecting-to-redundant-switches">front-end and back-end networks</a> are connected and operational before creating your cluster.{% elsif page.platform contains 'q1uag1' %}The dual-NIC variant of your {{site.q1uag1}} node uses a split networking configuration. Ensure that the <a href="configuring-ipmi-wiring-nodes.html#step-2-connecting-the-100-gbps-ports">front-end and back-end networks</a> are connected and operational before creating your cluster.{% endif %}{% endcapture %}

{% capture unifiedNetworking %} If only one of the networks is connected and operational during the cluster creation process, Qumulo Core deploys with the unified networking configuration.{% endcapture %}

{% assign combinedContent = checkNetworks | append: unifiedNetworking %}
{% include important.html content=combinedContent %}
