import 'package:flutter/cupertino.dart';
import 'package:studimer/src/data/models/internal/study_cycle.dart';

class CycleOptionProvider extends ChangeNotifier {
  late StudyCycle oneCycle = StudyCycle();
  bool isPicker = true;

  setIsPicker(bool value) {
    isPicker = value;
    notifyListeners();
  }

  setStudyTime(Duration newTime) {
    print(
      newTime.inHours,
    );
    print(newTime.inMinutes);
    print(newTime.inSeconds);
    oneCycle.studyTime = newTime;
  }

  setRestTime(Duration newTime) {
    oneCycle.restTime = newTime;
  }
}
