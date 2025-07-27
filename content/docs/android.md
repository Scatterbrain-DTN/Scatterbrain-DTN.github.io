+++
title = "Android api usage"
description = "Guide on how to develop android applications that leverage the Scatterbrain binder api"
+++

Building a Scatterbrain android app requires communicating with the Scatterbrain Router app via android IPC apis. The easiest and most recommended way to do this is by including the [ScatterbrainSDK](https://github.com/Scatterbrain-DTN/ScatterbrainSDK) library to your android app. This library exposes a clean and simple kotlin coroutine based API that allows building responsive apps that follow best practices and do not make mistakes like blocking the UI thread.

## Setting up the api

To add Scatterbrain to an existing android project:
```bash
git submodule add https://github.com/Scatterbrain-DTN/ScatterbrainSDK.git
```

Then edit your projects `settings.gradle` to include
```groovy
include ':sdk'
project(':sdk').projectDir = new File(rootDir, 'ScatterbrainSDK/scatterbrainSDK/')
```

Then edit your module-level `build.gradle` to include
```groovy
implementation project(':sdk')
```

Or edit `build.gradle.kts` if using gradle kotlin DSL
```kotlin
implementation(project(':sdk'))
```


## Using the api
Some simple examples of API usage:

### Send a message
```kt
val api = ScatterbrainApi(context)
val text = "hello world".toByteArray(charset = Charsets.UTF_8)
val m = ScatterMessage.Builder.newInstance(context, text)
    .setApplication("myapp")
    .build()

runBlocking { api.binderWrapper.sendMessage(m) }
```


### Handle broadcasts

First define a BroadcastReceiver class to handle broadcasts. There are 2 main types of broadcasts to consider. `BROADCAST_EVENT` is fired when a remote peer completes a handshake, potentially delivering messages and identities. `STATE_EVENT` is fired when the Scatterbrain Router app changes state, ie. when bluetooth or wifi are enabled/disabled or discovery is paused.

```kt
// Define a broadcastReceiver to handle Scatterbrain broadcasts
class ScatterbrainBroadcastReceiver: BroadcastReceiver() {
    override fun onReceive(context: Context?, intent: Intent) {
        when(intent.action) {
            BROADCAST_EVENT -> {
                val handshakeResult =
                    intent.getParcelableExtra<HandshakeResult>(
                        EXTRA_TRANSACTION_RESULT
                    )

                val luid = intent.getParcelableExtra<ParcelUuid>(EXTRA_LUID)

                // handle incoming messages using the ScatterbrainApi class

            }

            STATE_EVENT -> {
                val state =
                    intent.getParcelableExtra<RouterState>(EXTRA_ROUTER_STATE)

                // Handle state changes, including enabled and disabled discovery
            }

            PAIRING_EVENT -> {
                /// 3rd party apps should ignore desktop pairing broadcasts
            }
        }
    }
}
```

Register your broadcast receiver with an IntentFilter. Make sure to unregister it when you are done using it.

```kt
val intentFilter = IntentFilter()
       .apply {
           addAction(BROADCAST_EVENT)
           addAction(STATE_EVENT)
       }

context.registerReceiver(ScatterbrainBroadcastReceiver(), intentFilter, Context.RECEIVER_EXPORTED)
```

## Full API docs
The full android api documentation can be accessed from [here](/android_api)
