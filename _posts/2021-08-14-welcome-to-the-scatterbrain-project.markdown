---
layout: post
title: "Welcome to the Scatterbrain Project"
date: 2021-08-14 00:00:00 -0400
categories: general
---

After quite a long time in development hell, I am very happy to announce the 
first series of (mostly) stable releases of the android implementation of
Scatterbrain. The Scatterbrain reference implementation in the Google Play Store
in an open alpha test and the Scatterbrain SDK is open for developers on Github
(soon to be released on maven central). From this point onward the main goal is
improving test coverage, testing the Scatterbrain router at scale, and
developing proof-of-concept client applications using the public API. 

## What is Scatterbrain
Scatterbrain is a networking applications that allows messages to be exchanged
potentially over very long distances without any infrastructure. Scatterbrain
leverages human movement to send data instead of relying on long cables,
powerful radio, or other forms of communication not found in a smartphone. 

Using the Scatterbrain router app, developers can create rich media applications
that run even after the loss of all permanent infrastructure, such as after a
natural disaster. Scatterbrain uses all the radios on your phone to strike a
balance between latency thoughput, ensuring messges are exchanged even in brief
encounters between devices or during periods of network interference. 

Scatterbrain has 2 main components, the Routing Service, and the SDK.
Developers only need the SDK to create client apps using the Scatterbrain network. The
Routing Service needs to be installed on any phone using Scatterbrain client
apps. 

Users can download the Scatterbrain Router by signing up for the Google Play
open alpha test by following the instructions
[here](https://support.google.com/googleplay/answer/7003180?hl=en) and searching
for Scatterbrain Router

Developers can clone the Scatterbrain SDK
[here](https://github.com/Scatterbrain-DTN/ScatterbrainSDK) as a submodule for
their android project and follow the
[documentation](https://scatterbrain-dtn.github.io/apidocs)

It should be noted that Scatterbrain is still in *very early alpha testing* and
can have potentially severe bugs. Testing has only been done on a series of
modern pixel phones, so older or nonstandard android skins may have issues with
it. If you encounter any bugs feel free to open an
[issue](https://github.com/Scatterbrain-DTN/RoutingServiceFrontend/issues) or a
PR. 

## Background (Ignore this if You Hate Nerd Stuff)

Scatterbrain is a generalized framework for store-and-forward delay tolerant
networking. This is a type of computer networking that breaks key assumptions
that normal or "synchronous" networks make. Delay tolerant networks (or DTNs)
differ from synchronous networks in two keys ways

- There does not need to be a direct path between any two nodes in the network
	at any given time for normal operation.  
- Nodes in the network are stateful, remembering and forwarding messages as
	connections become available. 

In a delay tolerant network, the motion of nodes though space becomes an
important factor in facilitating the spread of messages throughout the network. 

The internet one of the most widely known examples of a synchronous network.
Examples of delay tolerant networks (of the same type as Scatterbrain) include 

- Gossip  
- The postal service  
- The spread of infectious diseases

Scatterbrain is an implementation of the more extreme form of DTN. One where
each node in the network spends most of its time connected to at most one other
node, and where most of the movement of data is done via nodes moving around
physically. Currently this means each node is a phone in someone's pocket and
messages are exchanged when two people pass each other on the street. While
slow, this can be a powerful method of exchanging data that does not rely on
expensive mesh infrastructure or licensed radio bands.

If you are wondering why none of these are computer networks, the answer is
delay-tolerant networking as implemented the way Scatterbrain attempts to
implement it (with zero assumptions about network topology) is very hard and
results in nondeterministic routing behavior. In effect, the only thing you can
easily do with messages is ensure that they get sent to as many devices as
possible with little to no control over the exact destination of a particular
message. While in the future the Scatterbrain project will attempt to address
these issues, the current implementation of Scatterbrain does not. 

What Scatterbrain does though, is provide a standard and robust platform and API
for building delay-tolerant network applications using a variety of network
protocols. Scatterbrain uses the same API for bluetooth, wifi, or a mix of the
two, and can support more underlying transport protocols in the future with no
change to the API. Scatterbrain also provides a (currently unused) framework for
developing more advanced DTN routing algorithms beyond epidemic routing.


## Related Work

[https://github.com/n8fr8/gilgamesh](https://github.com/n8fr8/gilgamesh): Very old bluetooth based networking app, uses blueooth 3.0 and stores messages in the device name. This has since been broken via api changes  
[https://en.wikipedia.org/wiki/FireChat](https://en.wikipedia.org/wiki/FireChat): proprietary multi-protocol app very similar to Scatterbrain, used in Hong Kong pro-democracy protests.  
[https://vanadium.github.io/](https://vanadium.github.io/): not a DTN in itself but has been used to implement a protocol called "syncbase" that serves a similar purpose  
[https://github.com/n8fr8/WindFarm](https://github.com/n8fr8/WindFarm): very old but interesting repository of similar concepts  
[https://github.com/saces/Shoeshop](https://github.com/saces/Shoeshop): not radio, not a DTN, but can be used ontop of a DTN very effectively  
