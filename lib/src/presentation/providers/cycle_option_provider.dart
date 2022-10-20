import 'package:flutter/cupertino.dart';
import 'package:studimer/src/core/resources/type.dart';
import 'package:studimer/src/data/models/internal/notice.dart';
import 'package:studimer/src/data/models/internal/study_cycle.dart';

class CycleOptionProvider extends ChangeNotifier {
  late StudyCycle oneCycle = StudyCycle();
  FocusNum focusOn = FocusNum.none;
  TimerStatus timerStatus = TimerStatus.cancle;

  setFocusOn(FocusNum value) {
    focusOn = value;
    notifyListeners();
  }

  setStudyTime(Duration newTime) {
    oneCycle.studyTime = newTime;
  }

  setRestTime(Duration newTime) {
    oneCycle.restTime = newTime;
  }

  setRepeat(int value) {
    oneCycle.repeat = value;
  }

  setNotice(Notice value) {
    oneCycle.notice = value;
  }

  setTimerStatus(TimerStatus value) {
    timerStatus = value;
    notifyListeners();
  }
}
