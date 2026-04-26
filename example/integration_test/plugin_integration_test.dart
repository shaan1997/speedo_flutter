// This is a basic Flutter integration test.
//
// Since integration tests run in a full Flutter application, they can interact
// with the host side of a plugin implementation, unlike Dart unit tests.
//
// For more information about Flutter integration tests, please see
// https://flutter.dev/to/integration-testing


import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:speedo_flutter/speedo_flutter.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('speedStream test', (WidgetTester tester) async {
    final SpeedoFlutter plugin = SpeedoFlutter();
    
    // We listen to the first event from the stream.
    // In a real device/emulator environment, this should return a double.
    final double speed = await plugin.speedStream.first;
    
    // Assert that we received a valid speed value (greater than or equal to 0).
    expect(speed, isNotNull);
    expect(speed >= 0.0, true);
  });
}
