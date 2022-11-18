class TimerModel {
  int hours = 0;
  int minutes = 0;
  int seconds = 0;

  TimerModel() {
    durationConvert();
  }

  String lpadZeroFormatter(int value) {
    return value > 9 ? value.toString() : '0$value';
  }

  durationConvert([Duration duration = Duration.zero]) {
    hours = duration.inHours;
    minutes = duration.inMinutes.remainder(60);
    seconds = duration.inSeconds.remainder(60);
  }

  Duration getDuration() {
    return Duration(hours: hours, minutes: minutes, seconds: seconds);
  }

  String getTimeFormatterString() {
    return '${lpadZeroFormatter(hours)}:${lpadZeroFormatter(minutes)}:${lpadZeroFormatter(seconds)}';
  }
}
