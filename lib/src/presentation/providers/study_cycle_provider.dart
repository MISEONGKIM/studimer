import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:studimer/src/data/models/internal/study_cycle.dart';

class StudyCycleProvider extends ChangeNotifier {
  late StudyCycle oneCycle = StudyCycle();
  bool isPicker = false;
}
