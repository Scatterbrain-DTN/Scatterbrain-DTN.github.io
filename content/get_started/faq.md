+++
title = "Frequently asked questions"
description = "Commonly encountered issues and their solutions"
+++

## Global chat is boring. How do I do things on Scatterbrain besides chat?
Check out [3rd party apps](@/get_started/third_party.md) for a guide on how to get Scatterbrain apps from Google Play or github

## My app is complaining about "permission denied"
You need to install the Scatterbrain Router app before you install any 3rd party app on android. For desktop, clearing app data or uninstalling the app will require you to also clear the data of the corresponding desktop app

## How much space will Scatterbrain use?
The Scatterbrain Router app maintains a datastore size cap of 4gb. In the very near future this will be customizable. After reaching this cap the oldest and/or most shared messages will be automatically removed

## Is Scatterbrain a privacy risk?
Scatterbrain Router makes a very strong effort to preserve user privacy. All public identifiers are randomized on a recurring bases and all modern phones support mac address randomization on both bluetooth and wifi. However, there are side channel based threat vectors involving hostile actors dropping "cookie" messages on a device and reading them at a later date. For now, this can be mitigated by clearing app data after moving away from a hostile location. In the future there will be multiple strong protections against this threat including the option to clear messages from a specific geolocation and a way to opt-in to messages instead of having public access

## Is Scatterbrain open source?
YES! All code for the Scatterbrain Router app, all api wrappers, example code for 3rd party apps, and development tools are available on the [github organization](https://github.com/Scatterbrain-DTN/)

## Is Scatterbrain a company?
Nope. Its just one person slowly writing code for years, mostly on weekends. Scatterbrain will never have a stock, will never sell a "coin", and is not for sale. Some things actually don't require a profit motive it turns out.

## Didn't I hear about this before?
Yes. I attempted this before and it failed a long time ago due to google changing their bluetooth api and general lack of skill on my part. The failed attempt is [here](https://github.com/Scatterbrain-DTN/Scatterbrain) if you want to laugh at it.
