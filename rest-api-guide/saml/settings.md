---
category: /saml
methods:
  get:
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"api_v1_saml_settings\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"enabled\": {\n      \"description\": \"When\
        \ enabled, the cluster accepts SAML authentication. It is necessary first\
        \ to create a SAML integration for the cluster with a third-party SSO service\
        \ (that will act as a SAML Identity Provider) and obtain IdP SSO URL and X.509\
        \ certificate. Use https://cluster-fqdn/saml for the Service Provider endpoint\
        \ when creating the SAML integration. The cluster must be joined to an Active\
        \ Directory domain, and the SSO service must be connected to the same domain.\"\
        ,\n      \"type\": \"boolean\"\n    },\n    \"idp_sso_url\": {\n      \"description\"\
        : \"IdP SSO URL. The cluster will send a SAML authentication request to this\
        \ URL to ask for a Single Sign-On from the Identity Provider. \",\n      \"\
        type\": \"string\"\n    },\n    \"idp_certificate\": {\n      \"description\"\
        : \"IdP X.509 certificate in PEM format. The cluster will use it to validate\
        \ the SAML Response received from the Identity Provider before granting the\
        \ user from the response a bearer token to access the cluster.\",\n      \"\
        type\": \"string\"\n    },\n    \"idp_entity_id\": {\n      \"description\"\
        : \"IdP entity ID. Must be a URI provided by the IdP. The cluster will use\
        \ it to prepare correctly-formed SAML requests to the IdP and to verify that\
        \ received SAML responses came from that IdP.\",\n      \"type\": \"string\"\
        \n    },\n    \"cluster_dns_name\": {\n      \"description\": \"DNS name of\
        \ the cluster. Must be of the form `cluster.domain.com`. The cluster uses\
        \ this to correctly redirect authentication flows back to itself when the\
        \ user attempts to log in to the Identity Provider.\",\n      \"type\": \"\
        string\"\n    },\n    \"require_sso\": {\n      \"description\": \"If set,\
        \ requires SSO for Active Directory (AD) users to be able to manage this cluster.\
        \ The cluster rejects password-based authentication from AD users of the Web\
        \ UI, qq CLI, and REST API. This setting does not restrict access over file\
        \ protocols such as SMB.\",\n      \"type\": \"boolean\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Retrieve the current SAML integration settings.
  patch:
    parameters:
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      schema: "{\n  \"description\": \"api_v1_saml_settings_patch\",\n  \"type\":\
        \ \"object\",\n  \"properties\": {\n    \"enabled\": {\n      \"description\"\
        : \"When enabled, the cluster accepts SAML authentication. It is necessary\
        \ first to create a SAML integration for the cluster with a third-party SSO\
        \ service (that will act as a SAML Identity Provider) and obtain IdP SSO URL\
        \ and X.509 certificate. Use https://cluster-fqdn/saml for the Service Provider\
        \ endpoint when creating the SAML integration. The cluster must be joined\
        \ to an Active Directory domain, and the SSO service must be connected to\
        \ the same domain.\",\n      \"type\": \"boolean\"\n    },\n    \"idp_sso_url\"\
        : {\n      \"description\": \"IdP SSO URL. The cluster will send a SAML authentication\
        \ request to this URL to ask for a Single Sign-On from the Identity Provider.\
        \ \",\n      \"type\": \"string\"\n    },\n    \"idp_certificate\": {\n  \
        \    \"description\": \"IdP X.509 certificate in PEM format. The cluster will\
        \ use it to validate the SAML Response received from the Identity Provider\
        \ before granting the user from the response a bearer token to access the\
        \ cluster.\",\n      \"type\": \"string\"\n    },\n    \"idp_entity_id\":\
        \ {\n      \"description\": \"IdP entity ID. Must be a URI provided by the\
        \ IdP. The cluster will use it to prepare correctly-formed SAML requests to\
        \ the IdP and to verify that received SAML responses came from that IdP.\"\
        ,\n      \"type\": \"string\"\n    },\n    \"cluster_dns_name\": {\n     \
        \ \"description\": \"DNS name of the cluster. Must be of the form `cluster.domain.com`.\
        \ The cluster uses this to correctly redirect authentication flows back to\
        \ itself when the user attempts to log in to the Identity Provider.\",\n \
        \     \"type\": \"string\"\n    },\n    \"require_sso\": {\n      \"description\"\
        : \"If set, requires SSO for Active Directory (AD) users to be able to manage\
        \ this cluster. The cluster rejects password-based authentication from AD\
        \ users of the Web UI, qq CLI, and REST API. This setting does not restrict\
        \ access over file protocols such as SMB.\",\n      \"type\": \"boolean\"\n\
        \    }\n  }\n}"
    response_body:
      schema: "{\n  \"description\": \"api_v1_saml_settings\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"enabled\": {\n      \"description\": \"When\
        \ enabled, the cluster accepts SAML authentication. It is necessary first\
        \ to create a SAML integration for the cluster with a third-party SSO service\
        \ (that will act as a SAML Identity Provider) and obtain IdP SSO URL and X.509\
        \ certificate. Use https://cluster-fqdn/saml for the Service Provider endpoint\
        \ when creating the SAML integration. The cluster must be joined to an Active\
        \ Directory domain, and the SSO service must be connected to the same domain.\"\
        ,\n      \"type\": \"boolean\"\n    },\n    \"idp_sso_url\": {\n      \"description\"\
        : \"IdP SSO URL. The cluster will send a SAML authentication request to this\
        \ URL to ask for a Single Sign-On from the Identity Provider. \",\n      \"\
        type\": \"string\"\n    },\n    \"idp_certificate\": {\n      \"description\"\
        : \"IdP X.509 certificate in PEM format. The cluster will use it to validate\
        \ the SAML Response received from the Identity Provider before granting the\
        \ user from the response a bearer token to access the cluster.\",\n      \"\
        type\": \"string\"\n    },\n    \"idp_entity_id\": {\n      \"description\"\
        : \"IdP entity ID. Must be a URI provided by the IdP. The cluster will use\
        \ it to prepare correctly-formed SAML requests to the IdP and to verify that\
        \ received SAML responses came from that IdP.\",\n      \"type\": \"string\"\
        \n    },\n    \"cluster_dns_name\": {\n      \"description\": \"DNS name of\
        \ the cluster. Must be of the form `cluster.domain.com`. The cluster uses\
        \ this to correctly redirect authentication flows back to itself when the\
        \ user attempts to log in to the Identity Provider.\",\n      \"type\": \"\
        string\"\n    },\n    \"require_sso\": {\n      \"description\": \"If set,\
        \ requires SSO for Active Directory (AD) users to be able to manage this cluster.\
        \ The cluster rejects password-based authentication from AD users of the Web\
        \ UI, qq CLI, and REST API. This setting does not restrict access over file\
        \ protocols such as SMB.\",\n      \"type\": \"boolean\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Modify the SAML integration settings.
  put:
    parameters:
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      schema: "{\n  \"description\": \"api_v1_saml_settings\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"enabled\": {\n      \"description\": \"When\
        \ enabled, the cluster accepts SAML authentication. It is necessary first\
        \ to create a SAML integration for the cluster with a third-party SSO service\
        \ (that will act as a SAML Identity Provider) and obtain IdP SSO URL and X.509\
        \ certificate. Use https://cluster-fqdn/saml for the Service Provider endpoint\
        \ when creating the SAML integration. The cluster must be joined to an Active\
        \ Directory domain, and the SSO service must be connected to the same domain.\"\
        ,\n      \"type\": \"boolean\"\n    },\n    \"idp_sso_url\": {\n      \"description\"\
        : \"IdP SSO URL. The cluster will send a SAML authentication request to this\
        \ URL to ask for a Single Sign-On from the Identity Provider. \",\n      \"\
        type\": \"string\"\n    },\n    \"idp_certificate\": {\n      \"description\"\
        : \"IdP X.509 certificate in PEM format. The cluster will use it to validate\
        \ the SAML Response received from the Identity Provider before granting the\
        \ user from the response a bearer token to access the cluster.\",\n      \"\
        type\": \"string\"\n    },\n    \"idp_entity_id\": {\n      \"description\"\
        : \"IdP entity ID. Must be a URI provided by the IdP. The cluster will use\
        \ it to prepare correctly-formed SAML requests to the IdP and to verify that\
        \ received SAML responses came from that IdP.\",\n      \"type\": \"string\"\
        \n    },\n    \"cluster_dns_name\": {\n      \"description\": \"DNS name of\
        \ the cluster. Must be of the form `cluster.domain.com`. The cluster uses\
        \ this to correctly redirect authentication flows back to itself when the\
        \ user attempts to log in to the Identity Provider.\",\n      \"type\": \"\
        string\"\n    },\n    \"require_sso\": {\n      \"description\": \"If set,\
        \ requires SSO for Active Directory (AD) users to be able to manage this cluster.\
        \ The cluster rejects password-based authentication from AD users of the Web\
        \ UI, qq CLI, and REST API. This setting does not restrict access over file\
        \ protocols such as SMB.\",\n      \"type\": \"boolean\"\n    }\n  }\n}"
    response_body:
      schema: "{\n  \"description\": \"api_v1_saml_settings\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"enabled\": {\n      \"description\": \"When\
        \ enabled, the cluster accepts SAML authentication. It is necessary first\
        \ to create a SAML integration for the cluster with a third-party SSO service\
        \ (that will act as a SAML Identity Provider) and obtain IdP SSO URL and X.509\
        \ certificate. Use https://cluster-fqdn/saml for the Service Provider endpoint\
        \ when creating the SAML integration. The cluster must be joined to an Active\
        \ Directory domain, and the SSO service must be connected to the same domain.\"\
        ,\n      \"type\": \"boolean\"\n    },\n    \"idp_sso_url\": {\n      \"description\"\
        : \"IdP SSO URL. The cluster will send a SAML authentication request to this\
        \ URL to ask for a Single Sign-On from the Identity Provider. \",\n      \"\
        type\": \"string\"\n    },\n    \"idp_certificate\": {\n      \"description\"\
        : \"IdP X.509 certificate in PEM format. The cluster will use it to validate\
        \ the SAML Response received from the Identity Provider before granting the\
        \ user from the response a bearer token to access the cluster.\",\n      \"\
        type\": \"string\"\n    },\n    \"idp_entity_id\": {\n      \"description\"\
        : \"IdP entity ID. Must be a URI provided by the IdP. The cluster will use\
        \ it to prepare correctly-formed SAML requests to the IdP and to verify that\
        \ received SAML responses came from that IdP.\",\n      \"type\": \"string\"\
        \n    },\n    \"cluster_dns_name\": {\n      \"description\": \"DNS name of\
        \ the cluster. Must be of the form `cluster.domain.com`. The cluster uses\
        \ this to correctly redirect authentication flows back to itself when the\
        \ user attempts to log in to the Identity Provider.\",\n      \"type\": \"\
        string\"\n    },\n    \"require_sso\": {\n      \"description\": \"If set,\
        \ requires SSO for Active Directory (AD) users to be able to manage this cluster.\
        \ The cluster rejects password-based authentication from AD users of the Web\
        \ UI, qq CLI, and REST API. This setting does not restrict access over file\
        \ protocols such as SMB.\",\n      \"type\": \"boolean\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Set the SAML integration settings.
rest_endpoint: /v1/saml/settings
api_version: v1
permalink: /rest-api-guide/saml/settings.html
sidebar: rest_api_guide_sidebar
---
