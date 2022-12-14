import 'package:flutter/material.dart';
import 'package:studimer/src/core/common/provider_consumer.dart';
import 'package:studimer/src/core/resources/type.dart';

import 'timer_number_picker_container.dart';
import 'timer_number_textfiled_container.dart';
import 'timer_text_container.dart';

class TimerWidget extends StatelessWidget {
  const TimerWidget({
    Key? key,
    required this.title,
    required this.consumer,
  }) : super(key: key);
  final String title;
  final Widget Function({dynamic builder}) consumer;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          CycleOptionPrvdConsumer(builder: (context, provider) {
            return provider.timerStatus == TimerStatus.cancel
                ? provider.focusOn == FocusNum.none
                    ? TimerNumberPickerContainer(
                        consumer: consumer,
                      )
                    : TimerNumberTextFieldContainer(
                        consumer: consumer,
                      )
                : TimerTextContainer(
                    consumer: consumer,
                  );
          })
        ]));
  }
}
