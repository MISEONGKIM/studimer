import 'notice.dart';

class StudyCycle {
  int? id;
  Duration studyTime = const Duration(hours: 1);
  Duration restTime = const Duration(hours: 0);
  int? repeat = 1;
  Notice? notice = Notice.noticeList[0];

  StudyCycle();
}
