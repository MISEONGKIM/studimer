import 'package:flutter/cupertino.dart';
import 'package:studimer/src/presentation/widgets/timer/timer_number_container.dart';

class TimerWidget extends StatelessWidget {
  const TimerWidget({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    final isTimerStart = false;
    return Column(children: [
      Text(title),
      Row(children: [
        TimerNumberContainer(
          isTimerStart: isTimerStart,
        ),
        TimerNumberContainer(
          isTimerStart: isTimerStart,
        ),
        TimerNumberContainer(
          isTimerStart: isTimerStart,
        )
      ])
    ]);
  }
}
