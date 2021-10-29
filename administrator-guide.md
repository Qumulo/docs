---
title: Qumulo on Azure as a Service Administrator Guide
permalink: administrator-guide.html
---

# Qumulo Administrator Guide
The Qumulo Administrator Guide is a growing collection of information about configuring, managing, and troubleshooting Qumulo Core and you Qumulo nodes and clusters.

**Table of Contents**
<ul>
 {% for page in site.pages %}
   {% for sidebar in page %}
        {% if sidebar == "administrator_guide_sidebar" %}
           <li><a href="{{ page.permalink | prepend: site.baseurl }}">{{page.title}}</a></li>
        {% endif %}
   {% endfor %}
 {% endfor %}
</ul>
