import 'notice.dart';
import 'time.dart';

class StudyCycle {
  int? id;
  Time studyTime = Time.zero;
  Time restTime = Time.zero;
  int? repeat = 1;
  Notice? notice = Notice.noticeList[0];

  StudyCycle();
}
