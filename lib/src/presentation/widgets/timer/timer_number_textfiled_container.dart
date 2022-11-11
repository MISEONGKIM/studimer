import 'package:flutter/material.dart';
import 'package:studimer/src/core/common/provider_listen_false.dart';
import 'package:studimer/src/core/resources/type.dart';
import 'timer_number_textfield.dart';

class TimerNumberTextFieldContainer extends StatelessWidget {
  const TimerNumberTextFieldContainer({Key? key, required this.consumer})
      : super(key: key);
  final Widget Function({dynamic builder}) consumer;

  _fieldFocusChange(void Function(int) onChange) =>
      (BuildContext context, FocusNode currentFocus, int value) {
        final cProvider = cycleOptionProviderOf(context);
        currentFocus.unfocus();
        onChange(value);
        cProvider.setFocusOn(FocusNum.none);
      };

  @override
  Widget build(BuildContext context) {
    return consumer(builder: (context, provider) {
      return Container(
          margin: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            color: Colors.white12,
            borderRadius: BorderRadius.circular(7),
          ),
          child: Row(children: [
            TimerNumberTextField(
                initialValue: provider.t.hour,
                maxValue: 12,
                onSubmit: _fieldFocusChange(provider.setHour)),
            TimerNumberTextField(
                initialValue: provider.t.minuate,
                maxValue: 59,
                onSubmit: _fieldFocusChange(provider.setMinuate)),
            TimerNumberTextField(
                initialValue: provider.t.second,
                maxValue: 59,
                onSubmit: _fieldFocusChange(provider.setSecond)),
          ]));
    });
  }
}
