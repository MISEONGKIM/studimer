import 'package:flutter/cupertino.dart';
import 'package:studimer/src/core/resources/type.dart';
import 'package:studimer/src/data/models/internal/alarm.dart';
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

  setAlarm(Alarm value) {
    oneCycle.alarm = value;
  }

  setTimerStatus(TimerStatus value) {
    timerStatus = value;
    notifyListeners();
  }

  togleIsTimerStop() {
    isTimerStop = !isTimerStop;
    notifyListeners();
  }

  void alarmStart(Function notifyAfterFunction) {
    String notifyContent =
        isStudyTimerMode && oneCycle.restTime != Duration.zero
            ? '쉬는 시간 입니다.'
            : '공부할 시간 입니다.';
    notify = Notify(notifyAfterExecuteFunc: () {
      oneCycle.alarm.stopAlarm();
      notifyAfterFunction();
    }, bgNotifyAfterExecuteFunc: () {
      oneCycle.alarm.stopAlarm();
    });
    notify.create(notifyContent);
    oneCycle.alarm.startAlarm();
  }
}
