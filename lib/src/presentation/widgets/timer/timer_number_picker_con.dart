import 'package:flutter/material.dart';
import 'package:studimer/src/core/common/study_cycle_provodier_consumer.dart';
import 'package:studimer/src/data/models/internal/time.dart';

import 'timer_number_picker.dart';

class TimerNumberPickerCon extends StatelessWidget {
  const TimerNumberPickerCon({Key? key, required this.time}) : super(key: key);
  final Time time;
  @override
  Widget build(BuildContext context) {
  return  Row(children: [
        TimerNumberPicker(
          onChange: (int newValue) {
            time. = newValue;
          },
          value: counter.value,
          maxValueForPicker: 12,
        ),
        TimerNumberPicker(
          onChange: (int newValue) {
            counter.value = newValue;
          },
          value: counter.value,
          maxValueForPicker: 60,
        ),
        TimerNumberPicker(
          onChange: (int newValue) {
            counter.value = newValue;
          },
          value: counter.value,
          maxValueForPicker: 60,
        )
      ]);
    
  }
}
