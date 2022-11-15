import 'package:flutter/material.dart';
import 'package:studimer/src/core/resources/type.dart';
import 'package:studimer/src/core/utils/func.dart';
import 'package:studimer/src/presentation/providers/cycle_option_provider.dart';

class RepeatTextField extends StatelessWidget {
  RepeatTextField({Key? key, required this.provider}) : super(key: key);
  final CycleOptionProvider provider;
  final FocusNode focus = FocusNode();
  _fieldFocusChange(CycleOptionProvider provider, int value) {
    provider.setRepeat(value > 0 ? value : 1);
    provider.setTimeoutNoneFocusOn();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.white12,
            borderRadius: BorderRadius.circular(7),
          ),
          child: TextFormField(
            focusNode: focus,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (term) {
              _fieldFocusChange(provider, stringToInt(term));
            },
            onTap: provider.focusOn == FocusNum.none
                ? () {
                    provider.setFocusOn(FocusNum.repeat);
                  }
                : null,
            initialValue: provider.oneCycle.repeat.toString(),
            readOnly: provider.timerStatus != TimerStatus.cancel,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
          )),
      provider.focusOn == FocusNum.repeat
          ? Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                  onPressed: () {
                    focus.unfocus();
                    provider.setTimeoutNoneFocusOn();
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size.fromHeight(50),
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blueGrey[400]),
                  child: const Text(
                    '취소',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )))
          : const SizedBox.shrink()
    ]);
  }
}
