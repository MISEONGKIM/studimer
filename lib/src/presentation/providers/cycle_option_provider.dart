import 'dart:async';

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
  bool isStudyTimerMode = false;
  bool isTimerStop = false;
  bool isTimerBtnDisabled = true;

  setFocusOn(FocusNum value) {
    if (timerStatus != TimerStatus.cancel) return;
    focusOn = value;
    notifyListeners();
  }

  setTimeoutNoneFocusOn() {
    Timer(const Duration(milliseconds: 150), () {
      focusOn = FocusNum.none;
      notifyListeners();
    });
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
    String notifyContent = oneCycle.restTime == Duration.zero
        ? repeatCount == 1
            ? '타이머 종료-! 대단하구만! ☝(｀ط´≠)'
            : '공부하쟈 ~ ₍ᐢ.ˬ.ᐢ₎❤️'
        : isStudyTimerMode
            ? '쉬엄쉬엄해 ~ (ﾉ≧ڡ≦)💕'
            : repeatCount == 1
                ? '타이머 종료-! 대단하구만! ☝(｀ط´≠)'
                : '공부하쟈 ~ ₍ᐢ.ˬ.ᐢ₎❤️';

    Notify.createAlarm(
        notifyAfterExecuteFunc: () {
          oneCycle.alarm.stopAlarm(oneCycle.alarm.alarmCode);
          notifyAfterFunction();
        },
        content: notifyContent);
    oneCycle.alarm.startAlarm(oneCycle.alarm.alarmCode);
  }
}
