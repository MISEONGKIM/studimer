import 'package:flutter/material.dart';
import 'package:studimer/src/core/common/provider_listen_false.dart';
import 'package:studimer/src/core/common/time_textfiled_formatter.dart';
import 'package:studimer/src/core/resources/type.dart';

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

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, dynamic provider) {
    currentFocus.unfocus();
    provider.setFocusOn(FocusNum.none);
  }

  @override
  Widget build(BuildContext context) {
    final provider = cycleOptionProviderOf(context);
    return Expanded(
        child: TextFormField(
            focusNode: _focus,
            inputFormatters: [
              TimeTextfeildFormatter(maxValue),
            ],
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (term) {
              _fieldFocusChange(context, _focus, provider);
            },
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            initialValue: value.toString(),
            onChanged: (value) {
              final v = value == '' ? 0 : int.parse(value);
              onChange(v);
            },
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)));
  }
}
