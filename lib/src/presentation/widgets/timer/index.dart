import 'package:flutter/material.dart';
import 'package:studimer/src/core/common/provider_consumer.dart';
import 'package:studimer/src/core/resources/type.dart';

import 'timer_number_picker_container.dart';
import 'timer_number_textfiled_container.dart';
import 'timer_text_container.dart';

class TimerWidget<T> extends StatelessWidget {
  const TimerWidget({
    Key? key,
    required this.title,
    required this.focusNum,
    required this.consumer,
  }) : super(key: key);
  final String title;
  final FocusNum focusNum;
  final Widget Function({dynamic builder}) consumer;
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
          CycleOptionPrvdConsumer(builder: (context, provider) {
            return provider.timerStatus == TimerStatus.cancel
                ? provider.focusOn == FocusNum.none
                    ? TimerNumberPickerContainer(
                        consumer: consumer,
                        focusNum: focusNum,
                      )
                    : Column(children: [
                        TimerNumberTextFieldContainer(
                          consumer: consumer,
                        ),
                        provider.focusOn == FocusNum.studytime ||
                                provider.focusOn == FocusNum.resttime
                            ? Container(
                                width: double.infinity,
                                margin: const EdgeInsets.only(top: 20),
                                child: ElevatedButton(
                                    onPressed: () =>
                                        provider.setFocusOn(FocusNum.none),
                                    style: ElevatedButton.styleFrom(
                                        fixedSize: const Size.fromHeight(50),
                                        foregroundColor: Colors.white,
                                        backgroundColor: Colors.blueGrey[400]),
                                    child: const Text(
                                      '취소',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )))
                            : const SizedBox.shrink()
                      ])
                : TimerTextContainer(
                    consumer: consumer,
                  );
          })
        ]));
  }
}
