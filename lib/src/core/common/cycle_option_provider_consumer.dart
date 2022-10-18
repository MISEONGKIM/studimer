import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:studimer/src/presentation/providers/cycle_option_provider.dart';

class CycleOptionPrvdConsumer extends StatelessWidget {
  const CycleOptionPrvdConsumer({Key? key, required this.builder})
      : super(key: key);
  final Widget Function(BuildContext, CycleOptionProvider) builder;
  @override
  Widget build(BuildContext context) {
    return Consumer<CycleOptionProvider>(
        builder: (context, provider, child) => builder(context, provider));
  }
}
