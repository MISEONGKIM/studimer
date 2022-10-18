import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TimerNumberTextField extends StatelessWidget {
  const TimerNumberTextField(
      {Key? key, required this.counter, required this.maxValue})
      : super(key: key);
  final int counter;
  final int maxValue;

  @override
  Widget build(BuildContext context) {
    String max = maxValue.toString();
    return Expanded(
        child: TextFormField(
            inputFormatters: [
          LengthLimitingTextInputFormatter(2),
          // FilteringTextInputFormatter.allow(
          //     RegExp("[0-${int.parse(max[0])}][0-${int.parse(max[1])}]"))
        ],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            initialValue: counter.toString(),
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)));
  }
}
