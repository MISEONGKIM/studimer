import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studimer/src/core/common/provider_consumer.dart';
import 'package:studimer/src/presentation/providers/timer_provider.dart';
import 'package:studimer/src/presentation/widgets/timer/timer_number_container.dart';
import 'package:studimer/src/presentation/widgets/timer/timer_number_picker.dart';
import 'package:studimer/src/presentation/widgets/timer/timer_number_textfield.dart';

class TimerWidget extends StatelessWidget {
  const TimerWidget(
      {Key? key,
      required this.title,
      required this.time,
      required this.setTime})
      : super(key: key);
  final String title;
  final Duration time;
  final void Function(Duration newTime) setTime;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: Column(children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Container(
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.circular(7),
              ),
              child: CycleOptionPrvdConsumer(builder: (context, provider) {
                childWidget(
                        {required int value,
                        required int maxValue,
                        required void Function(int) onChange}) =>
                    provider.isPicker
                        ? TimerNumberPicker(
                            value: value,
                            maxValue: maxValue,
                            onChange: onChange)
                        : TimerNumberTextField(
                            value: value,
                            maxValue: maxValue,
                            onChange: onChange);
                return ChangeNotifierProvider(
                    create: (_) => TimerProvider(time, setTime),
                    child: TimerNumberContainer(childWidget: childWidget));
              }))
        ]));
  }
}
