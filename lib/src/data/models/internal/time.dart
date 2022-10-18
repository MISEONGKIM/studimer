class Time {
  int hour = 0;
  int minuate = 0;
  int second = 0;

  static Time get zero => Time.init(hour: 0, minuate: 0, second: 0);
  Time();
  Time.init({required this.hour, required this.minuate, required this.second});
}
