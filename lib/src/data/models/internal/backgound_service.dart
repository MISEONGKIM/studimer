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
    instance.on('start').listen((event) async {
      print('시작');
      Notify.createTimerShow(content: event!['timer'].toString());
    });
    instance.on('stop').listen((event) {
      print('포기');
      Notify.cancleTimerShow();
    });
  }

  static initBackGroundService() async {
    WidgetsFlutterBinding.ensureInitialized();
    service = FlutterBackgroundService();
    service.isRunning().then((value) => print(value));
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

  static startBackGroundService(String timer) {
    service.invoke('start', {'timer': timer});
  }

  static stopBackGroundService() {
    service.invoke('stop');
  }
}
