import 'alarm.dart';
import 'shared_preferences_class.dart';

class StudyCycle {
  Duration studyTime = Duration.zero;
  Duration restTime = Duration.zero;
  int? repeat = 1;
  Alarm alarm = Alarm.noticeList[0];

  StudyCycle() {
    _init();
  }

  _init() async {
    List<String> setting = (await SharedPreferencesClass.readDisk());
    if (setting.isEmpty) return;
    studyTime = Duration(seconds: int.parse(setting[0]));
    restTime = Duration(seconds: int.parse(setting[1]));
    repeat = int.parse(setting[2]);
    alarm = Alarm.noticeList
        .firstWhere((element) => element.alarmCode.toString() == setting[3]);
  }
}
