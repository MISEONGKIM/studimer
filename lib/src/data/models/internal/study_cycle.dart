import 'notice.dart';

class StudyCycle {
  int? id;
  Duration studyTime = Duration.zero;
  Duration restTime = Duration.zero;
  int? repeat = 1;
  Notice? notice = Notice.noticeList[0];

  StudyCycle();
}
