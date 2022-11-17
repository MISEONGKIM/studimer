import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';

import 'notify.dart';

class BackGroundService {
  static late FlutterBackgroundService service;

  @pragma('vm:entry-point')
  static void _serviceStart(ServiceInstance instance) async {
    DartPluginRegistrant.ensureInitialized();
    Notify.flutterLocalNotificationsPlugin
        .initialize(Notify.initializationSettings);
    instance.on('timer').listen((event) async {
      Notify.createTimerShow(content: event!['timer'].toString());
    });
    instance.on('stop').listen((event) {
      Notify.cancleTimerShow();
    });
  }

  static startBackGroundService() async {
    WidgetsFlutterBinding.ensureInitialized();
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
    service.startService();
  }

  static timerBackGroundService(String timer) {
    service.invoke('timer', {'timer': timer});
  }

  static stopBackGroundService() {
    service.invoke('stop');
  }
}
