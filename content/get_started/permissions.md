+++
title = "Device setup and granting permissions"
description = "Start here to setup Scatterbrain on an android device"
+++

## Granting permissions
On first startup, the Scatterbrain Router app will display a walkthrough of available permissions and allow you to grant them one by one. Some of these permissions are required for normal operation, and some may be skipped at the expense of some features like background performance and starting the app on boot.

### Why is the location permission used?
Google requires that any app performing certain types of network scans (in this case bluetooth and wifi direct) to be granted the location permission. This is because knowing the mac addresses of nearby devices can help an app infer it's rough geographic location. Scatterbrain does not do this, it only uses this permission to establish a connection to devices.



### Enabling start on boot
Background location is treated as a specifically and highly dangerous permission by google. Because of this google enforces that this permission be granted separately from the initial foreground location permission. Scatterbrain can run without this permission granted, but it cannot start automatically on boot without it. To grant this permission, follow the steps in the below screenshots:

{{ two_gallery(path1="/get_started/boot.png", path2="/get_started/allow_all_time.png", desc1="Tap the switch labeled 'Start on boot'. This will bring up an external dialog box from android OS itself.", desc2 = "In the permission grant dialog box that just opened, press 'allow all the time', then press the back button to return to the Scatterbrain Router app") }}


### Disabling battery optimizations
Recent versions of android has a series of restrictions that are applied to apps to limit their battery usage in the background. These tactics are collectively called "doze mode" on some phones, but may have a different name. The behavior is also not standardized, but it often results in apps being paused for some time in the background and only allowed to run when batched with other apps.

This restriction can be disabled when setting up Scatterbrain. It is highly recommended to do so, but Scatterbrain is designed to operate to an acceptable degree even with this permission not granted. As the exact behavior is vendor specific, your millage may vary.

Battery life should not actually be impacted by this permission, as Scatterbrain offloads its device discovery to the bluetooth adapter itself when idle.

{{ one_gallery(path="/get_started/background_perm.png", desc="This permission allows more reliable delivery of messages in the background.") }}
