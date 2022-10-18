import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:studimer/src/presentation/providers/timer_provider.dart';

Function timerProvider = (BuildContext context) =>
    Provider.of<TimerProvider>(context, listen: false);
