import 'package:flutter/material.dart';
import 'package:studimer/src/core/common/provider_consumer.dart';

class TimerTextContainer extends StatelessWidget {
  const TimerTextContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TimerPrvdConsumer<>(builder: (context, provider) {
      final style = TextStyle(
          fontSize: 70,
          fontWeight: FontWeight.bold,
          color: provider.isRunning ? Colors.orangeAccent : Colors.white);

      return Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.all(10),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(provider.lpadZeroFormatter(provider.hour), style: style),
            Text(
              ' : ',
              style: style,
            ),
            Text(provider.lpadZeroFormatter(provider.minuate), style: style),
            Text(
              ' : ',
              style: style,
            ),
            Text(provider.lpadZeroFormatter(provider.second), style: style)
          ]));
    });
  }
}
