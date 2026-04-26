# speedo_flutter

A Flutter plugin for real-time internet speed tracking. It provides a continuous stream of the current network speed (Upload + Download) in Mbps.

## Features

* **Real-time Monitoring**: Get live updates of network usage.
* **Stream-based API**: Easily listen to speed changes using Flutter Streams.
* **High Accuracy**: Optimized for providing precise real-time speed data.

## Platform Support

| Android | iOS |
| :---: | :---: |
| ✅ | ⚠️ (Placeholder) |

## Usage

### 1. Initialize the plugin

```dart
final speedo = SpeedoFlutter();
```

### 2. Listen to the speed stream

The speed is returned as a `double` representing **Mbps**.

```dart
StreamSubscription<double>? _speedSubscription;

@override
void initState() {
  super.initState();
  _speedSubscription = speedo.speedStream.listen((speed) {
    setState(() {
       _currentSpeed = speed;
    });
  });
}

@override
void dispose() {
  _speedSubscription?.cancel();
  super.dispose();
}
```

## Android Requirements

Ensure your app has the following permissions in your `AndroidManifest.xml`:

```xml
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
```

## How it works

The plugin monitors data throughput on the device at regular intervals and calculates the real-time speed in Megabits per second (Mbps), allowing developers to build responsive speedometers or network monitors.

---

For a full implementation example, please refer to the [example](https://github.com/your_username/speedo_flutter/tree/main/example) folder.
