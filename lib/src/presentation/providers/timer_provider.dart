import 'package:flutter/cupertino.dart';

class TimerProvider extends ChangeNotifier {
  int hour = 0;
  int minuate = 0;
  int second = 0;
  bool isPicker = true;
  final Function setTime;

  TimerProvider(Duration duration, this.setTime) {
    hour = duration.inHours;
    minuate = duration.inMinutes.remainder(60);
    second = duration.inSeconds.remainder(60);
  }

  _notify() {
    setTime(Duration(hours: hour, minutes: minuate, seconds: second));
    notifyListeners();
  }

  setHour(value) {
    hour = value;
    _notify();
  }

  setMinuate(value) {
    minuate = value;
    _notify();
  }

  setSecond(value) {
    second = value;
    _notify();
  }
}
