import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:studimer/src/data/models/internal/timer.dart';

class TimerProvider extends ChangeNotifier {
  late TimerModel t;

  _notify() {
    t.setTime(Duration(hours: t.hour, minutes: t.minuate, seconds: t.second));
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

  void start(Duration time, {required Function() cancelNextExec}) {
    int seconds = time.inSeconds;
    t.isRunning = true;
    t.timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      seconds -= 1;
      print(seconds);
      t.durationConvert(Duration(seconds: seconds));
      notifyListeners();
      if (seconds == 0) {
        stop(cancelNextExec: cancelNextExec);
      }
    });
  }

  void stop({required Function() cancelNextExec}) {
    if (!t.timer.isActive) return;
    t.timer.cancel();
    cancelNextExec();
  }

  void cancel() {
    if (!t.timer.isActive) return;
    t.timer.cancel();
    //시간 값 초기화 ?
  }
}

class StudyTimerProvider extends TimerProvider {
  setModel(TimerModel t) {
    super.t = t;
  }
}

class RestTimerProvider extends TimerProvider {
  setModel(TimerModel t) {
    super.t = t;
  }
}
