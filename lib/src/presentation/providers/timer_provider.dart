import 'package:flutter/cupertino.dart';

class TimerProvider extends ChangeNotifier {
  int hour = 0;
  int minuate = 0;
  int second = 0;
  bool isPicker = true;

  TimerProvider(Duration duration) {
    hour = duration.inHours;
    minuate = duration.inMinutes.remainder(60);
    second = duration.inSeconds.remainder(60);
  }

  setHour(value) {
    hour = value;
    notifyListeners();
  }

  setMinuate(value) {
    minuate = value;
    notifyListeners();
  }

  setSecond(value) {
    second = value;
    notifyListeners();
  }
}
