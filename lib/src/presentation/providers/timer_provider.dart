import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:studimer/src/data/models/internal/time.dart';

class TimerProvider extends ChangeNotifier {
  Time time = Time();
  bool isPicker = false;
}
