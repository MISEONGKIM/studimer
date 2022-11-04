import 'package:flutter/cupertino.dart';
import 'package:studimer/src/core/resources/type.dart';
import 'package:studimer/src/data/models/internal/alram.dart';
import 'package:studimer/src/data/models/internal/notify.dart';
import 'package:studimer/src/data/models/internal/study_cycle.dart';

class CycleOptionProvider extends ChangeNotifier {
  late StudyCycle oneCycle = StudyCycle();
  FocusNum focusOn = FocusNum.none;
  TimerStatus timerStatus = TimerStatus.cancel;
  late int repeatCount;
  bool isStudyTimerWorking = false;
  bool isTimerStop = false;
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

  setAlram(Alram value) {
    oneCycle.alram = value;
  }

  setTimerStatus(TimerStatus value) {
    timerStatus = value;
    notifyListeners();
  }

  setIsTimerStop() {
    isTimerStop = !isTimerStop;
    notifyListeners();
  }

  void alramStart() {
    String notifyContent = isStudyTimerWorking ? '쉬는 시간 입니다.' : '공부할 시간 입니다.';
    Notify(notifyAfterExecuteFunc: null, bgNotifyAfterExecuteFunc: null)
        .create(notifyContent);
    oneCycle.alram.startAlram();
  }
}
