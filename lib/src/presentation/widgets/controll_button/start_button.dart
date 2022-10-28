import 'package:flutter/material.dart';
import 'package:studimer/src/core/common/provider_consumer.dart';
import 'package:studimer/src/core/common/provider_listen_false.dart';
import 'package:studimer/src/core/resources/type.dart';
import 'package:studimer/src/presentation/providers/timer_provider.dart';

class StartButton extends StatelessWidget {
  const StartButton({Key? key}) : super(key: key);
  _onPressed(BuildContext context) {
    final cProvider = cycleOptionProviderOf(context);
    timerProviderOf<StudyTimerProvider>(context).start(
        cProvider.oneCycle.studyTime,
        cancelNextExec: () => cProvider.setTimerStatus(
            TimerStatus.cancel)); //이거 고쳐야하는데 study에서 0되면 rest모드로 넘거야해

    cProvider.setTimerStatus(TimerStatus.start);
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
