import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'speedo_flutter_method_channel.dart';

abstract class SpeedoFlutterPlatform extends PlatformInterface {
  /// Constructs a SpeedoFlutterPlatform.
  SpeedoFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static SpeedoFlutterPlatform _instance = MethodChannelSpeedoFlutter();

  /// The default instance of [SpeedoFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelSpeedoFlutter].
  static SpeedoFlutterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SpeedoFlutterPlatform] when
  /// they register themselves.
  static set instance(SpeedoFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Stream<double> getSpeedStream() {
    throw UnimplementedError('getSpeedStream() has not been implemented.');
  }
}
