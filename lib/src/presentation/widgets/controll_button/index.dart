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

  _studyTimerStart(BuildContext context, CycleOptionProvider cProvider) {
    final tProvider = timerProviderOf<StudyTimerProvider>(context);
    tProvider.start(cProvider.oneCycle.studyTime, cancelNextExecFor: () {
      cProvider.alramStart();
      if (cProvider.oneCycle.restTime != Duration.zero) return;
      cProvider.oneCycle.repeat != 1 &&
          cProvider.setReapeatCount(cProvider.repeatCount - 1);
    });
  }

  _restTimerStart(BuildContext context, CycleOptionProvider cProvider) {
    timerProviderOf<RestTimerProvider>(context)
        .start(cProvider.oneCycle.restTime, cancelNextExecFor: () {
      cProvider.alramStart();
      cProvider.oneCycle.repeat != 1 &&
          cProvider.setReapeatCount(cProvider.repeatCount - 1);
    });
  }

  _startOnPressed(BuildContext context) {
    CycleOptionProvider cProvider = cycleOptionProviderOf(context);
    cProvider.setTimerStatus(TimerStatus.start);
    cProvider.setReapeatCount(cProvider.oneCycle.repeat);
    cProvider.isStudyTimerMode
        ? _restTimerStart(context, cProvider)
        : _studyTimerStart(context, cProvider);
    cProvider.isStudyTimerMode = !cProvider.isStudyTimerMode;
  }

  _cancelOnPressed(BuildContext context) {
    final cProvider = cycleOptionProviderOf(context);
    cProvider.isStudyTimerMode
        ? timerProviderOf<StudyTimerProvider>(context).cancel(
            cancelNextExec: () => cProvider.setTimerStatus(TimerStatus.cancel))
        : timerProviderOf<RestTimerProvider>(context).cancel(
            cancelNextExec: () => cProvider.setTimerStatus(TimerStatus.cancel));
  }

  _stopOnPressed(BuildContext context, CycleOptionProvider cProvider) {
    cProvider.setIsTimerStop();
    timerProviderOf<StudyTimerProvider>(context).stop(cProvider.isTimerStop);
    timerProviderOf<RestTimerProvider>(context).stop(cProvider.isTimerStop);
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
