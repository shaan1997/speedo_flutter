
import 'speedo_flutter_platform_interface.dart';

class SpeedoFlutter {
  Stream<double> get speedStream {
    return SpeedoFlutterPlatform.instance.getSpeedStream();
  }
}
