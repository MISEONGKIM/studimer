import 'package:flutter/material.dart';
import 'package:studimer/src/core/common/provider_consumer.dart';
import 'package:studimer/src/core/resources/type.dart';

class TimerControllButton extends StatelessWidget {
  const TimerControllButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CycleOptionPrvdConsumer(
        builder: (context, provider) =>
            provider.timerStatus == TimerStatus.start
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
                          provider.setTimerStatus(TimerStatus.cancle);
                        },
                        child: const Text('뭠춰'))
                  ])
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        backgroundColor: Colors.green[600]),
                    onPressed: () {
                      provider.setTimerStatus(TimerStatus.start);
                    },
                    child: const Text('스타또')));
  }
}
