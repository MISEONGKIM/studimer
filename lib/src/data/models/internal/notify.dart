import 'dart:math';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;

class Notify {
  late final AndroidInitializationSettings _initializationSettingsAndroid;
  late final InitializationSettings _initializationSettings;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Notify(
      {required Function notifyAfterExecuteFunc,
      required Function bgNotifyAfterExecuteFunc}) {
    _initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    _initializationSettings =
        InitializationSettings(android: _initializationSettingsAndroid);
    _flutterLocalNotificationsPlugin.initialize(
      _initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse details) {
        notifyAfterExecuteFunc();
      },
      // onDidReceiveBackgroundNotificationResponse:
      //     (NotificationResponse details) {
      //   bgNotifyAfterExecuteFunc();
      // },
    );
    tz.initializeTimeZones();
  }

  Future<void> create(String content) async {
    await _flutterLocalNotificationsPlugin.show(
        Random().nextInt(pow(2, 31) as int),
        '곰스터디머',
        content,
        const NotificationDetails(
            android: AndroidNotificationDetails(
          'your channel id',
          'your channel name',
          importance: Importance.max,
          priority: Priority.high,
          playSound: true,
        )));
  }
}
