import 'package:flutter_test/flutter_test.dart';
import 'package:speedo_flutter/speedo_flutter.dart';
import 'package:speedo_flutter/speedo_flutter_platform_interface.dart';
import 'package:speedo_flutter/speedo_flutter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockSpeedoFlutterPlatform
    with MockPlatformInterfaceMixin
    implements SpeedoFlutterPlatform {

  @override
  Stream<double> getSpeedStream() => Stream.value(1.0);
}

void main() {
  final SpeedoFlutterPlatform initialPlatform = SpeedoFlutterPlatform.instance;

  test('$MethodChannelSpeedoFlutter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelSpeedoFlutter>());
  });

  test('getSpeedStream', () async {
    SpeedoFlutter speedoFlutterPlugin = SpeedoFlutter();
    MockSpeedoFlutterPlatform fakePlatform = MockSpeedoFlutterPlatform();
    SpeedoFlutterPlatform.instance = fakePlatform;

    expect(await speedoFlutterPlugin.speedStream.first, 1.0);
  });
}
