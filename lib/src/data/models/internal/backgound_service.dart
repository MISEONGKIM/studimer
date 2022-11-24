import 'dart:ui';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'notify.dart';

class BackGroundService {
  static late FlutterBackgroundService service;

  @pragma('vm:entry-point')
  static void _serviceStart(ServiceInstance instance) async {
    DartPluginRegistrant.ensureInitialized();
    instance.on('timer').listen((event) async {
      Notify.showTimerNotify(event!['id'], content: event['timer'].toString());
    });
    instance.on('stop').listen((event) {
      Notify.cancleTimerNotify(event!['id']);
      instance.stopSelf();
    });
  }

  static initBackGroundService() async {
    service = FlutterBackgroundService();
    await service.configure(
      androidConfiguration: AndroidConfiguration(
          autoStart: false,
          autoStartOnBoot: false,
          onStart: _serviceStart,
          isForegroundMode: false,
          notificationChannelId: 'timer'),
      iosConfiguration: IosConfiguration(
        autoStart: false,
      ),
    );
  }

  static startBackGroundService(int id, String timer) async {
    Notify.flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    Notify.flutterLocalNotificationsPlugin
        .initialize(Notify.initializationSettings);
    Notify.showTimerNotify(id, content: timer);
    service.startService();
  }

  static timerBackGroundService(int id, String timer) {
    service.invoke('timer', {'timer': timer, 'id': id});
  }

  static stopBackGroundService(int id) {
    service.invoke('stop', {'id': id});
  }
}
