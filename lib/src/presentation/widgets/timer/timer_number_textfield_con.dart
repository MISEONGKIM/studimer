import 'package:flutter/material.dart';
import 'package:studimer/src/data/models/internal/time.dart';
import 'timer_number_textfield.dart';

class TimerNumberTextFieldCon extends StatelessWidget {
  const TimerNumberTextFieldCon({Key? key, required this.time})
      : super(key: key);
  final Time time;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      TimerNumberTextField(
        counter: time.hour,
        maxValue: 12,
      ),
      TimerNumberTextField(
        counter: time.minuate,
        maxValue: 59,
      ),
      TimerNumberTextField(
        counter: time.second,
        maxValue: 59,
      )
    ]);
  }
}
