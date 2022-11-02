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
    timerProviderOf<StudyTimerProvider>(context)
        .start(cProvider.oneCycle.studyTime, cancelNextExec: () {
      if (cProvider.oneCycle.repeat == 1 &&
          cProvider.oneCycle.restTime == Duration.zero) {
        cProvider.setTimerStatus(TimerStatus.cancel);
        return;
      }
      _restTimerStart(context, cProvider);
    });
  }

  _restTimerStart(BuildContext context, CycleOptionProvider cProvider) {
    timerProviderOf<RestTimerProvider>(context)
        .start(cProvider.oneCycle.restTime, cancelNextExec: () {
      if (cProvider.oneCycle.repeat == 1) {
        cProvider.setTimerStatus(TimerStatus.cancel);
        return;
      }
      _studyTimerStart(context, cProvider);
    });
  }

  _startOnPressed(BuildContext context) {
    CycleOptionProvider cProvider = cycleOptionProviderOf(context);
    cProvider.setTimerStatus(TimerStatus.start);
    _studyTimerStart(context, cProvider);
  }

  _cancelOnPressed(BuildContext context) {
    final cProvider = cycleOptionProviderOf(context);
    timerProviderOf<StudyTimerProvider>(context).cancel(
        cancelNextExec: () => cProvider.setTimerStatus(TimerStatus.cancel));
    timerProviderOf<RestTimerProvider>(context).cancel(
        cancelNextExec: () => cProvider.setTimerStatus(TimerStatus.cancel));
    cProvider.setTimerStatus(TimerStatus.cancel);
  }

  @override
  Widget build(BuildContext context) {
    return CycleOptionPrvdConsumer(
        builder: (context, provider) => Container(
            margin: const EdgeInsets.only(top: 10),
            width: double.infinity,
            child: provider.timerStatus == TimerStatus.start
                ? Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Expanded(child: StopButton()),
                        Expanded(
                            child: CancelButton(
                                onPressed: () => _cancelOnPressed(context)))
                      ])
                : StartButton(onPressed: () => _startOnPressed(context))));
  }
}
