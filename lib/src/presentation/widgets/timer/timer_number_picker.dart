import 'package:flutter/cupertino.dart';
import 'package:numberpicker/numberpicker.dart';

class TimerNumberPicker extends StatelessWidget {
  const TimerNumberPicker(
      {Key? key, required this.value, required this.onChange})
      : super(key: key);
  final int value;
  final void Function(int) onChange;

  @override
  Widget build(BuildContext context) {
    return NumberPicker(
      value: value,
      minValue: 0,
      maxValue: 9,
      step: 1,
      haptics: true,
      onChanged: (value) => onChange(value),
    );
  }
}
