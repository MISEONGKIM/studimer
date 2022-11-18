import 'package:flutter/material.dart';
import 'timer_number_picker.dart';

class TimerNumberPickerContainer extends StatelessWidget {
  const TimerNumberPickerContainer({Key? key, required this.consumer})
      : super(key: key);
  final Widget Function({dynamic builder}) consumer;

  @override
  Widget build(BuildContext context) {
    return consumer(
        builder: (context, provider) => Container(
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.circular(7),
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              TimerNumberPicker(
                  onChange: (int newValue) {
                    provider.setHours(newValue);
                  },
                  value: provider.t.hours,
                  maxValue: 12,
                  focusNum: provider.focusNum),
              TimerNumberPicker(
                  onChange: (int newValue) {
                    provider.setMinutes(newValue);
                  },
                  value: provider.t.minutes,
                  maxValue: 59,
                  focusNum: provider.focusNum),
              TimerNumberPicker(
                  onChange: (int newValue) {
                    provider.setSeconds(newValue);
                  },
                  value: provider.t.seconds,
                  maxValue: 59,
                  focusNum: provider.focusNum)
            ])));
  }
}
