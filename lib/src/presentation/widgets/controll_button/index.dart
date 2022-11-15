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
    final tProvider = timerProviderOf<StudyTimerProvider>(context);
    tProvider.start(cProvider.oneCycle.studyTime, cancelNextExecFor: () {
      cProvider.alarmStart(() {
        if (cProvider.oneCycle.restTime != Duration.zero) {
          cProvider.isStudyTimerMode = !cProvider.isStudyTimerMode;
          _restTimerStart(context, cProvider);
          return;
        }

        _notifyAfterFuncFor(context, cProvider);
      });

      if (cProvider.oneCycle.restTime != Duration.zero ||
          cProvider.repeatCount > 1) return;
      _clearTimerStatusAndMode(cProvider);
    });
  }

  _restTimerStart(BuildContext context, CycleOptionProvider cProvider) {
    timerProviderOf<RestTimerProvider>(context)
        .start(cProvider.oneCycle.restTime, cancelNextExecFor: () {
      cProvider.alarmStart(() {
        cProvider.isStudyTimerMode = !cProvider.isStudyTimerMode;
        _notifyAfterFuncFor(context, cProvider);
      });
      if (cProvider.repeatCount > 1) return;
      _clearTimerStatusAndMode(cProvider);
    });
  }

  _startOnPressed(BuildContext context) {
    CycleOptionProvider cProvider = cycleOptionProviderOf(context);
    cProvider.setTimerStatus(TimerStatus.start);
    cProvider.setReapeatCount(cProvider.oneCycle.repeat!);
    cProvider.isTimerStop = false;
    _studyTimerStart(context, cProvider);
    cProvider.isStudyTimerMode = true;
  }

  _cancelOnPressed(BuildContext context) {
    final cProvider = cycleOptionProviderOf(context);
    cProvider.isStudyTimerMode
        ? timerProviderOf<StudyTimerProvider>(context).cancel(
            cancelNextExec: () => cProvider.setTimerStatus(TimerStatus.cancel))
        : timerProviderOf<RestTimerProvider>(context).cancel(
            cancelNextExec: () => cProvider.setTimerStatus(TimerStatus.cancel));
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
