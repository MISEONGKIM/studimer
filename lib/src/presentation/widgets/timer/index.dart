import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studimer/src/core/common/provider_consumer.dart';
import 'package:studimer/src/core/resources/type.dart';
import 'package:studimer/src/presentation/widgets/timer/timer_number_container.dart';
import 'package:studimer/src/presentation/widgets/timer/timer_number_picker.dart';
import 'package:studimer/src/presentation/widgets/timer/timer_number_textfield.dart';

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
            childWidget(
                    {required int value,
                    required int maxValue,
                    required void Function(int) onChange}) =>
                provider.focusOn == FocusNum.none &&
                        provider.timerStatus != TimerStatus.start
                    ? TimerNumberPicker(
                        value: value,
                        maxValue: maxValue,
                        onChange: onChange,
                        focusNum: focusNum)
                    : TimerNumberTextField(
                        value: value,
                        maxValue: maxValue,
                        onChange: onChange,
                      );
            return provider.timerStatus == TimerStatus.start
                ? TimerTextContainer(
                    consumer: consumer,
                  )
                : TimerNumberContainer(
                    childWidget: childWidget,
                    consumer: consumer,
                  );
          })
        ]));
  }
}
