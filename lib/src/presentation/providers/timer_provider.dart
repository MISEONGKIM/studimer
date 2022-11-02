import 'dart:async';
import 'dart:isolate';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studimer/src/data/models/internal/timer.dart';

class TimerProvider extends ChangeNotifier {
  late TimerModel t;
  bool isRunning = false;

  final String sharedPreferKey;
  final String isolateName;
  final int timerId;
  late final SharedPreferences prefs;
  late Timer timer;
  late Duration initDuration;
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
  }

  _notify() async {
    t.setTime(t.getDuration());
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(sharedPreferKey, t.getDuration().inSeconds);
    notifyListeners();
  }

  void setTimerModel(TimerModel model) {
    t = model;
    initDuration = model.getDuration();
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

  void start(Duration time, {required Function cancelNextExec}) {
    int seconds = time.inSeconds;
    isRunning = true;

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      seconds -= 1;
      print(seconds);
      t.durationConvert(Duration(seconds: seconds));
      notifyListeners();
      if (seconds == 0) {
        cancel(cancelNextExec: cancelNextExec);
      }
    });
  }

  void stop() {
    isRunning = false;
    if (!timer.isActive) return;
    timer.cancel();
    notifyListeners();
  }

  void cancel({required Function cancelNextExec}) {
    stop();
    cancelNextExec();
  }
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
