import 'package:flutter/cupertino.dart';
import 'package:studimer/src/core/common/provider_consumer.dart';

class TimerTextContainer extends StatelessWidget {
  const TimerTextContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
    return TimerPrvdConsumer(
        builder: (context, provider) => Row(children: [
              Text(provider.lpadZeroFormatter(provider.hour), style: style),
              Text(provider.lpadZeroFormatter(provider.minuate), style: style),
              Text(provider.lpadZeroFormatter(provider.second), style: style)
            ]));
  }
}
