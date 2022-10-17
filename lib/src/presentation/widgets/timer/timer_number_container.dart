import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:studimer/src/presentation/widgets/timer/timer_number.dart';
import 'package:studimer/src/presentation/widgets/timer/timer_number_picker.dart';

class TimerNumberContainer extends HookWidget {
  const TimerNumberContainer({Key? key, required this.isTimerStart})
      : super(key: key);
  final bool isTimerStart;
  @override
  Widget build(BuildContext context) {
    final counter = useState(0);
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
