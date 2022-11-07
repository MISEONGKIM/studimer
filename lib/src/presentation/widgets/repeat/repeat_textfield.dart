import 'package:flutter/material.dart';
import 'package:studimer/src/core/resources/type.dart';
import 'package:studimer/src/presentation/providers/cycle_option_provider.dart';

class RepeatTextField extends StatelessWidget {
  RepeatTextField({Key? key, required this.provider}) : super(key: key);
  final CycleOptionProvider provider;
  final FocusNode _focus = FocusNode();
  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, dynamic provider) {
    currentFocus.unfocus();
    provider.setFocusOn(FocusNum.none);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.circular(7),
        ),
        child: TextFormField(
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          textInputAction: TextInputAction.done,
          onFieldSubmitted: (term) {
            _fieldFocusChange(context, _focus, provider);
          },
          onTap: () {
            provider.setFocusOn(FocusNum.repeat);
          },
          initialValue: provider.oneCycle.repeat.toString(),
          onChanged: (value) {
            final v = value == '' ? 1 : int.parse(value);
            provider.setRepeat(v);
          },
          readOnly: provider.timerStatus != TimerStatus.cancel,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
        ));
  }
}
