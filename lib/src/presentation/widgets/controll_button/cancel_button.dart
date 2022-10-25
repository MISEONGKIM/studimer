import 'package:flutter/material.dart';
import 'package:studimer/src/core/common/provider_listen_false.dart';
import 'package:studimer/src/core/resources/type.dart';
import 'package:studimer/src/presentation/providers/cycle_option_provider.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({Key? key}) : super(key: key);
  _onPressed(CycleOptionProvider provider) {
    provider.studyTmProvider.isRunning &&
        provider.studyTmProvider.stop(
            cancelNextExec: () => provider.setTimerStatus(TimerStatus.cancel));
    provider.restTmProvider.isRunning &&
        provider.restTmProvider.stop(
            cancelNextExec: () => provider.setTimerStatus(TimerStatus.cancel));
    provider.setTimerStatus(TimerStatus.cancel);
  }

  @override
  Widget build(BuildContext context) {
    final provider = cycleOptionProvider(context);
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(10),
            foregroundColor: Colors.white,
            textStyle:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            backgroundColor: Colors.brown),
        onPressed: () => _onPressed(provider),
        child: const Text(
          '포기는 배추 셀 때나\n하는 말이다 !',
          textAlign: TextAlign.center,
        ));
  }
}
