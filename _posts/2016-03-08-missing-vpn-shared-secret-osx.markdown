---
layout: post
title:  "Fixing missing VPN shared secret in OS X El Capitan"
date:   2016-03-08 21:02:23 +0000
categories: osx
---
This morning I finally updated my work MacBook to OS X 10.11.3. Shortly afterwards though, I found that I could no longer connect to my employer’s VPN. What follows is a quick background of my problem and how I fixed it.

The background to this issue is that I recently acquired a new MacBook from work.

On powering up the new machine, I began the process of transferring my documents and settings from my old Mac. I was planning to do this over wifi until I realised that it was going to take over 3 hours.

I simply didn’t have the time to wait, so I abandoned the process after it had ran for about 10 minutes. And that is what possibly caused the issues below, combined with the OS X upgrade.

## Problem

First thing this morning, I installed the latest update from Apple to OS X, to 10.11.3. Then about half an hour later, when I tried to connect to my employer’s VPN, I got this message:

![VPN server did not respond]({{ site.url }}/assets/vpn-did-not-respond.png)

### Checking system.log

When working with VPN connections, some useful info is logged into **/var/log/system.log**. So I opened Terminal and checked what was being output to the log when I initiated the VPN connection:

    Mar  8 12:52:17 tdonohue2-OSX nesessionmanager[439]: NESMLegacySession[VPN AMS:C922B403-XXXX-XXXX-XXXX-XXXXXXXXXXXX]: Received a start command from SystemUIServer[289]
    Mar  8 12:52:17 tdonohue2-OSX nesessionmanager[439]: NESMLegacySession[VPN AMS:C922B403-XXXX-XXXX-XXXX-XXXXXXXXXXXX]: status changed to connecting
    Mar  8 12:52:17 tdonohue2-OSX nesessionmanager[439]: IPSec connecting to server xxxxx.xxxxx.com
    Mar  8 12:52:17 tdonohue2-OSX nesessionmanager[439]: IPSec Phase1 starting.
    Mar  8 12:52:18 tdonohue2-OSX racoon[490]: accepted connection on vpn control socket.
    Mar  8 12:52:18 --- last message repeated 1 time ---
    Mar  8 12:52:18 tdonohue2-OSX racoon[490]: IPSec connecting to server 209.XXX.XXX.XXX
    Mar  8 12:52:18 --- last message repeated 1 time ---
    Mar  8 12:52:18 tdonohue2-OSX racoon[490]: Connecting.
    Mar  8 12:52:18 tdonohue2-OSX racoon[490]: IPSec Phase 1 started (Initiated by me).
    Mar  8 12:52:18 --- last message repeated 1 time ---
    Mar  8 12:52:18 tdonohue2-OSX racoon[490]: IKE Packet: transmit success. (Initiator, Aggressive-Mode message 1).
    Mar  8 12:52:18 tdonohue2-OSX racoon[490]: >>>>> phase change status = Phase 1 started by us
    Mar  8 12:52:18 --- last message repeated 1 time ---
    Mar  8 12:52:18 tdonohue2-OSX racoon[490]: port 62465 expected, but 0
    Mar  8 12:52:18 --- last message repeated 1 time ---
    Mar  8 12:52:18 tdonohue2-OSX racoon[490]: try to get pskey by the peer's address.
    Mar  8 12:52:18 --- last message repeated 1 time ---
    Mar  8 12:52:18 tdonohue2-OSX racoon[490]: couldn't find the pskey by address 209.XXX.XXX.XXX.
    Mar  8 12:52:18 --- last message repeated 1 time ---
    Mar  8 12:52:18 tdonohue2-OSX racoon[490]: couldn't find the pskey for 209.XXX.XXX.XXX.
    Mar  8 12:52:18 --- last message repeated 1 time ---
    Mar  8 12:52:18 tdonohue2-OSX racoon[490]: failed to generate SKEYID
    Mar  8 12:52:18 --- last message repeated 1 time ---
    Mar  8 12:52:18 tdonohue2-OSX racoon[490]: IKE Packet: receive failed. (Initiator, Aggressive-Mode Message 2).
    Mar  8 12:52:21 tdonohue2-OSX racoon[490]: IKE Packet: transmit success. (Phase 1 Retransmit).
    Mar  8 12:52:21 tdonohue2-OSX racoon[490]: port 37905 expected, but 0
    Mar  8 12:52:21 --- last message repeated 1 time ---
    Mar  8 12:52:21 tdonohue2-OSX racoon[490]: try to get pskey by the peer's address.
    Mar  8 12:52:21 --- last message repeated 1 time ---
    Mar  8 12:52:21 tdonohue2-OSX racoon[490]: couldn't find the pskey by address 209.XXX.XXX.XXX.
    Mar  8 12:52:21 --- last message repeated 1 time ---
    Mar  8 12:52:21 tdonohue2-OSX racoon[490]: couldn't find the pskey for 209.XXX.XXX.XXX.
    Mar  8 12:52:21 --- last message repeated 1 time ---
    Mar  8 12:52:21 tdonohue2-OSX racoon[490]: failed to generate SKEYID
    Mar  8 12:52:21 --- last message repeated 1 time ---
    Mar  8 12:52:21 tdonohue2-OSX racoon[490]: IKE Packet: receive failed. (Initiator, Aggressive-Mode Message 2).
    Mar  8 12:52:24 tdonohue2-OSX racoon[490]: IKE Packet: transmit success. (Phase 1 Retransmit).
    Mar  8 12:52:26 tdonohue2-OSX racoon[490]: port 37905 expected, but 0
    Mar  8 12:52:26 --- last message repeated 1 time ---
    Mar  8 12:52:26 tdonohue2-OSX racoon[490]: try to get pskey by the peer's address.
    Mar  8 12:52:26 --- last message repeated 1 time ---
    Mar  8 12:52:26 tdonohue2-OSX racoon[490]: couldn't find the pskey by address 209.XXX.XXX.XXX.
    Mar  8 12:52:26 --- last message repeated 1 time ---
    Mar  8 12:52:26 tdonohue2-OSX racoon[490]: couldn't find the pskey for 209.XXX.XXX.XXX.
    Mar  8 12:52:26 --- last message repeated 1 time ---
    Mar  8 12:52:26 tdonohue2-OSX racoon[490]: failed to generate SKEYID
    Mar  8 12:52:26 --- last message repeated 1 time ---
    Mar  8 12:52:26 tdonohue2-OSX racoon[490]: IKE Packet: receive failed. (Initiator, Aggressive-Mode Message 2).
    Mar  8 12:52:27 tdonohue2-OSX racoon[490]: IKE Packet: transmit success. (Phase 1 Retransmit).
    Mar  8 12:52:28 tdonohue2-OSX nesessionmanager[439]: NESMLegacySession[VPN AMS:C922B403-XXXX-XXXX-XXXX-XXXXXXXXXXXX]: status changed to disconnecting
    Mar  8 12:52:28 tdonohue2-OSX nesessionmanager[439]: IPSec disconnecting from server 209.XXX.XXX.XXX
    Mar  8 12:52:28 tdonohue2-OSX racoon[490]: IPSec disconnecting from server 209.XXX.XXX.XXX
    Mar  8 12:52:28 --- last message repeated 1 time ---
    Mar  8 12:52:28 tdonohue2-OSX racoon[490]: glob found no matches for path "/var/run/racoon/*.conf"
    Mar  8 12:52:28 --- last message repeated 1 time ---
    Mar  8 12:52:28 tdonohue2-OSX racoon[490]: IPSec disconnecting from server 209.XXX.XXX.XXX
    Mar  8 12:52:28 --- last message repeated 1 time ---
    Mar  8 12:52:28 tdonohue2-OSX nesessionmanager[439]: NESMLegacySession[VPN AMS:C922B403-XXXX-XXXX-XXXX-XXXXXXXXXXXX]: status changed to disconnected, last stop reason None
    Mar  8 12:52:28 tdonohue2-OSX UserNotificationCenter[493]: *** WARNING: Method userSpaceScaleFactor in class NSWindow is deprecated on 10.7 and later. It should not be used in new applications. Use convertRectToBacking: instead. 
    Mar  8 12:52:29 tdonohue2-OSX racoon[490]: Connecting.

