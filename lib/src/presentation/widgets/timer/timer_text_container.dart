import 'package:flutter/material.dart';

class TimerTextContainer extends StatelessWidget {
  const TimerTextContainer({Key? key, required this.consumer})
      : super(key: key);
  final Widget Function({dynamic builder}) consumer;
  @override
  Widget build(BuildContext context) {
    return consumer(builder: (context, provider) {
      const style = TextStyle(
        fontSize: 60,
        fontWeight: FontWeight.bold,
      );

      return Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 10),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(provider.t.lpadZeroFormatter(provider.t.hour), style: style),
            const Text(
              ' : ',
              style: style,
            ),
            Text(provider.t.lpadZeroFormatter(provider.t.minuate),
                style: style),
            const Text(
              ' : ',
              style: style,
            ),
            Text(provider.t.lpadZeroFormatter(provider.t.second), style: style)
          ]));
    });
  }
}
