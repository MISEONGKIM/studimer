import 'package:flutter/services.dart';

class TimeTextfeildFormatter extends TextInputFormatter {
  final int maxValue;
  TimeTextfeildFormatter(this.maxValue);
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newNum =
        newValue.text == "" ? 0 : int.parse(newValue.text.toString());
    if (newNum > maxValue) {
      return oldValue;
    }

    return newValue;
  }
}
