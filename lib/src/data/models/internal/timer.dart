class TimerModel {
  int hour = 0;
  int minuate = 0;
  int second = 0;
  final Function setTime;

  TimerModel(Duration duration, this.setTime) {
    durationConvert(duration);
  }

  String lpadZeroFormatter(int value) {
    return value > 9 ? value.toString() : '0$value';
  }

  durationConvert(Duration duration) {
    hour = duration.inHours;
    minuate = duration.inMinutes.remainder(60);
    second = duration.inSeconds.remainder(60);
  }

  Duration getDuration() {
    return Duration(hours: hour, minutes: minuate, seconds: second);
  }
}
