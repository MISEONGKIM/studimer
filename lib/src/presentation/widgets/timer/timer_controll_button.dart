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
        builder: (context, provider) => Container(
            margin: const EdgeInsets.only(top: 10),
            width: double.infinity,
            child: provider.timerStatus == TimerStatus.start
                ? Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Expanded(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(20),
                                    foregroundColor: Colors.white,
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30),
                                    backgroundColor: Colors.blueGrey),
                                onPressed: () {},
                                child: const Text('ㅗ'))),
                        Expanded(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(10),
                                    foregroundColor: Colors.white,
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                    backgroundColor: Colors.brown),
                                onPressed: () {
                                  provider.isStudyMode
                                      ? studyTmProvider.stop(
                                          cancelNextExec: () =>
                                              provider.setTimerStatus(
                                                  TimerStatus.cancle))
                                      : restTmProvider.stop(
                                          cancelNextExec: () =>
                                              provider.setTimerStatus(
                                                  TimerStatus.cancle));
                                  provider.setTimerStatus(TimerStatus.cancle);
                                },
                                child: const Text(
                                  '포기는 배추 셀 때나\n하는 말이다 !',
                                  textAlign: TextAlign.center,
                                )))
                      ])
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(20),
                        disabledBackgroundColor: Colors.grey,
                        foregroundColor: Colors.white,
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                        backgroundColor: Colors.green[600]),
                    onPressed: provider.isTimerBtnDisabled
                        ? null
                        : () {
                            provider.isStudyMode
                                ? studyTmProvider.start(
                                    provider.oneCycle.studyTime,
                                    cancelNextExec: () => provider
                                        .setTimerStatus(TimerStatus.cancle))
                                : restTmProvider.start(
                                    provider.oneCycle.restTime,
                                    cancelNextExec: () => provider
                                        .setTimerStatus(TimerStatus.cancle));
                            provider.setTimerStatus(TimerStatus.start);
                          },
                    child: const Text('You Can Do It !'))));
  }
}
