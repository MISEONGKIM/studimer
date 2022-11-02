import 'package:flutter/material.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({Key? key, required this.onPressed}) : super(key: key);
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(10),
            foregroundColor: Colors.white,
            textStyle:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            backgroundColor: Colors.brown),
        onPressed: () => onPressed(),
        child: const Text(
          '포기',
          textAlign: TextAlign.center,
        ));
  }
}
