import 'package:flutter/material.dart';

class TimerTextContainer extends StatelessWidget {
  const TimerTextContainer({Key? key, required this.consumer})
      : super(key: key);
  final Widget Function({dynamic builder}) consumer;
  @override
  Widget build(BuildContext context) {
    return consumer(builder: (context, provider) {
      final style = TextStyle(
          fontSize: 70,
          fontWeight: FontWeight.bold,
          color: provider.t.isRunning ? Colors.orangeAccent : Colors.white);

      return Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.all(10),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(provider.t.lpadZeroFormatter(provider.t.hour), style: style),
            Text(
              ' : ',
              style: style,
            ),
            Text(provider.t.lpadZeroFormatter(provider.t.minuate),
                style: style),
            Text(
              ' : ',
              style: style,
            ),
            Text(provider.t.lpadZeroFormatter(provider.t.second), style: style)
          ]));
    });
  }
}
