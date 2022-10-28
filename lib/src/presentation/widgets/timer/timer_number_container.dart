import 'package:flutter/material.dart';

class TimerNumberContainer extends StatelessWidget {
  const TimerNumberContainer(
      {Key? key, required this.childWidget, required this.consumer})
      : super(key: key);
  final Widget Function(
      {required int value,
      required int maxValue,
      required void Function(int) onChange}) childWidget;
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
            child: Row(children: [
              childWidget(
                onChange: (int newValue) {
                  provider.setHour(newValue);
                },
                value: provider.t.hour,
                maxValue: 12,
              ),
              childWidget(
                onChange: (int newValue) {
                  provider.setMinuate(newValue);
                },
                value: provider.t.minuate,
                maxValue: 59,
              ),
              childWidget(
                onChange: (int newValue) {
                  provider.setSecond(newValue);
                },
                value: provider.t.second,
                maxValue: 59,
              )
            ])));
  }
}
