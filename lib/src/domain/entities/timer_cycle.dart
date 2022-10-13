import 'package:equatable/equatable.dart';

import 'notice.dart';
import 'time.dart';

class TimerCycle extends Equatable {
  final int id;
  Time? studyTime;
  Time? restTime;
  int? repeat = 1;
  Notice? notice = Notice.noticeList[0];

  TimerCycle(
      {required this.id,
      required this.studyTime,
      required this.restTime,
      this.repeat,
      this.notice});

  @override
  List<Object?> get props => [id, studyTime, restTime, repeat, notice];
}
