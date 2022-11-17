import 'dart:ui';
import 'package:flutter_background_service/flutter_background_service.dart';

import 'notify.dart';

class BackGroundService {
  static late FlutterBackgroundService service;

  @pragma('vm:entry-point')
  static void _serviceStart(ServiceInstance instance) async {
    DartPluginRegistrant.ensureInitialized();
    instance.on('timer').listen((event) async {
      Notify.showTimerNotify(content: event!['timer'].toString());
    });
    instance.on('stop').listen((event) {
      Notify.cancleTimerNotify();
      instance.stopSelf();
    });
  }

  static initBackGroundService() async {
    service = FlutterBackgroundService();
    await service.configure(
      androidConfiguration: AndroidConfiguration(
        autoStart: false,
        onStart: _serviceStart,
        isForegroundMode: true,
      ),
      iosConfiguration: IosConfiguration(
        autoStart: false,
      ),
    );
  }

  static startBackGroundService(String timer) async {
    print((await service.isRunning()));
    if ((await service.isRunning())) return;
    Notify.flutterLocalNotificationsPlugin
        .initialize(Notify.initializationSettings);
    Notify.showTimerNotify(content: timer);
    service.startService();
  }

  static timerBackGroundService(String timer) {
    service.invoke('timer', {'timer': timer});
  }

  static stopBackGroundService() {
    service.invoke('stop');
  }
}
