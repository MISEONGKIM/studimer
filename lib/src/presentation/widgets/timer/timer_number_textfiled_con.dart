import 'package:flutter/material.dart';
import 'timer_number_textfiled.dart';

class TimerNumberTextfiledCon extends StatelessWidget {
  const TimerNumberTextfiledCon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      TimerNumberTextField(
        counter: counter,
      ),
      TimerNumberTextField(
        counter: counter.value,
      ),
      TimerNumberTextField(
        counter: counter.value,
      )
    ]);
  }
}
