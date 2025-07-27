+++
description = "Platform for store-and-forward networking apps. No internet required!"
template = "section.html"
+++

## What is Scatterbrain

Scatterbrain is a platform for building apps that work over long distances without internet, expensive or restricted radio hardware, or long inconvenient cables. Scatterbrain uses bluetooth, wifi, offline storage, and human movement to move messages throughout a social environment like rumors.

## Where to get it?
You can grab the official reference app from [Google Play](https://play.google.com/store/apps/details?id=net.ballmerlabs.scatterroutingservice). An example app using the Scatterbrain API to build a simple social network is available [here](https://play.google.com/store/apps/details?id=net.ballmerlabs.subrosa)

## How does Scatterbrain compare with similar apps
### Protocols supported

| App | BLE | Wifi| Lora | Internet |
| ---         | --- | --- | --- | --- |
| Scatterbrain | yes  |    yes        |     yes             |     via 3rd party app    |
| [Briar](https://briarproject.org/) | yes | yes | no | yes |
| [Bitchat](https://github.com/permissionlesstech/bitchat) | yes | no | no | no |
| [Firechat](https://web.archive.org/web/20140901121753/https://opengarden.com/firechat)| yes | yes | no | yes |

### User interfaces
| App | UI | 3rd party SDKs
| ---         | --- | --- |
| Scatterbrain | Text chat / admin panel  | Public android API, remote desktop api |
| [Briar](https://briarproject.org/) | Text chat | No, but forks of opensource code can share data via [mailbox](https://code.briarproject.org/briar/briar-mailbox) |
| [Bitchat](https://github.com/permissionlesstech/bitchat) | IRC-like | no |
| [Firechat](https://web.archive.org/web/20140901121753/https://opengarden.com/firechat)| Text chat | promised but not delivered |
