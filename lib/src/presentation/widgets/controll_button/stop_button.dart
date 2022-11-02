import 'package:flutter/material.dart';

class StopButton extends StatelessWidget {
  const StopButton(
      {Key? key, required this.buttonText, required this.onPressed})
      : super(key: key);
  final String buttonText;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(20),
            foregroundColor: Colors.white,
            textStyle:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            backgroundColor: Colors.blueGrey),
        onPressed: () => onPressed(),
        child: Text(buttonText));
  }
}
