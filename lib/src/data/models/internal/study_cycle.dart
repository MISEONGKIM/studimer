import 'alram.dart';

class StudyCycle {
  int? id;
  Duration studyTime = Duration.zero;
  Duration restTime = Duration.zero;
  int? repeat = 1;
  Alram alram = Alram.noticeList[0];

  StudyCycle();
}
