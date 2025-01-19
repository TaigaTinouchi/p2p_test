import 'package:flutter_background/flutter_background.dart';
import 'package:flutter/foundation.dart' show debugDefaultTargetPlatformOverride;
import 'package:flutter_webrtc/flutter_webrtc.dart';

import 'package:p2p_test/ui/core/ui_exporter.dart';
import 'package:p2p_test/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (WebRTC.platformIsDesktop) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  } else if (WebRTC.platformIsAndroid) {
    startForegroundService();
  }
  runApp(
    UncontrolledProviderScope(
      container: ProviderContainer(),
      child: const App(),
    )
  );
}

Future<bool> startForegroundService() async {
  final androidConfig = FlutterBackgroundAndroidConfig(
    notificationTitle: 'Title of the notification',
    notificationText: 'Text of the notification',
    notificationImportance: AndroidNotificationImportance.normal,
    notificationIcon: AndroidResource(
      name: 'background_icon',
      defType: 'drawable'
    ),
  );
  await FlutterBackground.initialize(androidConfig: androidConfig);
  return FlutterBackground.enableBackgroundExecution();
}
