+++
title = "Desktop api"
description = "The Scatterbrain desktop api allows accessing all Scatterbrain functionality on a mobile device via a desktop application on linux, windows, or macos on the same local network"
+++

Desktop Scatterbrain applications are built using the same serialization protocol that Scatterbrain peers use to communicate with each other, paired with mdns based service discovery. There is a library that automates this at [scatterbrain-rs](https://github.com/Scatterbrain-DTN/scatterbrain-rs). While currently only rust based applications are supported, as the api stabilizes a C ABI interface will be added to support more languages and platforms.

To make rapidly prototyping responsive applications easier, there is also a [flutter plugin](https://github.com/Scatterbrain-DTN/scatterbrain-flutter) here. This uses the same rust codebase with a dynamically generated wrapper interface so it will always be up-to-date.

An example application using the flutter codebase is [Subrosa Desktop](https://github.com/Scatterbrain-DTN/subrosa-desktop), and an example application using the pure rust codebase is [sbcli](https://github.com/Scatterbrain-DTN/sbcli)

## Desktop api stability
The desktop api has not reached full maturity, so caution must be used due to frequent api changes. One major change slated for release soon is the migration to websockets for the underlying api transport.


## Adding the desktop api to your rust projects
```bash
# for pure rust projects, not for flutter
cargo add scatterbrain
```


## Adding the desktop api to flutter projects
First setup the project directory
```bash
# for flutter projects
flutter create my_app
cd my_app
git submodule add https://github.com/Scatterbrain-DTN/scatterbrain-flutter
```

Then edit `pubspec.yaml` to include
```yaml
dependencies:
  scatterbrain_flutter:
    path: ./scatterbrain
```


## Example rust api usage
Scan for devices
```rust
let mut scanner = ServiceScanner::new();
scanner
    .mdns_scan(|r| async move {
        for (name, record) in r.iter() {
            println!("{}:", name);
            for ip in record.addr.iter() {
                let v = SocketAddr::new(ip.clone(), record.port);
                println!("\t{}", v);
                // connect to host here
            }
        }
        Ok(())
    })
    .await?;
```

Attempt to pair with a device
```rust
    let host = SocketAddr::from_str("192.168.1.2:9999").unwrap();
    let host: HostRecord = host.into();
    let stream = host.connect().await?;
    let config = SessionState::default();
    let session = stream
        .pair(config, "my_app_name".to_owned(), |words| async move {
            let text = format!(
                "got key\n {}\nDo the words match on the phone? (y/n)> ",
                words
            );

            let stdin = tokio::io::stdin();
            let mut stdout = tokio::io::stdout();
            stdout.write(text.as_bytes()).await?;
            stdout.flush().await?;
            let line = BufReader::new(stdin).lines().next_line().await?;
            if let Some("y") | Some("yes") = line.as_deref() {
                Ok(true)
            } else {
                Ok(false)
            }
        })
        .await?;

```

Send a message
```rust
let host = SocketAddr::from_str("192.168.1.2:9999").unwrap();
let host: HostRecord = host.into();
let stream = host.connect().await?;

let message = Message::from_vec(
    "hello world".as_bytes().try_into().unwrap(),
     APP_NAME.to_owned(),
);

stream.send_messages(vec![message], None).await?;
```


## Full API docs
The full desktop api documentation can be accessed from [here](https://docs.rs/scatterbrain/latest/scatterbrain/)
