import 'package:flutter/material.dart';
import 'package:studimer/src/core/resources/type.dart';

import 'timer_number_picker.dart';

class TimerNumberPickerContainer extends StatelessWidget {
  const TimerNumberPickerContainer(
      {Key? key, required this.focusNum, required this.consumer})
      : super(key: key);
  final Widget Function({dynamic builder}) consumer;
  final FocusNum focusNum;
  @override
  Widget build(BuildContext context) {
    return consumer(
        builder: (context, provider) => Container(
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.circular(7),
            ),
            child: Row(children: [
              TimerNumberPicker(
                  onChange: (int newValue) {
                    provider.setHour(newValue);
                  },
                  value: provider.t.hour,
                  maxValue: 12,
                  focusNum: focusNum),
              TimerNumberPicker(
                  onChange: (int newValue) {
                    provider.setMinuate(newValue);
                  },
                  value: provider.t.minuate,
                  maxValue: 59,
                  focusNum: focusNum),
              TimerNumberPicker(
                  onChange: (int newValue) {
                    provider.setSecond(newValue);
                  },
                  value: provider.t.second,
                  maxValue: 59,
                  focusNum: focusNum)
            ])));
  }
}
