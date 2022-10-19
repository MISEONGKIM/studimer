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
        builder: (context, provider) => Row(children: [
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
            ]));
  }
}
