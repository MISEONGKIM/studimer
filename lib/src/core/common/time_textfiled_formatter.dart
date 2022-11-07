import 'package:flutter/services.dart';

class TimeTextfeildFormatter extends TextInputFormatter {
  final int maxValue;
  TimeTextfeildFormatter(this.maxValue);
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text == "") return newValue;
    final newNum = int.parse(newValue.text.toString());
    if (newNum > maxValue) {
      return oldValue;
    }

    return newValue;
  }
}
