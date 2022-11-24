import 'package:flutter/material.dart';
import 'package:studimer/src/core/common/provider_listen_false.dart';
import 'package:studimer/src/presentation/providers/cycle_option_provider.dart';
import 'timer_number_textfield.dart';

class TimerNumberTextFieldContainer extends StatelessWidget {
  TimerNumberTextFieldContainer({Key? key, required this.consumer})
      : super(key: key);
  final Widget Function({dynamic builder}) consumer;
  final List<FocusNode> focusList =
      List<FocusNode>.generate(3, (int index) => FocusNode());

  _fieldFocusChange(
          CycleOptionProvider cProvider, void Function(int) onChange) =>
      (BuildContext context, int value) {
        onChange(value);
        cProvider.setTimeoutNoneFocusOn();
      };

  @override
  Widget build(BuildContext context) {
    final cProvider = cycleOptionProviderOf(context);
    return consumer(builder: (context, provider) {
      return Column(children: [
        Container(
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.circular(7),
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              TimerNumberTextField(
                  focus: focusList[0],
                  initialValue: provider.t.hours,
                  maxValue: 12,
                  onSubmit: _fieldFocusChange(cProvider, provider.setHours)),
              TimerNumberTextField(
                  focus: focusList[1],
                  initialValue: provider.t.minutes,
                  maxValue: 59,
                  onSubmit: _fieldFocusChange(cProvider, provider.setMinutes)),
              TimerNumberTextField(
                  focus: focusList[2],
                  initialValue: provider.t.seconds,
                  maxValue: 59,
                  onSubmit: _fieldFocusChange(cProvider, provider.setSeconds)),
            ])),
        Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 20),
            child: ElevatedButton(
                onPressed: () {
                  focusList.firstWhere((focus) => focus.hasFocus, orElse: () {
                    return FocusNode();
                  }).unfocus();
                  cProvider.setTimeoutNoneFocusOn();
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size.fromHeight(50),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blueGrey[400]),
                child: const Text(
                  '취소',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                )))
      ]);
    });
  }
}
