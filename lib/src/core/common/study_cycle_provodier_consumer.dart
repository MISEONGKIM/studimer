import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:studimer/src/presentation/providers/study_cycle_provider.dart';

class StudyCyclePrvdConsumer extends StatelessWidget {
  const StudyCyclePrvdConsumer({Key? key, required this.builder})
      : super(key: key);
  final Widget Function(BuildContext, StudyCycleProvider) builder;
  @override
  Widget build(BuildContext context) {
    return Consumer<StudyCycleProvider>(
        builder: (context, provider, child) => builder(context, provider));
  }
}
