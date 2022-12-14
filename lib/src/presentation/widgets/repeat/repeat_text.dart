import 'package:flutter/material.dart';
import 'package:studimer/src/presentation/providers/cycle_option_provider.dart';

class RepeatText extends StatelessWidget {
  const RepeatText({Key? key, required this.provider}) : super(key: key);
  final CycleOptionProvider provider;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 90,
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Text(
          provider.repeatCount.toString(),
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ));
  }
}
