import 'package:flutter/material.dart';
import 'package:studimer/src/core/common/provider_consumer.dart';

class TimerNumberContainer extends StatelessWidget {
  const TimerNumberContainer({Key? key, required this.childWidget})
      : super(key: key);
  final Widget Function(
      {required int value,
      required int maxValue,
      required void Function(int) onChange}) childWidget;
  @override
  Widget build(BuildContext context) {
    return TimerPrvdConsumer(
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
                value: provider.hour,
                maxValue: 12,
              ),
              childWidget(
                onChange: (int newValue) {
                  provider.setMinuate(newValue);
                },
                value: provider.minuate,
                maxValue: 59,
              ),
              childWidget(
                onChange: (int newValue) {
                  provider.setSecond(newValue);
                },
                value: provider.second,
                maxValue: 59,
              )
            ])));
  }
}
