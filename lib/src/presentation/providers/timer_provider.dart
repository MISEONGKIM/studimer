import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:studimer/src/core/resources/type.dart';
import 'package:studimer/src/data/models/internal/backgound_service.dart';
import 'package:studimer/src/data/models/internal/timer.dart';

class TimerProvider extends ChangeNotifier {
  TimerModel t = TimerModel();
  FocusNum focusNum;
  int timerNotifyId = Random().nextInt(pow(2, 31) as int);
  late Timer timer;
  late void Function() cancelNextExec;
  late void Function(Duration) _setTime;
  set setTime(void Function(Duration) setTime) => _setTime = setTime;

  TimerProvider(this.focusNum);

  _notify() async {
    _setTime(t.getDuration());
    notifyListeners();
  }

  void setHours(int value) {
    t.hours = value;
    _notify();
  }

  void setMinutes(int value) {
    t.minutes = value;
    _notify();
  }

  void setSeconds(int value) {
    t.seconds = value;
    _notify();
  }

  void setTimerNotifyId() {
    timerNotifyId = Random().nextInt(pow(2, 31) as int);
  }

  void start(Duration time,
      {required void Function() cancelNextExecFor,
      bool isOnPressedStop = false}) async {
    int seconds = time.inSeconds;
    cancelNextExec = cancelNextExecFor;

    if (!isOnPressedStop) {
      await BackGroundService.startBackGroundService(
          timerNotifyId, t.getTimeFormatterString());
    }
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      seconds -= 1;
      BackGroundService.timerBackGroundService(
          timerNotifyId, t.getTimeFormatterString());
      setTimerTime(Duration(seconds: seconds));
      notifyListeners();
      if (seconds == 0) {
        cancel(cancelNextExec: cancelNextExec);
      }
    });
  }

  void stop(bool isStop) {
    isStop
        ? start(t.getDuration(),
            cancelNextExecFor: cancelNextExec, isOnPressedStop: true)
        : timer.cancel();
  }

  void cancel({required Function cancelNextExec}) {
    BackGroundService.stopBackGroundService(timerNotifyId);
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
