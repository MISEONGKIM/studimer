import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:studimer/src/core/common/provider_listen_false.dart';
import 'package:studimer/src/core/resources/type.dart';

class TimerNumberPicker extends StatelessWidget {
  const TimerNumberPicker(
      {Key? key,
      required this.value,
      required this.maxValue,
      required this.focusNum,
      required this.onChange})
      : super(key: key);
  final int value;
  final int maxValue;
  final FocusNum focusNum;
  final void Function(int) onChange;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          final provider = cycleOptionProviderOf(context);
          provider.setFocusOn(focusNum);
        },
        child: NumberPicker(
          value: value,
          minValue: 0,
          maxValue: maxValue,
          step: 1,
          haptics: true,
          zeroPad: true,
          textStyle: const TextStyle(color: Colors.blueGrey, fontSize: 17),
          selectedTextStyle:
              const TextStyle(color: Colors.amberAccent, fontSize: 17),
          onChanged: (value) => onChange(value),
          infiniteLoop: true,
        ));
  }
}
