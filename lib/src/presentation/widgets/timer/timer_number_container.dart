import 'package:flutter/material.dart';
import 'package:studimer/src/core/common/cycle_option_provider_consumer.dart';
import 'package:studimer/src/data/models/internal/time.dart';

import 'timer_number_picker_con.dart';
import 'timer_number_textfield_con.dart';

class TimerNumberContainer extends StatelessWidget {
  const TimerNumberContainer({Key? key, required this.time}) : super(key: key);
  final Time time;
  @override
  Widget build(BuildContext context) {
    return CycleOptionPrvdConsumer(
      builder: (context, provider) {
        return provider.isPicker
            ? TimerNumberPickerCon(time: time)
            : TimerNumberTextFieldCon(time: time);
      },
    );
  }
}