The most important line is probably:

    couldn't find the pskey for 209.XXX.XXX.XXX.

This means that the _shared secret_ (pskey) required to initiate the VPN connection couldn’t be found. The shared secret is added in the VPN Authentication Settings window when you create the connection, if the VPN requires it.

But when I went to check the shared secret (System Preferences → Network → VPN connection → Authentication Settings), the box was empty:

![VPN missing shared secret]({{ site.url }}/assets/vpn-missing-shared-secret.png)

When I tried to delete and then recreate the VPN connection, the shared secret still would not save, and the following line was present in the **system.log**:

    Mar  8 13:21:39 tdonohue2-OSX nehelper[212]: C1903AAE-C413-4193-B605-17EB997924F7.SS: SecKeychainItemCreateFromContent failed: UNIX[Operation not permitted]

This line alone was sufficient to start to throw blame on OS X’s **keychain**. The keychain is used to hold secure items like wifi passwords and VPN shared secrets.

If the VPN connection editor can’t save the shared secret into the keychain because the OS says _operation not permitted_, something’s clearly gone badly wrong somewhere.

### Checking the Keychain

There are two main keychains in OS X. You can browse them using the Keychain Access app, bundled with the OS. Web browser passwords are stored in the User keychain, whereas things like VPN shared secrets are stored in the System keychain.

