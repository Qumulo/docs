---
title: "Required Networking Ports for Qumulo Core"
summary: "This section explains which inbound and outbound networking ports Qumulo Core requires."
permalink: /administrator-guide/qumulo-core/required-networking-ports.html
sidebar: administrator_guide_sidebar
keywords: networking, port, ports, qumulo core
---

This section explains which inbound and outbound networking ports Qumulo Core requires.

## Networking Ports for Inbound Connections

<table>
  <thead>
    <tr>
      <td>
        <strong>Port</strong>
      </td>
      <td>
        <strong>Protocols</strong>
      </td>
      <td>
        <strong>Use</strong>
      </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>21</td>
      <td>TCP</td>
      <td>FTP</td>
    </tr>
    <tr>
      <td>22</td>
      <td>
        <p>TCP</p>
      </td>
      <td>SSH</td>
    </tr>
    <tr>
      <td>80</td>
      <td>TCP</td>
      <td>HTTP (Web UI)</td>
    </tr>
    <tr>
      <td>111</td>
      <td>TCP, UDP</td>
      <td>
        <code>rpcbind</code> or <code>portmapper</code> for NFSv3
      </td>
    </tr>
    <tr>
      <td>443</td>
      <td>TCP</td>
      <td>HTTPS (Web UI)</td>
    </tr>
    <tr>
      <td>445</td>
      <td>TCP</td>
      <td>SMB</td>
    </tr>
    <tr>
      <td>2049</td>
      <td>TCP, UDP</td>
      <td>
        <p>NFS or MOUNT</p>
        <p>
          {% include note.html content="Qumulo Core supports UDP for the MOUNT protocol for older clients. However, any NFS clients—that specify the TCP mount option or transfer data over NFS after mounting—don't use UDP." %}
        </p>
      </td>
    </tr>
    <tr>
      <td>3712</td>
      <td>TCP</td>
      <td>Replication</td>
    </tr>
    <tr>
      <td>8000</td>
      <td>TCP</td>
      <td>REST API</td>
    </tr>
    <tr>
      <td>32768-60999</td>
      <td>TCP</td>
      <td >FTP Passive Mode</td>
    </tr>
  </tbody>
</table>

## Networking Ports for Outbound Connections

| Port | Protocols | Use |
|------|-----------|-----|
|   |   |   |
