import 'package:flutter/material.dart';
import 'package:studimer/src/data/models/internal/time.dart';
import 'timer_number_textfiled.dart';

class TimerNumberTextfiledCon extends StatelessWidget {
  const TimerNumberTextfiledCon({Key? key, required this.time})
      : super(key: key);
  final Time time;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      TimerNumberTextField(
        counter: time.hour,
      ),
      TimerNumberTextField(
        counter: time.minuate,
      ),
      TimerNumberTextField(
        counter: time.second,
      )
    ]);
  }
}
