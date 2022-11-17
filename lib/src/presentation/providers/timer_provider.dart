import 'dart:async';
import 'package:flutter/material.dart';
import 'package:studimer/src/core/resources/type.dart';
import 'package:studimer/src/data/models/internal/backgound_service.dart';
import 'package:studimer/src/data/models/internal/timer.dart';

class TimerProvider extends ChangeNotifier {
  TimerModel t = TimerModel();
  FocusNum focusNum;
  late Timer timer;
  late void Function() cancelNextExec;
  late void Function(Duration) _setTime;
  set setTime(void Function(Duration) setTime) => _setTime = setTime;

  TimerProvider(this.focusNum);

  _notify() async {
    _setTime(t.getDuration());
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

  void start(Duration time,
      {required void Function() cancelNextExecFor}) async {
    int seconds = time.inSeconds;
    cancelNextExec = cancelNextExecFor;

    await BackGroundService.startBackGroundService();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      seconds -= 1;
      BackGroundService.timerBackGroundService(t.getTimeFormatterString());
      setTimerTime(Duration(seconds: seconds));
      notifyListeners();
      if (seconds == 0) {
        cancel(cancelNextExec: cancelNextExec);
      }
    });
  }

  void stop(bool isStop) {
    isStop
        ? start(t.getDuration(), cancelNextExecFor: cancelNextExec)
        : timer.cancel();
  }

  void cancel({required Function cancelNextExec}) {
    BackGroundService.stopBackGroundService();
    if (timer.isActive) {
      timer.cancel();
    }
    cancelNextExec();
    notifyListeners();
  }

  void setTimerTime(Duration time) {
    t.durationConvert(time);
    notifyListeners();
  }
}

class StudyTimerProvider extends TimerProvider {
  StudyTimerProvider() : super(FocusNum.studytime);
}

class RestTimerProvider extends TimerProvider {
  RestTimerProvider() : super(FocusNum.resttime);
}
