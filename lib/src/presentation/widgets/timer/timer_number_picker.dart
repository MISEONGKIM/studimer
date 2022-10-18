import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class TimerNumberPicker extends StatelessWidget {
  const TimerNumberPicker(
      {Key? key,
      required this.value,
      required this.maxValueForPicker,
      required this.onChange})
      : super(key: key);
  final int value;
  final int maxValueForPicker;
  final void Function(int) onChange;

  @override
  Widget build(BuildContext context) {
    return NumberPicker(
      value: value,
      minValue: 0,
      maxValue: maxValueForPicker,
      step: 1,
      haptics: true,
      zeroPad: true,
      textStyle: const TextStyle(color: Colors.blueGrey, fontSize: 20),
      selectedTextStyle:
          const TextStyle(color: Colors.amberAccent, fontSize: 20),
      onChanged: (value) => onChange(value),
      infiniteLoop: true,
    );
  }
}
