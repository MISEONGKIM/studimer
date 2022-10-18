import 'package:flutter/material.dart';
import 'package:studimer/src/core/common/timer_provider_consumer.dart';

import 'timer_number_picker.dart';

class TimerNumberPickerCon extends StatelessWidget {
  const TimerNumberPickerCon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TimerPrvdConsumer(
        builder: (context, provider) => Row(children: [
              TimerNumberPicker(
                onChange: (int newValue) {
                  provider.setHour(newValue);
                },
                value: provider.hour,
                maxValueForPicker: 12,
              ),
              TimerNumberPicker(
                onChange: (int newValue) {
                  provider.setMinuate(newValue);
                },
                value: provider.minuate,
                maxValueForPicker: 59,
              ),
              TimerNumberPicker(
                onChange: (int newValue) {
                  provider.setSecond(newValue);
                },
                value: provider.second,
                maxValueForPicker: 59,
              )
            ]));
  }
}
