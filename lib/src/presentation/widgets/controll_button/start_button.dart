import 'package:flutter/material.dart';
import 'package:studimer/src/core/common/provider_consumer.dart';
import 'package:studimer/src/core/common/provider_listen_false.dart';
import 'package:studimer/src/core/resources/type.dart';
import 'package:studimer/src/presentation/providers/cycle_option_provider.dart';
import 'package:studimer/src/presentation/providers/timer_provider.dart';

class StartButton extends StatelessWidget {
  const StartButton({Key? key}) : super(key: key);
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
      }
      _studyTimerStart(context, cProvider);
    });
  }

  _onPressed(BuildContext context) {
    CycleOptionProvider cProvider = cycleOptionProviderOf(context);
    cProvider.setTimerStatus(TimerStatus.start);
    _studyTimerStart(context, cProvider);
  }

  @override
  Widget build(BuildContext context) {
    return CycleOptionPrvdConsumer(
        builder: (context, provider) => ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(20),
                disabledBackgroundColor: Colors.grey,
                foregroundColor: Colors.white,
                textStyle:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                backgroundColor: Colors.green[600]),
            onPressed:
                provider.isTimerBtnDisabled ? null : () => _onPressed(context),
            child: const Text('You Can Do It !')));
  }
}
