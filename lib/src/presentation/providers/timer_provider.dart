import 'dart:async';

import 'package:flutter/cupertino.dart';

class TimerProvider extends ChangeNotifier {
  int hour = 0;
  int minuate = 0;
  int second = 0;
  final Function setTime;
  late Timer _timer;
  bool isRunning = false;

  TimerProvider(Duration duration, this.setTime) {
    durationConvert(duration);
  }

  durationConvert(Duration duration) {
    hour = duration.inHours;
    minuate = duration.inMinutes.remainder(60);
    second = duration.inSeconds.remainder(60);
    notifyListeners();
  }

  _notify() {
    setTime(Duration(hours: hour, minutes: minuate, seconds: second));
    notifyListeners();
  }

  String lpadZeroFormatter(int value) {
    return value > 9 ? value.toString() : '0$value';
  }

  setHour(int value) {
    hour = value;
    _notify();
  }

  setMinuate(int value) {
    minuate = value;
    _notify();
  }

  setSecond(int value) {
    second = value;
    _notify();
  }

  start(Duration time, {required Function() cancelNextExec}) {
    int seconds = time.inSeconds;
    isRunning = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      seconds -= 1;
      print(seconds);
      durationConvert(Duration(seconds: seconds));
      if (seconds == 0) {
        stop(cancelNextExec: cancelNextExec);
      }
    });
  }

  stop({required Function() cancelNextExec}) {
    cancelNextExec();
    _timer.cancel();
  }

  cancel() {
    _timer.cancel();
    //시간 값 초기화 ?
  }
}

class StudyTimerProvider extends TimerProvider {
  StudyTimerProvider(Duration duration, Function setTime)
      : super(duration, setTime);
}

class RestTimerProvider extends TimerProvider {
  RestTimerProvider(Duration duration, Function setTime)
      : super(duration, setTime);
}
