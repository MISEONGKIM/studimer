import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:studimer/src/core/common/time_textfiled_formatter.dart';
import 'package:studimer/src/core/utils/func.dart';

class TimerNumberTextField extends StatelessWidget {
  TimerNumberTextField({
    Key? key,
    required this.initialValue,
    required this.maxValue,
    required this.onSubmit,
  }) : super(key: key);
  final int initialValue;
  final int maxValue;
  final void Function(BuildContext, FocusNode, int) onSubmit;
  final FocusNode _focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: TextFormField(
            focusNode: _focus,
            inputFormatters: [
              LengthLimitingTextInputFormatter(2),
              TimeTextfeildFormatter(maxValue),
            ],
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (term) {
              onSubmit(context, _focus, stringToInt(term));
            },
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            initialValue: initialValue.toString(),
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)));
  }
}
