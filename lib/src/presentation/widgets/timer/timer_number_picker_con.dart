import 'package:flutter/material.dart';
import 'package:studimer/src/data/models/internal/time.dart';

import 'timer_number_picker.dart';

class TimerNumberPickerCon extends StatelessWidget {
  const TimerNumberPickerCon({Key? key, required this.time}) : super(key: key);
  final Time time;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      TimerNumberPicker(
        onChange: (int newValue) {
          time.hour = newValue;
        },
        value: time.hour,
        maxValueForPicker: 12,
      ),
      TimerNumberPicker(
        onChange: (int newValue) {
          time.minuate = newValue;
        },
        value: time.minuate,
        maxValueForPicker: 59,
      ),
      TimerNumberPicker(
        onChange: (int newValue) {
          time.second = newValue;
        },
        value: time.second,
        maxValueForPicker: 59,
      )
    ]);
  }
}
