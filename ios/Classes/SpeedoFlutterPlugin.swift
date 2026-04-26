import Flutter
import UIKit

public class SpeedoFlutterPlugin: NSObject, FlutterPlugin, FlutterStreamHandler {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let eventChannel = FlutterEventChannel(name: "speedStream", binaryMessenger: registrar.messenger())
    let instance = SpeedoFlutterPlugin()
    eventChannel.setStreamHandler(instance)
  }

  public func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
    // Note: iOS implementation for network speed tracking would go here.
    // For now, we return 0.0 to keep the interface consistent.
    events(0.0)
    return nil
  }

  public func onCancel(withArguments arguments: Any?) -> FlutterError? {
    return nil
  }
}
