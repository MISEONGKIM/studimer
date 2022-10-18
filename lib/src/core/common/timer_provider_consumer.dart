import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:studimer/src/presentation/providers/timer_provider.dart';

class TimerPrvdConsumer extends StatelessWidget {
  const TimerPrvdConsumer({Key? key, required this.builder}) : super(key: key);
  final Widget Function(BuildContext, TimerProvider) builder;
  @override
  Widget build(BuildContext context) {
    return Consumer<TimerProvider>(
        builder: (context, provider, child) => builder(context, provider));
  }
}
