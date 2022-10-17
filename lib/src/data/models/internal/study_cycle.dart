import 'package:equatable/equatable.dart';

import 'notice.dart';
import 'time.dart';

class StudyCycle extends Equatable {
  int? id;
  Time studyTime = Time.init;
  Time restTime = Time.init;
  int? repeat = 1;
  Notice? notice = Notice.noticeList[0];

  StudyCycle();

  @override
  List<Object?> get props => [id, studyTime, restTime, repeat, notice];
}
