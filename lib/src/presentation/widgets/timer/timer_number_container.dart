import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:studimer/src/presentation/widgets/timer/timer_number.dart';
import 'package:studimer/src/presentation/widgets/timer/timer_number_picker.dart';

class TimerNumberContainer extends HookWidget {
  TimerNumberContainer({Key? key, required this.isTimerStart})
      : super(key: key);
  final bool isTimerStart;
  final counter = useState(0);
  @override
  Widget build(BuildContext context) {
    return isTimerStart
        ? TimerNumber(
            counter: counter.value,
          )
        : TimerNumberPicker(
            onChange: (int newValue) {
              counter.value = newValue;
            },
            value: counter.value,
          );
  }
}
