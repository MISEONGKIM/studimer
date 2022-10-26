import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:studimer/src/presentation/providers/cycle_option_provider.dart';
import 'package:studimer/src/presentation/providers/timer_provider.dart';

CycleOptionProvider cycleOptionProviderOf(BuildContext context) =>
    Provider.of<CycleOptionProvider>(context, listen: false);

T timerProviderOf<T extends TimerProvider>(BuildContext context) =>
    Provider.of<T>(context, listen: false);
