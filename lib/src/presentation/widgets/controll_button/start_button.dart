import 'package:flutter/material.dart';
import 'package:studimer/src/core/common/provider_consumer.dart';
import 'package:studimer/src/core/resources/type.dart';
import 'package:studimer/src/presentation/providers/cycle_option_provider.dart';

class StartButton extends StatelessWidget {
  const StartButton({Key? key}) : super(key: key);
  _onPressed(CycleOptionProvider provider) {
    provider.studyTmProvider.start(provider.oneCycle.studyTime,
        cancelNextExec: () => provider.setTimerStatus(
            TimerStatus.cancel)); //이거 고쳐야하는데 study에서 0되면 휴식모드로 넘거야해

    provider.setTimerStatus(TimerStatus.start);
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
                provider.isTimerBtnDisabled ? null : () => _onPressed(provider),
            child: const Text('You Can Do It !')));
  }
}
