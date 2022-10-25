import 'package:flutter/material.dart';
import 'package:studimer/src/core/common/provider_consumer.dart';
import 'package:studimer/src/core/resources/type.dart';
import 'package:studimer/src/presentation/providers/timer_provider.dart';

class TimerControllButton extends StatelessWidget {
  const TimerControllButton(
      {Key? key, required this.restTmProvider, required this.studyTmProvider})
      : super(key: key);
  final TimerProvider studyTmProvider;
  final TimerProvider restTmProvider;
  @override
  Widget build(BuildContext context) {
    return CycleOptionPrvdConsumer(
        builder: (context, provider) => provider.timerStatus ==
                TimerStatus.start
            ? Row(children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        backgroundColor: Colors.grey[600]),
                    onPressed: () {},
                    child: const Text('凸')),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        backgroundColor: Colors.brown),
                    onPressed: () {
                      provider.isStudyMode
                          ? studyTmProvider.stop(
                              cancelNextExec: () =>
                                  provider.setTimerStatus(TimerStatus.cancle))
                          : restTmProvider.stop(
                              cancelNextExec: () =>
                                  provider.setTimerStatus(TimerStatus.cancle));
                      provider.setTimerStatus(TimerStatus.cancle);
                    },
                    child: const Text('뭠춰'))
              ])
            : ElevatedButton(
                style: ElevatedButton.styleFrom(
                    disabledBackgroundColor: Colors.grey,
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                    backgroundColor: Colors.green[600]),
                onPressed: provider.isTimerBtnDisabled
                    ? null
                    : () {
                        provider.isStudyMode
                            ? studyTmProvider.start(provider.oneCycle.studyTime,
                                cancelNextExec: () =>
                                    provider.setTimerStatus(TimerStatus.cancle))
                            : restTmProvider.start(provider.oneCycle.restTime,
                                cancelNextExec: () => provider
                                    .setTimerStatus(TimerStatus.cancle));
                        provider.setTimerStatus(TimerStatus.start);
                      },
                child: const Text('스타또')));
  }
}
