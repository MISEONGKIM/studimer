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
  late Notify notify;
  bool isStudyTimerMode = false;
  bool isTimerStop = false;
  bool isTimerBtnDisabled = true;

  CycleOptionProvider() {
    checkIsTimeBtnDisabled();
  }

  setFocusOn(FocusNum value) {
    if (timerStatus != TimerStatus.cancel) return;
    focusOn = value;
    notifyListeners();
  }

  checkIsTimeBtnDisabled() {
    isTimerBtnDisabled = oneCycle.studyTime == Duration.zero;
    notifyListeners();
  }

  setReapeatCount(int value) {
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

  void alramStart(Function notifyAfterFunction) {
    String notifyContent = isStudyTimerMode ? '쉬는 시간 입니다.' : '공부할 시간 입니다.';
    notify = Notify(notifyAfterExecuteFunc: () {
      oneCycle.alram.stopAlram();
      notifyAfterFunction();
    }, bgNotifyAfterExecuteFunc: () {
      oneCycle.alram.stopAlram();
    });
    notify.create(notifyContent);
    oneCycle.alram.startAlram();
  }
}
