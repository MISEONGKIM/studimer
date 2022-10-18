import 'package:flutter/material.dart';
import 'package:studimer/src/core/common/timer_provider_consumer.dart';
import 'timer_number_textfield.dart';

class TimerNumberTextFieldCon extends StatelessWidget {
  const TimerNumberTextFieldCon({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TimerPrvdConsumer(
        builder: (context, provider) => Row(children: [
              TimerNumberTextField(
                counter: provider.hour,
                maxValue: 12,
              ),
              TimerNumberTextField(
                counter: provider.minuate,
                maxValue: 59,
              ),
              TimerNumberTextField(
                counter: provider.second,
                maxValue: 59,
              )
            ]));
  }
}
