import 'package:flutter/material.dart';
import 'package:studimer/src/core/common/study_cycle_provodier_consumer.dart';

import 'timer_number_picker_con.dart';
import 'timer_number_textfiled_con.dart';

class TimerNumberContainer extends StatelessWidget {
  const TimerNumberContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StudyCyclePrvdConsumer(
      builder: (context, provider) {
        return provider.isPicker
            ? const TimerNumberPickerCon()
            : const TimerNumberTextfiledCon();
      },
    );
  }
}