Browsing the system keychain in Keychain Access looks like this (repping my favourite local coffee shop in this screenshot!):

![Keychain Access System]({{ site.url }}/assets/keychain-system.png)

I found my shared secret entry in the System keychain, and thought it would make sense to delete it, perhaps there was something wrong with its permissions. To delete an entry you just right-click it, and choose Delete. I was prompted for my password, but then got this error:

![Keychain delete not permitted]({{ site.url }}/assets/keychain-delete-not-permitted.png)

Also, this was written to **system.log**:

    Mar  8 14:04:25 tdonohue2-OSX sandboxd[164] ([1157]): kcproxy(1157) System Policy: deny file-write-unlink /Library/Keychains/System.keychain

This indicated that something was probably up with the System keychain itself. Bad permissions, corrupt, whatever.

There are a few articles on the web about [resetting a broken keychain](https://support.apple.com/en-gb/HT203192) in OS X, but nothing about fixing a broken System keychain.

Fortunately after some searching I found [this thread on Apple’s forums](https://discussions.apple.com/thread/7461015?start=0&tstart=0) which seemed to describe a way to diagnose a similar problem and how to resolve it. Fortunately it worked for this problem, too.

### Cause

The cause of this problem seems to be some advanced filesystem-level security protection, which Apple now puts on important system files to prevent them from being compromised.

This protection manifests itself as a restricted attribute on a file. If this flag is active, some basic read-write functionality (like creating/deleting keys in a keychain) will be blocked.

In this case, the restricted attribute was present on the System.keychain file, which was preventing keys from being read from the keychain, or written to it.

To see the flag, drop to a Terminal and run:

    ls -@BOaen /Library/Keychains/

In my case, this resulted in the following listing:

    total 304
    drwxr-xr-x   7 0  0  -            238  8 Mar 14:57 .
    drwxr-xr-x+ 62 0  0  sunlnk      2108  7 Mar 14:04 ..
     0: ABCDEFAB-CDEF-ABCD-EFAB-CDEF0000000C deny delete
    -r--r--r--@  1 0  0  -              0 26 Nov 19:50 .fl043D1EDD
            com.apple.quarantine	   29 
    -r--r--r--   1 0  0  -          0 26 Nov 19:50 .fl947E1BDB
    -rw-r--r--   1 0  0  restricted 49832  8 Mar 14:57 System.keychain
    -rw-r--r--   1 0  0  -          38048  7 Mar 10:14 System.keychain-orig
    -rw-r--r--@  1 0  0  -          58024  8 Mar 13:58 apsd.keychain
            com.apple.quarantine	   29 

The _restricted_ attribute can be seen on **System.keychain**, which was probably the culprit of this issue.

To confirm this wasn’t the expected behaviour, I ran the same `ls` on another Mac, and the file did not have the _restricted_ attribute.

## Solution

To remove the restricted attribute from your **System.keychain** file and enable OS X to be able to successfully read/write your shared secret for VPN connections, follow the steps below. Make sure you take a backup first.

1. Boot into Recovery mode (hold down Option+R on bootup)
1. If you’re using FileVault, unlock the disk first by selecting Disk Utility from the recovery menu, finding your disk (e.g. Macintosh HD) and choosing File → Unlock. Enter your disk unlock password (usually your Mac login).
1. Open a Terminal window using Utilities → Terminal.
1. Enter the command: `chflags norestricted /Volumes/Macintosh\ HD/Library/Keychains/System.keychain`. This will remove the restricted flag from your **System.keychain** file.

Now reboot your Mac and you should find that you’re able to save your VPN shared secret, and connect successfully to your VPN.

I'm still not sure why this happened in the first place. Possibly this happened during the OS X upgrade? But huge thanks to [Linc Davis](https://discussions.apple.com/people/Linc%20Davis) for his original post on the Apple forums which helped me resolve this.
