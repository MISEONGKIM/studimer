import 'dart:isolate';
import 'dart:math';
import 'dart:ui';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studimer/src/data/models/internal/timer.dart';

class TimerProvider extends ChangeNotifier {
  late final TimerModel t;
  bool isRunning = false;

  final String sharedPreferKey;
  final String isolateName;
  final int timerId;
  late final SharedPreferences prefs;
  ReceivePort port = ReceivePort();

  TimerProvider(
      {required this.sharedPreferKey,
      required this.isolateName,
      required this.timerId}) {
    _init(sharedPreferKey);
  }

  _init(String sharedPreferKey) async {
    WidgetsFlutterBinding.ensureInitialized();

    IsolateNameServer.registerPortWithName(
      port.sendPort,
      isolateName,
    );

    AndroidAlarmManager.initialize();
  }

  _notify() async {
    t.setTime(t.getDuration());
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(sharedPreferKey, t.getDuration().inSeconds);
    notifyListeners();
  }

  void setHour(int value) {
    t.hour = value;
    _notify();
  }

  void setMinuate(int value) {
    t.minuate = value;
    _notify();
  }

  void setSecond(int value) {
    t.second = value;
    _notify();
  }

  void start(Duration time, {required Function() cancelNextExec}) async {
    int seconds = time.inSeconds;
    isRunning = true;

    await AndroidAlarmManager.periodic(
      const Duration(seconds: 1),
      timerId,
      () async {
        seconds -= 1;
        print(seconds);
        t.durationConvert(Duration(seconds: seconds));

        final prefs = await SharedPreferences.getInstance();
        await prefs.setInt(timerId.toString(), seconds);
        print('pref : ' + prefs.getInt(timerId.toString()).toString());

        notifyListeners();
        if (seconds == 0) {
          stop(cancelNextExec: cancelNextExec);
        }
      },
      exact: true,
      wakeup: true,
    );
  }

  void stop({required Function() cancelNextExec}) async {
    SendPort? uiSendPort = IsolateNameServer.lookupPortByName(isolateName);
    uiSendPort?.send(null);
    AndroidAlarmManager.cancel(timerId);
    await prefs.remove(timerId.toString());
    cancelNextExec();
  }

  void cancel() {}
}

class StudyTimerProvider extends TimerProvider {
  StudyTimerProvider()
      : super(
            timerId: Random().nextInt(pow(2, 31) as int),
            sharedPreferKey: "studytimer",
            isolateName: "studyIsolate");
}

class RestTimerProvider extends TimerProvider {
  RestTimerProvider()
      : super(
            timerId: Random().nextInt(pow(2, 31) as int),
            sharedPreferKey: "resttimer",
            isolateName: "restIsolate");
}
