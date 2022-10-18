import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studimer/src/core/common/cycle_option_provider_consumer.dart';
import 'package:studimer/src/presentation/providers/timer_provider.dart';

import 'timer_number_picker_con.dart';
import 'timer_number_textfield_con.dart';

class TimerNumberContainer extends StatelessWidget {
  const TimerNumberContainer({Key? key, required this.time}) : super(key: key);
  final Duration time;
  @override
  Widget build(BuildContext context) {
    return CycleOptionPrvdConsumer(
      builder: (context, provider) {
        return provider.isPicker
            ? ChangeNotifierProvider(
                create: (_) => TimerProvider(time),
                child: const TimerNumberPickerCon())
            : ChangeNotifierProvider(
                create: (_) => TimerProvider(time),
                child: const TimerNumberTextFieldCon());
      },
    );
  }
}
