import 'dart:math';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notify {
  static const AndroidInitializationSettings _initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  static const InitializationSettings initializationSettings =
      InitializationSettings(android: _initializationSettingsAndroid);
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> createAlarm(
      {required Function notifyAfterExecuteFunc,
      required String content}) async {
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse details) {
        notifyAfterExecuteFunc();
      },
    );

    await flutterLocalNotificationsPlugin.show(
        Random().nextInt(pow(2, 31) as int),
        '곰스터디머',
        content,
        const NotificationDetails(
            android: AndroidNotificationDetails(
          'alarm',
          'alarm',
          importance: Importance.max,
          priority: Priority.high,
          playSound: true,
        )));
  }

  static Future<void> showTimerNotify({required String content}) async {
    await flutterLocalNotificationsPlugin.show(
        1,
        '곰스터디머',
        content,
        const NotificationDetails(
            android: AndroidNotificationDetails(
          'timer',
          'timer',
          playSound: false,
          enableVibration: false,
        )));
  }

  static cancleTimerNotify() {
    flutterLocalNotificationsPlugin.cancel(1);
  }
}
