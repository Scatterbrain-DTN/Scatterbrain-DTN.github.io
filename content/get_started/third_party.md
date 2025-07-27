+++
title = "Installing 3rd party apps using the Scatterbrain network"
description = "Scatterbrain can be extended with 3rd party apps from Google Play or elsewhere to allow for a rich media experience"
+++

Most of Scatterbrain's functionality comes from 3rd party apps. Sadly, there are only two of them available currently. [Subrosa](https://play.google.com/store/apps/details?id=net.ballmerlabs.subrosa) is an android discussion forum app, and [Subrosa Desktop](https://github.com/Scatterbrain-DTN/subrosa-desktop) is a flutter based desktop version of Subrosa.

The Scatterbrain Router app itself comes with a simple chat app built-in that allows you to message the network globally, advertise your own apps, or find other users nearby.

If you are a developer or otherwise want to learn how to contribute to the Scatterbrain ecosystem, check out the [android api](@/docs/android.md) for building android apps or the [desktop api](@/docs/desktop.md) for building desktop apps that pair with an android phone. Your contributions are greatly appreciated!


{{ two_gallery(path1="/get_started/apps_view.png", path2="/get_started/power_view.png", desc1="UI for connecting applications to the Scatterbrain Router", desc2 = "UI for monitoring transport protocols and recently seen applications") }}


## Installing android based Scatterbrain apps
Android Scatterbrain apps are installed from Google Play or via an APK, like any other android app. The only requirement is that the Scatterbrain router be installed BEFORE installing the 3rd party app. This is because of a flaw in the way android handles custom permissions.

If you installed a 3rd party app before you installed the Scatterbrain Router app and it is complaining about "permission denied", uninstall it and reinstall it from the same source to allow it to access the Scatterbrain router

Android apps show up on the apps tab of the Scatterbrain Router app.



## Installing desktop Scatterbrain apps
Scatterbrain has no official desktop client officially, so desktop apps pair with an android phone running the Scatterbrain Router app on a local network. Currently this requires both the desktop app and the android phone to be on the same wifi network. Internet is not required, only the lan is used. In offline environments, Scatterbrain desktop apps work just fine over a mobile hotspot or even usb tethering.

Desktop apps are required to implement a pairing UI, which may differ between different apps. Pairing will always follow these steps

1. Ensure the Scatterbrain Router app is open and in the foreground on the android device
2. Discover Scatterbrain devices
3. Attempt to connect to a device
4. Confirm the secret words displayed on the Scatterbrain Router app match the desktop app. This is especially important on untrusted public wifi

Once a desktop app is paired with a particular phone, it will remember that phone and re-pairing will not be required. If that phone is on the same lan it can be connected to automatically.

Paired desktop apps can be managed from the apps tab on the Scatterbrain router. They can be unpaired if no longer needed.

## Discovering new apps
As new apps become available, your Scatterbrain Router app will forward messages from them even if you do not have the app installed. The "Recently seen applications" section of the app shows all applications your phone has seen.

It should be possible to look up that app on Google Play and download it, but *ONLY* if you trust the developers. Scatterbrain apps, like any android app, can be dangerous. Forwarding messages from an app you do not have installed is always safe though.
