import 'package:flutter/services.dart';

import 'speedo_flutter_platform_interface.dart';

/// An implementation of [SpeedoFlutterPlatform] that uses method channels.
class MethodChannelSpeedoFlutter extends SpeedoFlutterPlatform {
  final eventChannel = const EventChannel('speedStream');

  @override
  Stream<double> getSpeedStream() {
    return eventChannel.receiveBroadcastStream().map((event) => event as double);
  }
}
