import 'package:flutter/cupertino.dart';
import 'package:studimer/src/core/resources/type.dart';
import 'package:studimer/src/data/models/internal/notice.dart';
import 'package:studimer/src/data/models/internal/study_cycle.dart';

class CycleOptionProvider extends ChangeNotifier {
  late StudyCycle oneCycle = StudyCycle();
  FocusNum focusOn = FocusNum.none;
  TimerStatus timerStatus = TimerStatus.cancel;
  late int repeatCount;

  bool isTimerBtnDisabled = true;

  CycleOptionProvider() {
    checkIsTimeBtnDisabled();
  }

  setFocusOn(FocusNum value) {
    if (value != FocusNum.none && timerStatus == TimerStatus.start) return;
    focusOn = value;
    notifyListeners();
  }

  checkIsTimeBtnDisabled() {
    isTimerBtnDisabled = oneCycle.studyTime == Duration.zero;
    notifyListeners();
  }

  setReapeatCount(value) {
    repeatCount = value;
    notifyListeners();
  }

  setStudyTime(Duration newTime) {
    oneCycle.studyTime = newTime;
    checkIsTimeBtnDisabled();
  }

  setRestTime(Duration newTime) {
    oneCycle.restTime = newTime;
    checkIsTimeBtnDisabled();
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
