import 'alarm.dart';

class StudyCycle {
  int? id;
  Duration studyTime = Duration.zero;
  Duration restTime = Duration.zero;
  int? repeat = 1;
  Alarm alarm = Alarm.noticeList[0];

  StudyCycle();
}
