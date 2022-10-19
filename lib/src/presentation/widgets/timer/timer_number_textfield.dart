import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:studimer/src/core/common/provider_listen_false.dart';

class TimerNumberTextField extends StatelessWidget {
  TimerNumberTextField(
      {Key? key,
      required this.value,
      required this.maxValue,
      required this.onChange})
      : super(key: key);
  final int value;
  final int maxValue;
  final void Function(int) onChange;
  final FocusNode _focus = FocusNode();

  _fieldFocusChange(BuildContext context, FocusNode currentFocus) {
    currentFocus.unfocus();
    cycleOptionProvider(context).setIsPicker(true);
  }

  @override
  Widget build(BuildContext context) {
    String max = maxValue.toString();
    return Expanded(
        child: TextFormField(
            focusNode: _focus,
            inputFormatters: [
              LengthLimitingTextInputFormatter(2),
              // FilteringTextInputFormatter.allow(
              //     RegExp("[0-${int.parse(max[0])}][0-${int.parse(max[1])}]"))
            ],
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (term) {
              _fieldFocusChange(context, _focus);
            },
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            initialValue: value.toString(),
            onChanged: (value) => onChange(int.parse(value)),
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)));
  }
}
