{{site.protectingData.storeKeysProtectResources}}

{{site.data.alerts.important}}
<ul>
  <li>{{site.protectingData.supportedKeys}}</li>
  <li>Qumulo Core retains only the public key. We strongly recommend storing the corresponding private key safely, outside of your Qumulo cluster and according to your organization's security policy.</li>
</ul>
{{site.data.alerts.end}}

For information about protecting your snapshots by using a key from the Qumulo file system key store, see [Locking and Unlocking Snapshots](../snapshots/locking-unlocking-snapshots.html).

{% include tip.html content="The response of the `qq fs_security_add_key` command includes the _key identifier._ When you use `qq fs_security` commands, you can specify either the key identifier (by using the `--id` flag) or the key name (by using the `--name` flag)." %}

<a id="add-public-key"></a>
## Adding a Public Key
This section explains how to add a public key to the Qumulo file system key store. To store a public key in the key store, you must have a pair of asymmetric keys. For more information, see [Generating an ECDSA Private Key](generating-storing-ecdsa-keys.html#generating-ecdsa-private-key).

### If You Have Access to the Private Key
{% capture cryptoLib %}{{site.protectingData.mustHaveCryptoLib}}{% endcapture %}
{% include note.html content=cryptoLib %}

Run the `qq fs_security_add_key` command and specify the key name, the path to the private key file, and an optional comment. For example:

```bash
qq fs_security_add_key \
  --name my-key-name \
  --private-key-file /path/to-my-file.pem \
  --comment "This is an optional comment."
```

### If You Don't Have Direct Access to the Private Key
Run the `qq fs_security_add_key` command and specify the key name, the public key contents, the Base64-encoded verification signature (the key name signed with the private key), and an optional comment. For example:

```bash
qq fs_security_add_key \
  --name my-key-name \
  --public-key "VGhpcyBpcyBteSBwdWJsaWMga2V5IGNvbnRlbnRzLg==" \
  --verification-signature "VGhpcyBpcyBteSB1bmxvY2sgY2hhbGxlbmdlLg==" \
  --comment "This is an optional comment."
```

For more information, see [Extracting the Public Key from an ECDSA Private Key](generating-storing-ecdsa-keys.html#extracting-the-public-key-from-an-ecdsa-private-key) and [Signing a Security Challenge by Using an ECDSA Private Key](generating-storing-ecdsa-keys.html#signing-a-security-challenge-by-using-an-ecdsa-private-key).


## Retrieving Public Key Information
* To retrieve information for a single public key, run the {% include qq.html command="fs_security_key" %} and specify the key identifier or name.

* To retrieve information for all public keys, run the {% include qq.html command="fs_security_list_keys" %} command.

  {{site.jsonNotTable}}


<a id="retrieve-key-usage"></a>
## Retrieving Public Key Usage Information
Run the `qq fs_security_get_usage` command and specify the key identifier or name.

{{site.jsonNotTable}}


## Modifying a Public Key
To modify the name or comment for a public key, run the {% include qq.html command="fs_security_modify_key" %} and specify the key identifier or name and the flags for the fields to modify.


## Rotating a Public Key
This section explains how to rotate a public key in the Qumulo file system key store.

{{site.data.alerts.note}}
<ul>
  <li>Key rotation doesn't affect the resources that the key protects or change the identifier or name of the public key.</li>
  <li>When the key rotation is complete, only the replacement public key can unlock the protected resources.</li>
</ul>
{{site.data.alerts.end}}

### If You Have Access to the Existing and Replacement Private Keys
{% include note.html content=cryptoLib %}

Run the `qq fs_security_replace_key` command and specify the key identifier or name, the path to the existing private key, and the path to the replacement private key. For example:

```bash
qq fs_security_replace_key \
  --name my-key-name \
  --old-private-key-file /path/to-existing-key.pem \
  --replacement-private-key-file /path/to-replacement-key.pem
```

### If You Don't Have Direct Access to the Existing and Replacement Private Keys
1. To receive the key replacement challenge, run the {% include qq.html command="fs_security_get_key_replace_challenge" %} and specify the identifier or name of the key to replace.

1. To generate a verification signature, use the response from the challenge with the existing private key and another verification signature by using the challenge and the replacement private key.

   For more information, see [Signing a Security Challenge by Using an ECDSA Private Key](generating-storing-ecdsa-keys.html#signing-a-security-challenge-by-using-an-ecdsa-private-key).

1. To rotate the key, run the {% include qq.html command="fs_security_replace_key" %} and specify the key identifier or name, the replacement public key contents, the replacement key verification signature (Base64-encoded key replacement challenge signed with the replacement private key), and the existing key verification signature (Base64-encoded key replacement challenge signed with the existing private key). For example:

   ```bash
   qq fs_security_replace_key \
     --name my-key-name \
     --replacement-public-key "VGhpcyBpcyBteSByZXBsYWNlbWVudCBwdWJsaWMga2V5Lg==" \
     --replacement-key-verification-signature "UmVwbGFjZW1lbnQga2V5IHZlcmlmaWNhdGlvbiBzaWduYXR1cmU=" \
     --old-key-verification-signature "RXhpc3Rpbmcga2V5IHZlcmlmaWNhdGlvbiBzaWduYXR1cmU="
   ```

   For more information, see [Extracting the Public Key from an ECDSA Private Key](generating-storing-ecdsa-keys.html#extracting-the-public-key-from-an-ecdsa-private-key).

   {% include important.html content="Because the key version is part of the challenge message, and this version changes when a user writes or modifies the key, any change to the key name or comment after you receive the challenge message makes the message stale." %}


## Disabling a Public Key
When you add a key to the Qumulo file system key store, Qumulo Core enables it automatically.

* To disable a key, run the {% include qq.html command="fs_security_modify_key" %} and specify the key identifier or name and the `--disable` flag.

* To re-enable a key, use the `--enable` flag.

{{site.data.alerts.note}}
<ul>
  <li>It isn't possible to lock a Qumulo file system resource with a disabled key. However, you can still unlock resources that this key locked previously.</li>
  <li>It isn't possible to disable a key that Qumulo Core uses to create new resources. For example, you can't disable a key associated with a snapshot policy when the snapshot policy creates new snapshots by using the key. In this scenario, you must disassociate the key from the snapshot policy before you can disable it. {{page.varXrefUsage}}</li>
</ul>
{{site.data.alerts.end}}


## Deleting a Public Key
Run the `qq fs_security_delete_key` command and specify the key identifier or name.

{% capture unlockBeforeDelete %}It isn't possible to delete a key that a Qumulo file system resource uses. {{page.varXrefUsage}}{% endcapture %}
{% include note.html content=unlockBeforeDelete %}
