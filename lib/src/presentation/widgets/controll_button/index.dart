import 'package:flutter/material.dart';
import 'package:studimer/src/core/common/provider_consumer.dart';
import 'package:studimer/src/core/common/provider_listen_false.dart';
import 'package:studimer/src/core/resources/type.dart';
import 'package:studimer/src/presentation/providers/cycle_option_provider.dart';
import 'package:studimer/src/presentation/providers/timer_provider.dart';

import 'cancel_button.dart';
import 'start_button.dart';
import 'stop_button.dart';

class ControllButtonContainer extends StatelessWidget {
  const ControllButtonContainer({
    Key? key,
  }) : super(key: key);

  _notifyAfterFuncFor(BuildContext context, CycleOptionProvider cProvider) {
    if (cProvider.repeatCount == 1) return;
    cProvider.setReapeatCount(cProvider.repeatCount - 1);
    _studyTimerStart(context, cProvider);
  }

  _clearTimerStatusAndMode(CycleOptionProvider cProvider) {
    cProvider.isStudyTimerMode = false;
    cProvider.setTimerStatus(TimerStatus.cancel);
  }

  _studyTimerStart(BuildContext context, CycleOptionProvider cProvider) {
    final sProvider = timerProviderOf<StudyTimerProvider>(context);
    sProvider.start(cProvider.oneCycle.studyTime, cancelNextExecFor: () {
      cProvider.alarmStart(() {
        if (cProvider.timerStatus == TimerStatus.cancel) return;
        sProvider.setTimerTime(cProvider.oneCycle.studyTime);
        if (cProvider.oneCycle.restTime != Duration.zero) {
          cProvider.isStudyTimerMode = !cProvider.isStudyTimerMode;
          _restTimerStart(context, cProvider);
          return;
        }

        _notifyAfterFuncFor(context, cProvider);
      });

      if (cProvider.oneCycle.restTime != Duration.zero ||
          cProvider.repeatCount > 1) return;
      sProvider.setTimerTime(cProvider.oneCycle.studyTime);
      _clearTimerStatusAndMode(cProvider);
    });
  }

  _restTimerStart(BuildContext context, CycleOptionProvider cProvider) {
    final rProvider = timerProviderOf<RestTimerProvider>(context);
    rProvider.start(cProvider.oneCycle.restTime, cancelNextExecFor: () {
      if (cProvider.timerStatus == TimerStatus.cancel) return;
      cProvider.alarmStart(() {
        rProvider.setTimerTime(cProvider.oneCycle.restTime);
        cProvider.isStudyTimerMode = !cProvider.isStudyTimerMode;

        _notifyAfterFuncFor(context, cProvider);
      });
      if (cProvider.repeatCount > 1) return;
      rProvider.setTimerTime(cProvider.oneCycle.restTime);
      _clearTimerStatusAndMode(cProvider);
    });
  }

  _startOnPressed(BuildContext context) async {
    CycleOptionProvider cProvider = cycleOptionProviderOf(context);
    cProvider.setTimerStatus(TimerStatus.start);
    cProvider.setReapeatCount(cProvider.oneCycle.repeat!);
    cProvider.isTimerStop = false;
    _studyTimerStart(context, cProvider);
    cProvider.isStudyTimerMode = true;
  }

  _cancelOnPressed(BuildContext context) {
    final cProvider = cycleOptionProviderOf(context);
    final sProvider = timerProviderOf<StudyTimerProvider>(context);
    final rProvider = timerProviderOf<RestTimerProvider>(context);
    cProvider.isStudyTimerMode
        ? sProvider.cancel(cancelNextExec: () {
            sProvider.setTimerTime(cProvider.oneCycle.studyTime);
            cProvider.setTimerStatus(TimerStatus.cancel);
          })
        : rProvider.cancel(cancelNextExec: () {
            rProvider.setTimerTime(cProvider.oneCycle.restTime);
            cProvider.setTimerStatus(TimerStatus.cancel);
          });
    cProvider.isStudyTimerMode = false;
  }

  _stopOnPressed(BuildContext context, CycleOptionProvider cProvider) {
    cProvider.isStudyTimerMode
        ? timerProviderOf<StudyTimerProvider>(context)
            .stop(cProvider.isTimerStop)
        : timerProviderOf<RestTimerProvider>(context)
            .stop(cProvider.isTimerStop);
    cProvider.togleIsTimerStop();
  }

  @override
  Widget build(BuildContext context) {
    return CycleOptionPrvdConsumer(
        builder: (context, provider) => Container(
            margin: const EdgeInsets.only(top: 10),
            width: double.infinity,
            child: provider.timerStatus == TimerStatus.cancel
                ? StartButton(onPressed: () => _startOnPressed(context))
                : Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Expanded(
                            child: StopButton(
                                buttonText: provider.isTimerStop ? '재시작' : '중지',
                                onPressed: () =>
                                    _stopOnPressed(context, provider))),
                        Expanded(
                            child: CancelButton(
                                onPressed: () => _cancelOnPressed(context)))
                      ])));
  }
}
