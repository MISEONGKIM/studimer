import 'package:flutter/material.dart';

class TimerNumberTextField extends StatelessWidget {
  const TimerNumberTextField({Key? key, required this.counter})
      : super(key: key);
  final int counter;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: TextInputType.number,
        initialValue: counter.toString(),
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold));
  }
}
