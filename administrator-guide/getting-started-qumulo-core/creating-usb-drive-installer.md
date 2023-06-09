---
title: "Creating a Qumulo Core USB Drive Installer"
summary: "This section explains how to create a Qumulo Core USB Drive Installer on macOS or Windows for deployment on a hardware platform."
permalink: /administrator-guide/getting-started-qumulo-core/creating-usb-drive-installer.html
redirect_from:
  - /administrator-guide/qumulo-core/creating-usb-drive-installer.html
sidebar: administrator_guide_sidebar
keywords: Qumulo_Core, USB, USB drive, installer, macOS, mac, Windows
---

## Prerequisites
* USB 3.0 (or higher) drive (4 GB minimum)
* Qumulo Core USB installer image (to get the image, {{site.contactQumuloCare}})

## To Create a USB Drive Installer on macOS
1. Open Terminal and log in as `root` by using the `sudo -s` command.

1. Insert your USB drive and then find its disk label by using the `diskutil list` command.

   In the following example, the USB drive's device label is `disk2`.

   ```
   /dev/disk2 (external, physical):
      #:                       TYPE NAME                    SIZE       IDENTIFIER
      0:             Windows_FAT_32 MY_USB_DRIVE            *32.0 GB    disk2
   ```

1. To unmount the USB drive, use your USB drive's device label. For example:

   ```bash
   diskutil unmountDisk /dev/disk2
   ```

1. To write the Qumulo Core USB installer image to your USB drive, specify the path to your image file and the USB drive's device label. For example:

   ```
   dd if=/path-to-image-file/ of=/dev/rdisk2 bs=2m
   ```

   {{site.data.alerts.note}}
   If you encounter an <strong>Operation not permitted</strong> error in macOS, do the following.
   <ol>
     <li>Navigate to <strong>System Preferences &gt; Security & Privacy</strong>.</li>
     <li>On the <strong>Privacy</strong> tab, grant <strong>Full Disk Access</strong> to Terminal.</li>
     <li>Restart Terminal and try the command again.</li>
     <li>When finished, remove <strong>Full Disk Access</strong> from Terminal.</li>
   </ol>
   {{site.data.alerts.end}}

1. Eject your Qumulo Core USB Drive Installer. For example:

   ```bash
   diskutil eject disk2
   ```

## To Create a USB Drive Installer on Windows
To create a USB Drive Installer on Windows, you must use a third-party application such as [Rufus](https://rufus.ie/). We recommend Rufus because it can detect many USB storage devices (rather than only Windows-compatible ones).

{{site.data.alerts.important}}
<ul>
  <li>We don't recommend using other tools (such as Win32 Disk Imager) because they might encounter errors when unable to recognize the USB drive after writing data to it.</li>
  <li>When the operation concludes, you might not be able to view the contents of the USB drive on Windows because the drive will be formatted by using a different file system.</li>
</ul>
{{site.data.alerts.end}}

1. Insert your USB drive and run Rufus.

1. Under **Drive Properties**, select a device and the path to the Qumulo Core USB installer image.

1. For **Partition scheme**, select **MBR** and for **Target System**, select **BIOS or UEFI**.
   
1. Under **Format Options**, ensure that the **File system** is set to **FAT32 (Default)**.

1. Click **Start**.

1. If prompted to download a new version of `GRUB` or `vesamenu.c32`, click **No**.

1. When the **ISOHybrid image detected** dialog box appears, click **Write in DD Image mode** and then click **OK**.

1. To confirm the operation, destroy all data on the USB drive, and image the drive click **OK**.
