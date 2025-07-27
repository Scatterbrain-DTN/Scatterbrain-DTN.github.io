+++
title = "Meshtastic support / setup"
description = "Meshtastic routers are open source mesh networking hardware units using lora radios for extremely long range communication. Scatterbrain has alpha quality support for tunneling specific messages over Meshtastic networks"
+++

{{ fit_width(path="/get_started/t_beam.jpg", width=400, desc="A lilygo t-beam meshtastic radio") }}

## What is Meshtastic
Meshtastic is a radio mesh networking protocol and firmware for certain microcontroller boards that allows very long range mesh networking. Meshtastic uses a hardware radio protocol called "lora" that trades off throughput for range.

With a good antenna and line-of-sight conditions ranges could easily reach the 10s of kilometers, but bitrates could be less than 100bps. Meshtastic provides an android app that allows for text chat with other Meshtastic users. This app also provides an api (like Scatterbrain) that other apps can use to send data over meshtastic hardware.

While Meshtastic hardware has a store-and-forward capability, it is not comparable to how Scatterbrain functions. Stored messages are kept in the ram of a microcontroller and no attempts are made at deduplication. Meshtastic only uses a single protocol. Most production meshes seem to leave this feature disabled.

## What is Meshtastic's role in a Scatterbrain network?
Scatterbrain and meshtastic have the potential to work synergistically. Scatterbrain represents a way to bridge Meshtastic networks with other protocols, and the potential to serve as a more robust store-and-forward implementation using nearby android phone paired with Meshtastic hardware. Scatterbrain also allows sharing Meshtastic messages with many phones when only bluetooth is enabled, a feature lacking on Meshtastic bluetooth hardware.

Meshtastic can carry Scatterbrain messages over long distances, but care must be taken to avoid flooding Meshtastic networks with very large messages, as some countries impose a duty cycle limit which will be hit almost immediately upon attempting to send something large like an image.

## How to use Meshtastic support?
Alpha quality support for meshtastic will be enabled when the Scatterbrain Router app detects the Meshtastic app on the same phone. When Meshtastic is available the mode for bridging messages can be selected from the "apps" tab.

Please ensure the Meshtastic android app is paired with and connected to a compatible Meshtastic hardware unit. If the app is not connected no packets will be forwarded.

The two options are
- Opt-in: messages explicitly tagged by the [android api](@/docs/android.md) will be forwarded if they are under 32kb in size.
- All small messages: all messages under 32kb in size will be forwarded

After one of these options is selected no further action is required. All messages meeting the criteria will be forwarded.
