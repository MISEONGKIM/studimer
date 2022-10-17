import 'package:flutter/cupertino.dart';
import 'package:studimer/src/presentation/widgets/timer/timer_number_container.dart';

class TimerWidget extends StatelessWidget {
  const TimerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isTimerStart = false;
    return Row(children: [
      TimerNumberContainer(
        isTimerStart: isTimerStart,
      ),
      TimerNumberContainer(
        isTimerStart: isTimerStart,
      ),
      TimerNumberContainer(
        isTimerStart: isTimerStart,
      )
    ]);
  }
}
