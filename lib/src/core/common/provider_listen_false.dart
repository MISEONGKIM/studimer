import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:studimer/src/presentation/providers/cycle_option_provider.dart';
import 'package:studimer/src/presentation/providers/timer_provider.dart';

Function cycleOptionProvider = (BuildContext context) =>
    Provider.of<CycleOptionProvider>(context, listen: false);

Function timerProvider = (BuildContext context) =>
    Provider.of<TimerProvider>(context, listen: false);
